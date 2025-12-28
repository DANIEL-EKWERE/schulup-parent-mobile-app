// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:schulupparent/adminparent/presentation/direct_message_screen/controller/direct_message_controller.dart';
// //import 'package:schulupparent/adminparent/presentation/signalr_chat/controller/signalr_service.dart';

// import 'controller/chatController.dart';
// import 'controller/signalr_service.dart' as student;

// /// Chat Screen UI

// //StudentSignalRChatService1 servic = Get.lazyPut(() => StudentSignalRChatService1());
// ChatController1 controller = Get.put(ChatController1());
// final student.StudentSignalRChatService1 _chatService = Get.put(
//   student.StudentSignalRChatService1(),
// );

// class ChatScreen extends GetView<ChatController1> {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat'),
//         actions: [
//           Obx(
//             () => Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Center(
//                 child: Text(
//                   Get.find<student.StudentSignalRChatService1>()
//                       .connectionStatus
//                       .value,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color:
//                         Get.find<student.StudentSignalRChatService1>()
//                                 .isConnected
//                                 .value
//                             ? Colors.green
//                             : Colors.red,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               _chatService.connect();
//             },
//             icon: Icon(Icons.refresh),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Messages list
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (controller.messages.isEmpty) {
//                 return const Center(
//                   child: Text('No messages yet. Start the conversation!'),
//                 );
//               }

//               return ListView.builder(
//                 controller: controller.scrollController,
//                 padding: const EdgeInsets.all(16),
//                 itemCount: controller.messages.length,
//                 itemBuilder: (context, index) {
//                   final message = controller.messages[index];
//                   final isMe = message.senderUserId == controller.userId;

//                   return _buildMessageBubble(message, isMe, context);
//                 },
//               );
//             }),
//           ),

//           // Message input
//           _buildMessageInput(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageBubble(
//     student.Message message,
//     bool isMe,
//     BuildContext context,
//   ) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 12),
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width * 0.7,
//         ),
//         child: Column(
//           crossAxisAlignment:
//               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             if (!isMe)
//               Padding(
//                 padding: const EdgeInsets.only(left: 8, bottom: 4),
//                 child: Text(
//                   message.senderName,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             GestureDetector(
//               onLongPress: isMe ? () => _showDeleteDialog(message) : null,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 decoration: BoxDecoration(
//                   color: isMe ? Colors.blue : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       message.messageText,
//                       style: TextStyle(
//                         color: isMe ? Colors.white : Colors.black87,
//                         fontSize: 15,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       _formatTime(message.sentAt),
//                       style: TextStyle(
//                         color: isMe ? Colors.white70 : Colors.black54,
//                         fontSize: 11,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMessageInput(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 4,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: controller.messageController,
//                 decoration: InputDecoration(
//                   hintText: 'Type a message...',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(24),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 10,
//                   ),
//                 ),
//                 maxLines: null,
//                 textInputAction: TextInputAction.send,
//                 onSubmitted: (_) => controller.sendMessage(),
//               ),
//             ),
//             const SizedBox(width: 8),
//             Obx(
//               () => CircleAvatar(
//                 backgroundColor: Colors.blue,
//                 child:
//                     controller.isSendingMessage.value
//                         ? const SizedBox(
//                           width: 20,
//                           height: 20,
//                           child: CircularProgressIndicator(
//                             color: Colors.white,
//                             strokeWidth: 2,
//                           ),
//                         )
//                         : IconButton(
//                           icon: const Icon(Icons.send, color: Colors.white),
//                           onPressed: controller.sendMessage,
//                         ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showDeleteDialog(student.Message message) {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Delete Message'),
//         content: const Text('Are you sure you want to delete this message?'),
//         actions: [
//           TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
//           TextButton(
//             onPressed: () {
//               Get.back();
//               controller.deleteMessage(message.messageId);
//             },
//             child: const Text('Delete', style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatTime(String sentAt) {
//     try {
//       final dateTime = DateTime.parse(sentAt);
//       final now = DateTime.now();
//       final difference = now.difference(dateTime);

//       if (difference.inDays > 0) {
//         return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//       } else if (difference.inHours > 0) {
//         return '${difference.inHours}h ago';
//       } else if (difference.inMinutes > 0) {
//         return '${difference.inMinutes}m ago';
//       } else {
//         return 'Just now';
//       }
//     } catch (e) {
//       return sentAt;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'dart:convert';
import 'dart:async';
import 'package:schulupparent/student/core/utils/storage.dart';
import 'package:intl/intl.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

// ============================================================================
// MESSAGE MODEL
// ============================================================================

class ChatMessage {
  final int messageId;
  final int conversationId;
  final int senderUserId;
  final String senderName;
  final String messageText;
  final String sentAt;
  final bool isMine;

  ChatMessage({
    required this.messageId,
    required this.conversationId,
    required this.senderUserId,
    required this.senderName,
    required this.messageText,
    required this.sentAt,
    required this.isMine,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json, int currentUserId) {
    return ChatMessage(
      messageId: json['messageId'] ?? 0,
      conversationId: json['conversationId'] ?? 0,
      senderUserId: json['senderUserId'] ?? 0,
      senderName: json['senderName'] ?? 'Unknown',
      messageText: json['messageText'] ?? '',
      sentAt: json['sentAt'] ?? DateTime.now().toIso8601String(),
      isMine: json['senderType'] == 4,
    );
  }
}

// ============================================================================
// CHAT CONTROLLER
// ============================================================================

class ChatController extends GetxController {
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  // Observable state
  final messages = <ChatMessage>[].obs;
  final isLoading = false.obs;
  final isSendingMessage = false.obs;
  final isPolling = true.obs;

  // Configuration
  late String apiBaseUrl;
  late String jwtToken;
  late int userId;
  late int conversationId;
  late String teacherName;
  Rx<String> subject = 'N/A'.obs;

  // Polling timer
  Timer? _pollingTimer;
  int _lastMessageId = 0;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeChat();
    });
  }

  Future<void> _initializeChat() async {
    // Get configuration
    apiBaseUrl = 'https://api.schulup.com/api';
    jwtToken = await studentDataBase.getToken() ?? '';
    userId = await studentDataBase.getUserId() ?? 84178;
    conversationId = Get.arguments['conversationId'] ?? 1;
    teacherName = Get.arguments['teacherName'] ?? 'Class Teacher';
    subject.value = Get.arguments['subject'] ?? 'General';

    // Load initial messages
    await loadMessages();

    // Start polling for new messages every 3 seconds
    _startPolling();
  }

  /// Start polling for new messages
  void _startPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (isPolling.value) {
        _checkForNewMessages();
      }
    });
  }

  /// Check for new messages (silent polling)
  Future<void> _checkForNewMessages() async {
    try {
      final response = await http
          .get(
            Uri.parse(
              '$apiBaseUrl/chat/conversations/$conversationId/messages?page=1&pageSize=20',
            ),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              'Authorization': 'Bearer $jwtToken',
            },
          )
          .timeout(Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final messagesList =
            (data['data']['messages'] as List)
                .map((json) => ChatMessage.fromJson(json, userId))
                .toList();

        // Check if there are new messages
        if (messagesList.isNotEmpty) {
          final latestMessageId = messagesList.first.messageId;

          if (latestMessageId > _lastMessageId) {
            messages.value = messagesList.reversed.toList();
            _lastMessageId = latestMessageId;
            _scrollToBottom();
          }
        }
      }
    } catch (e) {
      // Silent fail for polling
      print('Polling error: $e');
    }
  }

  /// Load messages from API
  Future<void> loadMessages() async {
    isLoading.value = true;
    print('loading messages... with conversation ID ${conversationId}');
    try {
      final response = await http.get(
        Uri.parse(
          '$apiBaseUrl/chat/conversations/$conversationId/messages?page=1&pageSize=20',
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final messagesList =
            (data['data']['messages'] as List)
                .map((json) => ChatMessage.fromJson(json, userId))
                .toList();

        messages.value = messagesList.reversed.toList();

        if (messagesList.isNotEmpty) {
          _lastMessageId = messagesList.first.messageId;
        }

        _scrollToBottom();
      } else {
        Get.snackbar(
          'Error',
          'Failed to load messages',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
        );
      }
    } catch (e) {
      print('Error loading messages: $e');
      Get.snackbar(
        'Error',
        'Failed to load messages',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Send a message
  Future<void> sendMessage() async {
    if (messageController.text.trim().isEmpty) return;

    final messageText = messageController.text.trim();
    messageController.clear();

    isSendingMessage.value = true;

    // Optimistically add message to UI
    final optimisticMessage = ChatMessage(
      messageId: DateTime.now().millisecondsSinceEpoch,
      conversationId: conversationId,
      senderUserId: userId,
      senderName: 'You',
      messageText: messageText,
      sentAt: DateTime.now().toIso8601String(),
      isMine: true,
    );

    messages.add(optimisticMessage);
    _scrollToBottom();

    try {
      final response = await http.post(
        Uri.parse('$apiBaseUrl/chat/conversations/$conversationId/sendmessage'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
        body: json.encode({'messageText': messageText}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Message sent successfully');
        // Immediately check for the sent message
        await Future.delayed(Duration(milliseconds: 500));
        await _checkForNewMessages();
      } else {
        // Remove optimistic message on failure
        messages.removeWhere(
          (msg) => msg.messageId == optimisticMessage.messageId,
        );

        Get.snackbar(
          'Error',
          'Failed to send message',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
        );

        messageController.text = messageText;
      }
    } catch (e) {
      print('Error sending message: $e');

      // Remove optimistic message on error
      messages.removeWhere(
        (msg) => msg.messageId == optimisticMessage.messageId,
      );

      Get.snackbar(
        'Error',
        'Failed to send message',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );

      messageController.text = messageText;
    } finally {
      isSendingMessage.value = false;
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    _pollingTimer?.cancel();
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

// ============================================================================
// CHAT SCREEN UI
// ============================================================================

DashboardExtendedViewController dashboardController = Get.put(
  DashboardExtendedViewController(),
);

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFFF8C42),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context), //Get.back(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () =>
                  controller.subject.value == 'N/A'
                      ? Text(
                        'Subject Loading....',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                      : Text(
                        controller.subject.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
            ),
            Obx(
              () => Text(
                controller.isPolling.value
                    ? dashboardController.selectedStudent1!.firstName!
                    : 'Offline',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        controller.isPolling.value ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: Color(0xFFFF8C42)),
                );
              }

              if (controller.messages.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No messages yet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Start the conversation!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                controller: controller.scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return _MessageBubble(message: message);
                },
              );
            }),
          ),

          // Message input
          _MessageInput(),
        ],
      ),
    );
  }
}

// ============================================================================
// MESSAGE BUBBLE WIDGET
// ============================================================================

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment:
            message.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Message bubble
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: message.isMine ? Color(0xFFFFF4D4) : Color(0xFFB3E5FC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message.messageText,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),

          SizedBox(height: 4),

          // Timestamp and sender name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!message.isMine) ...[
                  Text(
                    message.senderName,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  Text(
                    ' • ',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
                Text(
                  _formatTime(message.sentAt),
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(String sentAt) {
    try {
      final dateTime = DateTime.parse(sentAt);
      return DateFormat('hh:mma • MMM. d, yyyy').format(dateTime);
    } catch (e) {
      return sentAt;
    }
  }
}

// ============================================================================
// MESSAGE INPUT WIDGET
// ============================================================================

class _MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFFFF4D4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Text input
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  maxLines: null,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => controller.sendMessage(),
                ),
              ),
            ),

            SizedBox(width: 8),

            // Send button
            Obx(
              () => GestureDetector(
                onTap:
                    controller.isSendingMessage.value
                        ? null
                        : controller.sendMessage,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8C42),
                    shape: BoxShape.circle,
                  ),
                  child:
                      controller.isSendingMessage.value
                          ? Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          )
                          : Icon(Icons.send, color: Colors.white, size: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
