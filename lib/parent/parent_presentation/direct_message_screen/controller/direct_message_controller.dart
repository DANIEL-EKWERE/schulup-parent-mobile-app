// import 'package:get/get.dart';
// import 'package:schulupparent/adminparent/core/utils/storage.dart';
// import 'package:schulupparent/adminparent/presentation/direct_message_screen/controller/signal_r_chat_service.dart';
// import 'dart:async';

// import 'package:signalr_netcore/hub_connection.dart';

// class ChatController extends GetxController {
//   late SignalRChatService _signalRService;

//   // Observable lists
//   var conversations = <Conversation>[].obs;
//   var messages = <ChatMessage>[].obs;
//   var isConnected = false.obs;
//   var isLoadingMessages = false.obs;
//   var isSendingMessage = false.obs;

//   // Current conversation
//   var currentConversationId = ''.obs;
//   var isTyping = false.obs;

//   // Typing timer
//   Timer? _typingTimer;

//   // Stream subscriptions
//   StreamSubscription? _messageSubscription;
//   StreamSubscription? _connectionSubscription;
//   StreamSubscription? _readSubscription;

//   @override
//   void onInit() {
//     super.onInit();
//     _initializeSignalR();
//   }

//   /// Initialize SignalR service
//   void _initializeSignalR() async {
//     // Get token from storage (adjust based on your auth implementation)
//     // final token = Get.find<AuthController>().token.value; // or from SharedPreferences
//     final token = await dataBase.getToken(); // or from SharedPreferences
//     final baseUrl =
//         'https://api.schulup.com/hubs/conversation'; // Your API base URL

//     _signalRService = SignalRChatService(baseUrl: baseUrl, token: token);

//     _connectToSignalR();
//   }

//   /// Connect to SignalR hub
//   Future<void> _connectToSignalR() async {
//     try {
//       await _signalRService.connect();
//       isConnected.value = true;

//       // Setup event listeners
//       _setupEventListeners();

//       Get.snackbar(
//         'Connected',
//         'Real-time chat enabled',
//         snackPosition: SnackPosition.TOP,
//         duration: Duration(seconds: 2),
//       );
//     } catch (e) {
//       isConnected.value = false;
//       Get.snackbar(
//         'Connection Error',
//         'Failed to connect to chat: $e',
//         snackPosition: SnackPosition.TOP,
//       );
//     }
//   }

//   /// Setup SignalR event listeners
//   void _setupEventListeners() {
//     // Listen for new messages
//     _messageSubscription = _signalRService.onNewMessage.listen((message) {
//       _handleNewMessage(message);
//     });

//     // Listen for connection state changes
//     _connectionSubscription = _signalRService.onConnectionStateChanged.listen((
//       state,
//     ) {
//       isConnected.value = (state == HubConnectionState.Connected);
//     });

//     // Listen for message read events
//     _readSubscription = _signalRService.onMessageRead.listen((event) {
//       if (event.conversationId == currentConversationId.value) {
//         _updateMessagesReadStatus();
//       }
//     });
//   }

//   /// Handle incoming message
//   void _handleNewMessage(ChatMessage message) {
//     // If it's for the current conversation, add to messages list
//     if (message.conversationId == currentConversationId.value) {
//       messages.insert(0, message);

//       // Mark as read if conversation is open
//       _signalRService.markConversationAsRead(message.conversationId);
//     }

//     // Update conversation list
//     _updateConversationWithNewMessage(message);

//     // Show notification if not in current conversation
//     if (message.conversationId != currentConversationId.value) {
//       Get.snackbar(
//         message.senderName,
//         message.content,
//         snackPosition: SnackPosition.TOP,
//         duration: Duration(seconds: 3),
//       );
//     }
//   }

//   /// Update messages read status
//   void _updateMessagesReadStatus() {
//     for (var i = 0; i < messages.length; i++) {
//       messages[i] = ChatMessage(
//         id: messages[i].id,
//         conversationId: messages[i].conversationId,
//         senderId: messages[i].senderId,
//         senderName: messages[i].senderName,
//         senderAvatar: messages[i].senderAvatar,
//         content: messages[i].content,
//         sentAt: messages[i].sentAt,
//         isRead: true,
//         attachments: messages[i].attachments,
//       );
//     }
//     messages.refresh();
//   }

//   /// Update conversation list with new message
//   void _updateConversationWithNewMessage(ChatMessage message) {
//     final index = conversations.indexWhere(
//       (c) => c.id == message.conversationId,
//     );

//     if (index != -1) {
//       final conv = conversations[index];
//       conversations[index] = Conversation(
//         id: conv.id,
//         participantId: conv.participantId,
//         participantName: conv.participantName,
//         participantAvatar: conv.participantAvatar,
//         lastMessage: message.content,
//         lastMessageTime: message.sentAt,
//         unreadCount:
//             message.conversationId == currentConversationId.value
//                 ? 0
//                 : conv.unreadCount + 1,
//         isArchived: conv.isArchived,
//       );
//       conversations.refresh();
//     }
//   }

//   /// Open conversation
//   Future<void> openConversation(String conversationId) async {
//     try {
//       currentConversationId.value = conversationId;

//       // Join SignalR conversation room
//       await _signalRService.joinConversation(conversationId);

//       // Load messages
//       await loadMessages(conversationId);

//       // Mark as read
//       await _signalRService.markConversationAsRead(conversationId);
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to open conversation: $e');
//     }
//   }

//   /// Close conversation
//   Future<void> closeConversation() async {
//     if (currentConversationId.value.isNotEmpty) {
//       await _signalRService.leaveConversation(currentConversationId.value);
//       currentConversationId.value = '';
//       messages.clear();
//     }
//   }

//   /// Load messages
//   Future<void> loadMessages(
//     String conversationId, {
//     bool loadMore = false,
//   }) async {
//     if (isLoadingMessages.value) return;

//     try {
//       isLoadingMessages.value = true;

//       final loadedMessages = await _signalRService.getMessages(
//         conversationId: conversationId,
//         page: loadMore ? (messages.length ~/ 50) + 1 : 1,
//         pageSize: 50,
//       );

//       if (loadMore) {
//         messages.addAll(loadedMessages);
//       } else {
//         messages.value = loadedMessages;
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to load messages: $e');
//     } finally {
//       isLoadingMessages.value = false;
//     }
//   }

//   /// Send message
//   Future<void> sendMessage(
//     String content, {
//     List<String>? attachmentIds,
//   }) async {
//     if (content.trim().isEmpty && (attachmentIds?.isEmpty ?? true)) return;
//     if (currentConversationId.value.isEmpty) return;

//     try {
//       isSendingMessage.value = true;

//       final message = await _signalRService.sendMessage(
//         conversationId: currentConversationId.value,
//         content: content,
//         attachmentIds: attachmentIds,
//       );

//       // Message will be added via SignalR event
//       // But add optimistically for better UX
//       messages.insert(0, message);
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to send message: $e');
//     } finally {
//       isSendingMessage.value = false;
//     }
//   }

//   /// Handle typing
//   void handleTyping() {
//     if (currentConversationId.value.isEmpty) return;

//     // Cancel previous timer
//     _typingTimer?.cancel();

//     // Send typing indicator
//     if (!isTyping.value) {
//       isTyping.value = true;
//       _signalRService.sendTypingIndicator(currentConversationId.value);
//     }

//     // Reset typing after 3 seconds
//     _typingTimer = Timer(Duration(seconds: 3), () {
//       isTyping.value = false;
//     });
//   }

//   /// Reconnect to SignalR
//   Future<void> reconnect() async {
//     await _connectToSignalR();
//   }

//   @override
//   void onClose() {
//     _typingTimer?.cancel();
//     _messageSubscription?.cancel();
//     _connectionSubscription?.cancel();
//     _readSubscription?.cancel();
//     _signalRService.dispose();
//     super.onClose();
//   }
// }

// // ============ Conversation Model ============

// class Conversation {
//   final String id;
//   final String participantId;
//   final String participantName;
//   final String? participantAvatar;
//   final String? lastMessage;
//   final DateTime? lastMessageTime;
//   final int unreadCount;
//   final bool isArchived;

//   Conversation({
//     required this.id,
//     required this.participantId,
//     required this.participantName,
//     this.participantAvatar,
//     this.lastMessage,
//     this.lastMessageTime,
//     required this.unreadCount,
//     required this.isArchived,
//   });

//   factory Conversation.fromJson(Map<String, dynamic> json) {
//     return Conversation(
//       id: json['id'] ?? '',
//       participantId: json['participantId'] ?? '',
//       participantName: json['participantName'] ?? 'Unknown',
//       participantAvatar: json['participantAvatar'],
//       lastMessage: json['lastMessage'],
//       lastMessageTime:
//           json['lastMessageTime'] != null
//               ? DateTime.parse(json['lastMessageTime'])
//               : null,
//       unreadCount: json['unreadCount'] ?? 0,
//       isArchived: json['isArchived'] ?? false,
//     );
//   }
// }
