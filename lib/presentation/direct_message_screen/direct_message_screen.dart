// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:schulupparent/core/utils/storage.dart';
// import 'package:schulupparent/presentation/direct_message_screen/controller/direct_message_controller.dart';
// import 'package:schulupparent/presentation/direct_message_screen/controller/signal_r_chat_service.dart';

// class ChatScreen extends GetView<ChatController> {
//   final TextEditingController _messageController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();

//   ChatScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Obx(() {
//           // Get current conversation details
//           final conv = controller.conversations.firstWhereOrNull(
//             (c) => c.id == controller.currentConversationId.value,
//           );

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(conv?.participantName ?? 'Chat'),
//               Obx(
//                 () => Text(
//                   controller.isConnected.value ? 'Online' : 'Offline',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color:
//                         controller.isConnected.value
//                             ? Colors.green
//                             : Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//         actions: [
//           Obx(
//             () =>
//                 controller.isConnected.value
//                     ? GestureDetector(
//                       onTap: () {
//                         controller.reconnect;
//                       },
//                       child: Icon(Icons.circle, color: Colors.green, size: 12),
//                     )
//                     : IconButton(
//                       icon: Icon(Icons.refresh),
//                       onPressed: controller.reconnect,
//                     ),
//           ),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Messages list
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoadingMessages.value &&
//                   controller.messages.isEmpty) {
//                 return Center(child: CircularProgressIndicator());
//               }

//               if (controller.messages.isEmpty) {
//                 return Center(
//                   child: Text('No messages yet\nStart the conversation!'),
//                 );
//               }

//               return ListView.builder(
//                 controller: _scrollController,
//                 reverse: true,
//                 padding: EdgeInsets.all(16),
//                 itemCount: controller.messages.length,
//                 itemBuilder: (context, index) {
//                   final message = controller.messages[index];
//                   final isMe =
//                       message.senderId ==
//                       'currentUserId'; // Replace with actual user ID

//                   return _buildMessageBubble(message, isMe);
//                 },
//               );
//             }),
//           ),

//           // Typing indicator
//           Obx(
//             () =>
//                 controller.isTyping.value
//                     ? Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 8,
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             'Someone is typing...',
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     : SizedBox.shrink(),
//           ),

//           // Message input
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageBubble(ChatMessage message, bool isMe) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 8),
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         constraints: BoxConstraints(maxWidth: Get.width * 0.75),
//         decoration: BoxDecoration(
//           color: isMe ? Color(0xFFFF8D2A) : Colors.grey.shade200,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//             bottomLeft: isMe ? Radius.circular(16) : Radius.circular(4),
//             bottomRight: isMe ? Radius.circular(4) : Radius.circular(16),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (!isMe)
//               Text(
//                 message.senderName,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12,
//                   color: Colors.grey.shade700,
//                 ),
//               ),
//             if (!isMe) SizedBox(height: 4),
//             Text(
//               message.content,
//               style: TextStyle(
//                 color: isMe ? Colors.white : Colors.black87,
//                 fontSize: 15,
//               ),
//             ),
//             SizedBox(height: 4),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   _formatTime(message.sentAt),
//                   style: TextStyle(
//                     fontSize: 10,
//                     color: isMe ? Colors.white70 : Colors.grey.shade600,
//                   ),
//                 ),
//                 if (isMe) ...[
//                   SizedBox(width: 4),
//                   Icon(
//                     message.isRead ? Icons.done_all : Icons.done,
//                     size: 14,
//                     color: message.isRead ? Colors.blue : Colors.white70,
//                   ),
//                 ],
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMessageInput() {
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade300,
//             blurRadius: 4,
//             offset: Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(Icons.attach_file),
//             onPressed: () async {
//               // Handle attachment
//               var token = await dataBase.getToken();
//               controller.reconnect;
//               // SignalRChatService.connect();
//               SignalRChatService conn = SignalRChatService(
//                 baseUrl: 'https://api.schulup.com/hubs/conversations',
//                 token: token,
//               );
//               conn.connect();
//             },
//           ),
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               decoration: InputDecoration(
//                 hintText: 'Type a message...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(24),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 10,
//                 ),
//               ),
//               maxLines: null,
//               textInputAction: TextInputAction.newline,
//               onChanged: (value) {
//                 controller.handleTyping();
//               },
//             ),
//           ),
//           SizedBox(width: 8),
//           Obx(
//             () =>
//                 controller.isSendingMessage.value
//                     ? CircularProgressIndicator()
//                     : IconButton(
//                       icon: Icon(Icons.send, color: Color(0xFFFF8D2A)),
//                       onPressed: () {
//                         final message = _messageController.text.trim();
//                         if (message.isNotEmpty) {
//                           controller.sendMessage(message);
//                           _messageController.clear();
//                         }
//                       },
//                     ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatTime(DateTime dateTime) {
//     final now = DateTime.now();
//     final difference = now.difference(dateTime);

//     if (difference.inDays > 0) {
//       return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//     } else if (difference.inHours > 0) {
//       return '${difference.inHours}h ago';
//     } else if (difference.inMinutes > 0) {
//       return '${difference.inMinutes}m ago';
//     } else {
//       return 'Just now';
//     }
//   }
// }
