import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schulupparent/parent/core/utils/storage.dart';
import 'dart:convert';

import 'package:schulupparent/parent/parent_presentation/signalr_chat/controller/signalr_service.dart';

// Import your SignalRChatService here
// import 'signalr_chat_service.dart';

/// Chat Controller
class ChatController1 extends GetxController {
  final SignalRChatService _chatService = Get.find<SignalRChatService>();

  final messageController = TextEditingController();
  final scrollController = ScrollController();

  // Observable state
  final messages = <Message>[].obs;
  final isLoading = false.obs;
  final isSendingMessage = false.obs;

  // Configuration
  late String apiBaseUrl;
  late String jwtToken;
  late int userId;
  late int conversationId;

  @override
  void onInit() async {
    super.onInit();

    // Get configuration from arguments or storage
    apiBaseUrl = 'https://api.schulup.com/api';
    jwtToken = await getToken(); //Get.arguments['jwtToken'] ?? '';
    userId = 84178;
    conversationId = 1;

    _initializeChat();
  }

  Future<String> getToken() async {
    return await dataBase.getToken();
  }

  setValue() async {
    jwtToken = await getToken();
  }

  Future<void> _initializeChat() async {
    // Configure and connect to SignalR
    _chatService.configure(
      apiBaseUrl: apiBaseUrl,
      jwtToken: jwtToken,
      userId: userId,
    );

    // Subscribe to message events
    _chatService.onMessageReceived((message) {
      messages.add(message);
      _scrollToBottom();
    });

    _chatService.onMessageDeleted((data) {
      messages.removeWhere((msg) => msg!.messageId == data['messageId']);
    });

    // Connect and join conversation
    await _chatService.connect();
    await _chatService.joinConversation(conversationId);

    // Load existing messages
    await loadMessages();
  }

  /// Load messages from API
  Future<void> loadMessages() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(
          '$apiBaseUrl/chat/conversations/1/messages?page=1&pageSize=20',
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        final messagesList =
            (data['data']['messages'] as List)
                .map((json) => Message.fromJson(json))
                .toList();

        messages.value = messagesList.reversed.toList();
        _scrollToBottom();
      } else {
        Get.snackbar(
          'Error',
          'Failed to load messages: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error loading messages: $e');
      Get.snackbar(
        'Error',
        'Failed to load messages',
        snackPosition: SnackPosition.BOTTOM,
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
    print(messageText);
    isSendingMessage.value = true;

    try {
      final response = await http.post(
        Uri.parse('$apiBaseUrl/chat/conversations/1/sendmessage'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
        body: json.encode({'messageText': messageText}),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Message sent successfully');
        // Message will be received via SignalR
        // loadMessages();
      } else {
        Get.snackbar(
          'Error',
          'Failed to send message: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
        // Restore the message text
        messageController.text = messageText;
        print(response.statusCode);
      }
    } catch (e) {
      print('Error sending message: $e');
      Get.snackbar(
        'Error',
        'Failed to send message',
        snackPosition: SnackPosition.BOTTOM,
      );
      messageController.text = messageText;
    } finally {
      isSendingMessage.value = false;
    }
  }

  /// Delete a message
  Future<void> deleteMessage(int messageId) async {
    try {
      final response = await http.delete(
        Uri.parse('$apiBaseUrl/chat/messages-delete?messageId=$messageId'),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200) {
        print('Message deleted successfully');
        // Message deletion will be received via SignalR
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete message',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error deleting message: $e');
      Get.snackbar(
        'Error',
        'Failed to delete message',
        snackPosition: SnackPosition.BOTTOM,
      );
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
    // messageController.dispose();
    // scrollController.dispose();
    _chatService.leaveConversation(conversationId);
    super.onClose();
  }
}
