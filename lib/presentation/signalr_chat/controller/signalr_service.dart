import 'package:get/get.dart';
import 'package:signalr_netcore/signalr_client.dart';

/// Model classes
class Message {
  final int messageId;
  final int conversationId;
  final int senderUserId;
  final int senderType;
  final String senderName;
  final String messageText;
  final String sentAt;
  final List<dynamic> attachments;

  Message({
    required this.messageId,
    required this.conversationId,
    required this.senderUserId,
    required this.senderType,
    required this.senderName,
    required this.messageText,
    required this.sentAt,
    required this.attachments,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageID'] ?? 0,
      conversationId: json['conversationID'] ?? 0,
      senderUserId: json['senderUserID'] ?? 0,
      senderType: json['senderType'] ?? 0,
      senderName: json['senderName'] ?? '',
      messageText: json['messageText'] ?? '',
      sentAt: json['sentAt'] ?? '',
      attachments: json['attachments'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageID': messageId,
      'conversationID': conversationId,
      'senderUserID': senderUserId,
      'senderType': senderType,
      'senderName': senderName,
      'messageText': messageText,
      'sentAt': sentAt,
      'attachments': attachments,
    };
  }
}

class Conversation {
  final int id;
  final String title;
  final DateTime? updatedAt;

  Conversation({required this.id, required this.title, this.updatedAt});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.tryParse(json['updatedAt'])
              : null,
    );
  }
}

/// SignalR Chat Service
class SignalRChatService extends GetxService {
  HubConnection? _hubConnection;

  // Observable state
  final isConnected = false.obs;
  final connectionStatus = 'Not Connected'.obs;
  final messages = <Message>[].obs;

  // Configuration
  String? _apiBaseUrl;
  String? _jwtToken;
  int? _currentUserId;
  int? _currentConversationId;

  // Event callbacks (you can subscribe to these in your controllers)
  final _onMessageReceived = <Function(Message)>[].obs;
  final _onConversationUpdated = <Function(Conversation)>[].obs;
  final _onConversationCreated = <Function(Conversation)>[].obs;
  final _onMessageDeleted = <Function(Map<String, dynamic>)>[].obs;
  final _onAttachmentUploaded = <Function(Map<String, dynamic>)>[].obs;

  /// Initialize the service with configuration
  void configure({
    required String apiBaseUrl,
    required String jwtToken,
    required int userId,
  }) {
    _apiBaseUrl = apiBaseUrl;
    _jwtToken = jwtToken;
    _currentUserId = userId;
  }

  /// Connect to SignalR hub
  Future<void> connect() async {
    if (_apiBaseUrl == null || _jwtToken == null) {
      Get.snackbar(
        'Configuration Error',
        'Please configure the service first',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (_hubConnection != null) {
      await disconnect();
    }

    final hubUrl = 'https://api.schulup.com/hubs/conversation';
    connectionStatus.value = 'Connecting...';

    try {
      _hubConnection =
          HubConnectionBuilder()
              .withUrl(
                hubUrl,
                options: HttpConnectionOptions(
                  skipNegotiation: true,
                  accessTokenFactory: () async => _jwtToken!,
                  logger:
                      null, //(level, message) => print('SignalR: $message'),
                ),
              )
              .withAutomaticReconnect()
              .build();

      _setupEventHandlers();

      await _hubConnection!.start();
      isConnected.value = true;
      connectionStatus.value = 'Connected';

      print('✅ Successfully connected to SignalR hub');

      // Auto-join user group if userId is set
      if (_currentUserId != null) {
        await joinUserGroup(_currentUserId!);
      }
    } catch (e) {
      isConnected.value = false;
      connectionStatus.value = 'Connection Failed';
      print('❌ Connection failed: $e');

      Get.snackbar(
        'Connection Error',
        'Failed to connect to chat server: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Setup event handlers for SignalR events
  void _setupEventHandlers() {
    if (_hubConnection == null) return;

    // MessageReceived event
    _hubConnection!.on('MessageReceived', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final message = Message.fromJson(arguments[0] as Map<String, dynamic>);
        messages.add(message);
        print('📨 MessageReceived: ${message.messageText}');

        // Notify all subscribers
        for (var callback in _onMessageReceived) {
          callback(message);
        }
      }
    });

    // ConversationUpdated event
    _hubConnection!.on('ConversationUpdated', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final conversation = Conversation.fromJson(
          arguments[0] as Map<String, dynamic>,
        );
        print('🔄 ConversationUpdated: ${conversation.title}');

        for (var callback in _onConversationUpdated) {
          callback(conversation);
        }
      }
    });

    // ConversationCreated event
    _hubConnection!.on('ConversationCreated', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final conversation = Conversation.fromJson(
          arguments[0] as Map<String, dynamic>,
        );
        print('➕ ConversationCreated: ${conversation.title}');

        for (var callback in _onConversationCreated) {
          callback(conversation);
        }
      }
    });

    // MessageDeleted event
    _hubConnection!.on('MessageDeleted', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final data = arguments[0] as Map<String, dynamic>;
        print('🗑️ MessageDeleted: $data');

        // Remove from local messages list
        messages.removeWhere((msg) => msg.messageId == data['messageId']);

        for (var callback in _onMessageDeleted) {
          callback(data);
        }
      }
    });

    // AttachmentUploaded event
    _hubConnection!.on('AttachmentUploaded', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final data = arguments[0] as Map<String, dynamic>;
        print('📎 AttachmentUploaded: $data');

        for (var callback in _onAttachmentUploaded) {
          callback(data);
        }
      }
    });

    // Connection lifecycle events
    _hubConnection!.onclose(({error}) {
      isConnected.value = false;
      connectionStatus.value = 'Disconnected';
      if (error != null) {
        print('❌ Connection closed with error: $error');
      } else {
        print('🔌 Connection closed');
      }
    });

    _hubConnection!.onreconnecting(({error}) {
      isConnected.value = false;
      connectionStatus.value = 'Reconnecting...';
      print('🔄 Reconnecting... Error: $error');
    });

    _hubConnection!.onreconnected(({connectionId}) {
      isConnected.value = true;
      connectionStatus.value = 'Connected (Reconnected)';
      print('✅ Reconnected with connection ID: $connectionId');

      // Rejoin groups after reconnection
      if (_currentUserId != null) {
        joinUserGroup(_currentUserId!);
      }
      if (_currentConversationId != null) {
        joinConversation(_currentConversationId!);
      }
    });
  }

  /// Join user group to receive user-specific notifications
  Future<void> joinUserGroup(int userId) async {
    if (!_checkConnection()) return;

    try {
      await _hubConnection!.invoke('JoinUserGroup', args: [userId]);
      _currentUserId = userId;
      print('✅ Successfully joined user group: $userId');
    } catch (e) {
      print('❌ Failed to join user group: $e');
      Get.snackbar(
        'Error',
        'Failed to join user group',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Join a conversation to receive messages
  Future<void> joinConversation(int conversationId) async {
    if (!_checkConnection()) return;

    try {
      await _hubConnection!.invoke('JoinConversation', args: [conversationId]);
      _currentConversationId = conversationId;
      print('✅ Successfully joined conversation: $conversationId');
    } catch (e) {
      print('❌ Failed to join conversation: $e');
      Get.snackbar(
        'Error',
        'Failed to join conversation',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Leave a conversation
  Future<void> leaveConversation(int conversationId) async {
    if (!_checkConnection()) return;

    try {
      await _hubConnection!.invoke('LeaveConversation', args: [conversationId]);
      if (_currentConversationId == conversationId) {
        _currentConversationId = null;
      }
      print('✅ Successfully left conversation: $conversationId');
    } catch (e) {
      print('❌ Failed to leave conversation: $e');
    }
  }

  /// Disconnect from SignalR hub
  Future<void> disconnect() async {
    if (_hubConnection != null) {
      try {
        await _hubConnection!.stop();
        isConnected.value = false;
        connectionStatus.value = 'Disconnected';
        print('🔌 Disconnected from SignalR hub');
      } catch (e) {
        print('❌ Error during disconnect: $e');
      } finally {
        _hubConnection = null;
        _currentConversationId = null;
      }
    }
  }

  /// Check if connection is active
  bool _checkConnection() {
    if (_hubConnection == null || !isConnected.value) {
      print('❌ Not connected to SignalR hub');
      Get.snackbar(
        'Not Connected',
        'Please connect to the chat server first',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  /// Subscribe to message received events
  void onMessageReceived(Function(Message) callback) {
    _onMessageReceived.add(callback);
  }

  /// Subscribe to conversation updated events
  void onConversationUpdated(Function(Conversation) callback) {
    _onConversationUpdated.add(callback);
  }

  /// Subscribe to conversation created events
  void onConversationCreated(Function(Conversation) callback) {
    _onConversationCreated.add(callback);
  }

  /// Subscribe to message deleted events
  void onMessageDeleted(Function(Map<String, dynamic>) callback) {
    _onMessageDeleted.add(callback);
  }

  /// Subscribe to attachment uploaded events
  void onAttachmentUploaded(Function(Map<String, dynamic>) callback) {
    _onAttachmentUploaded.add(callback);
  }

  /// Clear messages
  void clearMessages() {
    messages.clear();
  }

  @override
  void onClose() {
    disconnect();
    super.onClose();
  }
}
