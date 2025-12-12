// import 'dart:async';
// import 'package:schulupparent/adminparent/core/utils/storage.dart';
// import 'package:signalr_netcore/signalr_client.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:developer' as myLog;

// class SignalRChatService {
//   HubConnection? _hubConnection;
//   final String baseUrl;
//   final String token;

//   // Stream controllers for real-time events
//   final _newMessageController = StreamController<ChatMessage>.broadcast();
//   final _messageReadController = StreamController<MessageReadEvent>.broadcast();
//   final _connectionStateController =
//       StreamController<HubConnectionState>.broadcast();

//   // Getters for streams
//   Stream<ChatMessage> get onNewMessage => _newMessageController.stream;
//   Stream<MessageReadEvent> get onMessageRead => _messageReadController.stream;
//   Stream<HubConnectionState> get onConnectionStateChanged =>
//       _connectionStateController.stream;

//   bool get isConnected => _hubConnection?.state == HubConnectionState.Connected;

//   SignalRChatService({required this.baseUrl, required this.token});

//   /// Initialize and connect to SignalR hub
//   // Future<void> connect() async {
//   //   try {
//   //     // Build SignalR hub URL
//   //     final hubUrl =
//   //         'https://api.schulup.com/hubs/conversation'; // Adjust endpoint as needed

//   //     _hubConnection =
//   //         HubConnectionBuilder()
//   //             .withUrl(
//   //               hubUrl,
//   //               options: HttpConnectionOptions(
//   //                 accessTokenFactory: () async => await dataBase.getToken(),
//   //                 skipNegotiation: false,
//   //                 //   transport: HttpTransportType.WebSockets,
//   //                 requestTimeout: 100000, // 100 seconds
//   //               ),
//   //             )
//   //             .withAutomaticReconnect(
//   //               retryDelays: [0, 2000, 5000, 10000, 30000],
//   //             )
//   //             .build();
//   //     void _logInfo(String message) =>
//   //         myLog.log(message, name: 'SignalRChatService', level: 800);
//   //     void _logWarning(String message, [Object? error]) => myLog.log(
//   //       message,
//   //       name: 'SignalRChatService',
//   //       level: 900,
//   //       error: error,
//   //     );
//   //     void _logSevere(String message, [Object? error, StackTrace? st]) =>
//   //         myLog.log(
//   //           message,
//   //           name: 'SignalRChatService',
//   //           level: 1000,
//   //           error: error,
//   //           stackTrace: st,
//   //         );

//   //     // Initial logs
//   //     _logInfo('Initializing SignalR HubConnection for $hubUrl');
//   //     _logInfo('Using token: ${token.isNotEmpty ? "present" : "missing"}');

//   //     // Optional: attach hub connection lifecycle logging (setupEventHandlers also logs)
//   //     _hubConnection?.onclose(({error}) {
//   //       _logWarning('SignalR connection closed: $error', error);
//   //     });
//   //     _hubConnection?.onreconnecting(({error}) {
//   //       _logWarning('SignalR reconnecting: $error', error);
//   //     });
//   //     _hubConnection?.onreconnected(({connectionId}) {
//   //       _logInfo('SignalR reconnected: $connectionId');
//   //     });
//   //     // Setup event handlers BEFORE connecting
//   //     _setupEventHandlers();

//   //     // Connect
//   //     await _hubConnection!.start();
//   //     print('SignalR Connected successfully');
//   //     _connectionStateController.add(HubConnectionState.Connected);
//   //   } catch (e) {
//   //     print('SignalR connection error: $e');
//   //     _connectionStateController.add(HubConnectionState.Disconnected);
//   //     rethrow;
//   //   }
//   // }

//   Future<void> connect() async {
//     try {
//       print('🔌 Connecting to SignalR...');
//       var token = await dataBase.getToken();
//       _hubConnection =
//           HubConnectionBuilder()
//               .withUrl(
//                 'https://api.schulup.com/hubs/conversation',
//                 options: HttpConnectionOptions(
//                   accessTokenFactory: () async => token,
//                   skipNegotiation: true,
//                   transport: HttpTransportType.WebSockets,
//                   requestTimeout: 15000,
//                 ),
//               )
//               .withAutomaticReconnect()
//               .build();

//       // Listen for messages
//       _hubConnection!.on('ReceiveMessage', (arguments) {
//         print('📩 New message: $arguments');
//       });

//       // Start connection
//       await _hubConnection!.start();
//       print('✅ Connected!');
//     } catch (e) {
//       print('❌ Connection failed: $e');
//     }
//     _hubConnection!.onclose(({error}) {
//       print("Connection closed${error != null ? ': $error' : ''}");
//       // Optional: Try reconnecting or alert the user
//     });
//   }

//   // Future<void> disconnect() async {
//   //   await _hubConnection?.stop();
//   //   print('🔌 Disconnected');
//   // }
//   /// Setup SignalR event handlers
//   void _setupEventHandlers() {
//     // Listen for new messages
//     _hubConnection!.on('ReceiveMessage', _handleReceiveMessage);

//     // Listen for message read events
//     _hubConnection!.on('MessageRead', _handleMessageRead);

//     // Listen for typing indicator
//     _hubConnection!.on('UserTyping', _handleUserTyping);

//     // Connection state changes
//     // _hubConnection!.onclose((Exception? error) async {
//     // print('SignalR connection closed: $error');
//     // _connectionStateController.add(HubConnectionState.Disconnected);
//     // });
//     _hubConnection!.onclose(({error}) {
//       print('SignalR connection closed: $error');
//       _connectionStateController.add(HubConnectionState.Disconnected);
//     });

//     // _hubConnection!.onreconnecting((error) {
//     // print('SignalR reconnecting...');
//     // _connectionStateController.add(HubConnectionState.Reconnecting);
//     // });
//     _hubConnection!.onreconnecting(({error}) {
//       print('SignalR reconnecting...');
//       _connectionStateController.add(HubConnectionState.Reconnecting);
//     });
//     // _hubConnection!.onreconnected((connectionId) {
//     // print('SignalR reconnected: $connectionId');
//     // _connectionStateController.add(HubConnectionState.Connected);
//     // });

//     _hubConnection!.onreconnected(({connectionId}) {
//       print('SignalR reconnected: $connectionId');
//       _connectionStateController.add(HubConnectionState.Connected);
//     });
//   }

//   /// Handle incoming message
//   void _handleReceiveMessage(List<Object?>? arguments) {
//     if (arguments != null && arguments.isNotEmpty) {
//       try {
//         final messageData = arguments[0] as Map<String, dynamic>;
//         final message = ChatMessage.fromJson(messageData);
//         _newMessageController.add(message);
//       } catch (e) {
//         print('Error parsing message: $e');
//       }
//     }
//   }

//   /// Handle message read event
//   void _handleMessageRead(List<Object?>? arguments) {
//     if (arguments != null && arguments.length >= 2) {
//       try {
//         final conversationId = arguments[0] as String;
//         final userId = arguments[1] as String;
//         _messageReadController.add(
//           MessageReadEvent(conversationId: conversationId, userId: userId),
//         );
//       } catch (e) {
//         print('Error parsing message read event: $e');
//       }
//     }
//   }

//   /// Handle user typing
//   void _handleUserTyping(List<Object?>? arguments) {
//     if (arguments != null && arguments.length >= 2) {
//       final conversationId = arguments[0] as String;
//       final userName = arguments[1] as String;
//       print('$userName is typing in conversation $conversationId');
//     }
//   }

//   // ============ REST API + SignalR Methods ============

//   /// Join a conversation (SignalR)
//   Future<void> joinConversation(String conversationId) async {
//     if (!isConnected) {
//       throw Exception('SignalR not connected');
//     }

//     try {
//       await _hubConnection!.invoke('JoinConversation', args: [conversationId]);
//       print('Joined conversation: $conversationId');
//     } catch (e) {
//       print('Error joining conversation: $e');
//       rethrow;
//     }
//   }

//   /// Leave a conversation (SignalR)
//   Future<void> leaveConversation(String conversationId) async {
//     if (!isConnected) return;

//     try {
//       await _hubConnection!.invoke('LeaveConversation', args: [conversationId]);
//       print('Left conversation: $conversationId');
//     } catch (e) {
//       print('Error leaving conversation: $e');
//     }
//   }

//   /// Send a message (via REST API, real-time updates via SignalR)
//   Future<ChatMessage> sendMessage({
//     required String conversationId,
//     required String content,
//     List<String>? attachmentIds,
//   }) async {
//     try {
//       myLog.log(conversationId);
//       final response = await http.post(
//         Uri.parse('$baseUrl/chat/conversations/$conversationId/sendmessage'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           // 'conversationId': conversationId,
//           // 'content': content,
//           // 'attachmentIds': attachmentIds ?? [],
//           "messageText": content, //"greetings sir, how do u do?",
//         }),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final message = ChatMessage.fromJson(jsonDecode(response.body));

//         // Notify via SignalR (if needed)
//         if (isConnected) {
//           await _hubConnection!.invoke(
//             'SendMessage',
//             args: [conversationId, message.id, content],
//           );
//         }

//         return message;
//       } else {
//         throw Exception('Failed to send message: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error sending message: $e');
//       rethrow;
//     }
//   }

//   /// Get messages in conversation (REST API)
//   Future<List<ChatMessage>> getMessages({
//     required String conversationId,
//     int page = 1,
//     int pageSize = 50,
//   }) async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//           '$baseUrl/chat/getall-messagesin-conversation?conversationId=$conversationId&page=$page&pageSize=$pageSize',
//         ),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final List<dynamic> messagesJson = data['data'] ?? [];
//         return messagesJson.map((m) => ChatMessage.fromJson(m)).toList();
//       } else {
//         throw Exception('Failed to load messages: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error loading messages: $e');
//       rethrow;
//     }
//   }

//   /// Mark conversation as read (REST API + SignalR notification)
//   Future<void> markConversationAsRead(String conversationId) async {
//     try {
//       final response = await http.put(
//         Uri.parse('$baseUrl/chat/conversation-markasread'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({'conversationId': conversationId}),
//       );

//       if (response.statusCode == 200) {
//         // Notify other users via SignalR
//         if (isConnected) {
//           await _hubConnection!.invoke('MarkAsRead', args: [conversationId]);
//         }
//       }
//     } catch (e) {
//       print('Error marking as read: $e');
//     }
//   }

//   /// Send typing indicator (SignalR only)
//   Future<void> sendTypingIndicator(String conversationId) async {
//     if (!isConnected) return;

//     try {
//       await _hubConnection!.invoke(
//         'SendTypingIndicator',
//         args: [conversationId],
//       );
//     } catch (e) {
//       print('Error sending typing indicator: $e');
//     }
//   }

//   /// Disconnect from SignalR
//   Future<void> disconnect() async {
//     try {
//       await _hubConnection?.stop();
//       _connectionStateController.add(HubConnectionState.Disconnected);
//     } catch (e) {
//       print('Error disconnecting: $e');
//     }
//   }

//   /// Dispose resources
//   void dispose() {
//     _newMessageController.close();
//     _messageReadController.close();
//     _connectionStateController.close();
//     disconnect();
//   }
// }

// // ============ Models ============

// class ChatMessage {
//   final String id;
//   final String conversationId;
//   final String senderId;
//   final String senderName;
//   final String? senderAvatar;
//   final String content;
//   final DateTime sentAt;
//   final bool isRead;
//   final List<String>? attachments;

//   ChatMessage({
//     required this.id,
//     required this.conversationId,
//     required this.senderId,
//     required this.senderName,
//     this.senderAvatar,
//     required this.content,
//     required this.sentAt,
//     required this.isRead,
//     this.attachments,
//   });

//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       id: json['id'] ?? '',
//       conversationId: json['conversationId'] ?? '',
//       senderId: json['senderId'] ?? '',
//       senderName: json['senderName'] ?? 'Unknown',
//       senderAvatar: json['senderAvatar'],
//       content: json['content'] ?? '',
//       sentAt:
//           json['sentAt'] != null
//               ? DateTime.parse(json['sentAt'])
//               : DateTime.now(),
//       isRead: json['isRead'] ?? false,
//       attachments:
//           json['attachments'] != null
//               ? List<String>.from(json['attachments'])
//               : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'conversationId': conversationId,
//       'senderId': senderId,
//       'senderName': senderName,
//       'senderAvatar': senderAvatar,
//       'content': content,
//       'sentAt': sentAt.toIso8601String(),
//       'isRead': isRead,
//       'attachments': attachments,
//     };
//   }
// }

// class MessageReadEvent {
//   final String conversationId;
//   final String userId;

//   MessageReadEvent({required this.conversationId, required this.userId});
// }
