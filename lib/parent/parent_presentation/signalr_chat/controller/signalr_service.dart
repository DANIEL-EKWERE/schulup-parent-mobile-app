import 'dart:async';

import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'package:signalr_netcore3/signalr_client.dart';

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

  final transportProtLogger = Logger("SignalR - transport");

  /// Connect to SignalR hub
  //import 'package:signalr_core/signalr_core.dart';

  Future<void> connect() async {
    if (_apiBaseUrl == null || _jwtToken == null) {
      Get.snackbar('Error', 'Please configure the service first');
      return;
    }

    // Stop existing connection
    if (_hubConnection != null &&
        _hubConnection!.state != HubConnectionState.Disconnected) {
      await _hubConnection!.stop();
    }

    final hubUrl = 'https://api.schulup.com/hubs/conversation';
    connectionStatus.value = 'Connecting...';

    // Setup logging (optional, for debugging)
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('SignalR ${rec.level.name}: ${rec.message}');
    });

    // Configure connection options
    final httpConnectionOptions = HttpConnectionOptions(
      accessTokenFactory: () => Future.value(_jwtToken),
      logMessageContent: true,
      requestTimeout: 1500000, // 60 seconds (default is 30)
      // ✅ ADD KEEP-ALIVE SETTINGS
      logger: Logger("SignalR"),
     // transport: HttpTransportType.ServerSentEvents,
      skipNegotiation: false, // Try both true and false
    );

    // Build the connection
    _hubConnection =
        HubConnectionBuilder()
            .withUrl(hubUrl, options: httpConnectionOptions)
            .withAutomaticReconnect(retryDelays: [0, 2000, 5000, 10000, 30000])
            .configureLogging(Logger("SignalR"))
            .build();

    // Setup event handlers
    _setupConnectionHandlers();

    // Start the connection
    try {
      print("🔌 Starting SignalR connection...");
      _hubConnection!.keepAliveIntervalInMilliseconds = 10 * 60 * 60 * 1000;
      await _hubConnection!.start();
      print("✅ Connected to SignalR Hub!");
      print("Connection ID: ${_hubConnection!.connectionId}");
      print("Connection State: ${_hubConnection!.state}");
      connectionStatus.value = 'Connected';

      // Setup message listeners
      _setupMessageListeners();
    } catch (e, s) {
      print("❌ SignalR connection error: $e");
      print("Error type: ${e.runtimeType}");
      print("Stack trace: $s");
      connectionStatus.value = 'Failed';

      Get.snackbar(
        'Connection Failed',
        'Could not connect to chat service: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5),
      );
    }
  }

  void _setupConnectionHandlers() {
    _hubConnection?.onclose(({error}) {
      print("❌ Connection closed: $error");
      connectionStatus.value = 'Disconnected';
    });

    _hubConnection?.onreconnecting(({error}) {
      print("🔄 Reconnecting: $error");
      connectionStatus.value = 'Reconnecting...';
    });

    _hubConnection?.onreconnected(({connectionId}) {
      print("✅ Reconnected! Connection ID: $connectionId");
      connectionStatus.value = 'Connected';
    });
  }

  void _setupMessageListeners() {
    // Listen for messages from server
    _hubConnection?.on('ReceiveMessage', (arguments) {
      print("📩 Message received: $arguments");
      // Handle incoming message
      if (arguments != null && arguments.isNotEmpty) {
        final message = arguments[0];
        // Process your message here
        print("Message content: $message");
      }
    });

    // Add other listeners as needed
    _hubConnection?.on('UserJoined', (arguments) {
      print("👤 User joined: $arguments");
    });

    _hubConnection?.on('UserLeft', (arguments) {
      print("👋 User left: $arguments");
    });
  }

  // Send a message
  Future<void> sendMessage(String message) async {
    if (_hubConnection?.state != HubConnectionState.Connected) {
      print("❌ Cannot send message - not connected");
      Get.snackbar('Error', 'Not connected to chat service');
      return;
    }

    try {
      await _hubConnection!.invoke('SendMessage', args: [message]);
      print("✉️ Message sent: $message");
    } catch (e) {
      print("❌ Error sending message: $e");
      Get.snackbar('Error', 'Failed to send message');
    }
  }

  // Disconnect
  Future<void> disconnect() async {
    if (_hubConnection != null) {
      await _hubConnection!.stop();
      print("🔌 Disconnected from SignalR");
      connectionStatus.value = 'Disconnected';
    }
  }

  // Dispose
  void dispose() {
    disconnect();
    _hubConnection = null;
  }

  void _setupConnectionHandlers1() {
    _hubConnection?.onclose(({error}) {
      print("❌ Connection closed: $error");
      connectionStatus.value = 'Disconnected';
    });

    _hubConnection?.onreconnecting(({error}) {
      print("🔄 Reconnecting: $error");
      connectionStatus.value = 'Reconnecting...';
    });

    _hubConnection?.onreconnected(({connectionId}) {
      print("✅ Reconnected! ID: $connectionId");
      connectionStatus.value = 'Connected';
    });
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
  Future<void> disconnect1() async {
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
