import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:schulupparent/student/data/apiClient/api_client.dart';

import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/academics_schular_ai_ongoing_model.dart';

/// A controller class for the AcademicsSchularAiOngoingScreen.
class StudentAcademicsSchularAiOngoingController extends GetxController {
  TextEditingController vectoroneController = TextEditingController();

  Rx<AcademicsSchularAiOngoingModel> academicsSchularAiOngoingModelObj =
      AcademicsSchularAiOngoingModel().obs;

  AcademicsSchularAiOngoingModel? scholarAiModel;
  List<ChatData>? chatData;

  // Current user (student)
  Rx<types.User> chatUser = Rx(types.User(id: 'RECEIVER_USER'));

  // AI user
  final types.User aiUser = const types.User(
    id: 'SENDER_USER',
    firstName: 'Scholar',
    lastName: 'AI',
  );

  // Messages list
  RxList<types.Message> messageList = <types.Message>[].obs;

  // Loading state
  RxBool isLoading = false.obs;
  RxBool isSending = false.obs;
  RxBool isAiTyping = false.obs; // NEW: AI typing indicator

  StudentDashboardExtendedViewController dashboardController =
      Get.find<StudentDashboardExtendedViewController>();

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  @override
  void onInit() {
    super.onInit();
    // Load conversations on init
    conversations();
  }

  @override
  void onClose() {
    super.onClose();
    //vectoroneController.dispose();
  }

  /// Send message to AI
  Future<void> ask(String messageText) async {
    if (messageText.trim().isEmpty) return;

    try {
      isSending.value = true;

      // Create user message and add to UI immediately
      final userMessage = types.TextMessage(
        author: chatUser.value,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        text: messageText,
        type: types.MessageType.text,
        status: types.Status.delivered,
      );

      // Add user message to UI
      messageList.insert(0, userMessage);

      // Clear input field
      vectoroneController.clear();

      // Show AI typing indicator
      isAiTyping.value = true;

      final body = {"messageText": messageText};
      var studentID = dashboardController.selectedStudent1!.studentID;

      print('Sending message: $body to student: $studentID');

      final response = await _apiService.studentAsk(body, studentID.toString());

      // Hide typing indicator
      isAiTyping.value = false;

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Message sent successfully. Response: ${response.body}');

        // Reload all conversations to get the complete chat including AI response
        await conversations();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        var responseData = jsonDecode(response.body);
        var message = responseData['message'];

        // Remove the user message on error
        messageList.removeWhere((msg) => msg.id == userMessage.id);

        Get.snackbar(
          'Error',
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Remove the user message on error
        messageList.removeWhere((msg) => msg.id == userMessage.id);

        Get.snackbar(
          'Error',
          'Failed to send message. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      // Hide typing indicator
      isAiTyping.value = false;

      // Remove user message on network error
      messageList.removeWhere((msg) => msg.id.startsWith('user_'));

      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error sending message: $e');

      // Hide typing indicator
      isAiTyping.value = false;

      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isSending.value = false;
      isAiTyping.value = false;
    }
  }

  /// Fetch conversation history
  Future<void> conversations() async {
    try {
      // Only show loading on initial load, not when refreshing after sending
      if (messageList.isEmpty) {
        isLoading.value = true;
      }

      var studentID = dashboardController.selectedStudent1!.studentID;

      print('Fetching conversations for student: $studentID');

      // Get conversation history endpoint
      final response = await _apiService.getAiConversations(
        studentID.toString(),
      );

      if (response != null) {
        print('Conversations response: $response');

        scholarAiModel = scholarAiFromJson(response.body);

        if (scholarAiModel?.success == true && scholarAiModel?.data != null) {
          chatData = scholarAiModel!.data;

          // Update message list with all conversations
          _updateMessageList();

          print('Loaded ${chatData!.length} messages');
        } else {
          print('No data in response or unsuccessful');
          if (messageList.isEmpty) {
            messageList.clear();
          }
        }
      } else {
        print('Response is null');
      }
    } on SocketException {
      if (messageList.isEmpty) {
        Get.snackbar(
          'Opps!!!',
          'Check your internet connection and try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0XFFFF8C42),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error fetching conversations: $e');
      if (messageList.isEmpty) {
        Get.snackbar(
          'Error',
          'Failed to load chat history',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  /// Update message list from chat data
  void _updateMessageList() {
    if (chatData == null || chatData!.isEmpty) {
      if (messageList.isEmpty) {
        messageList.clear();
      }
      return;
    }

    // Convert ChatData to chat messages
    List<types.Message> messages =
        chatData!.map((data) {
          return types.TextMessage(
            author: data.isAiResponse == true ? aiUser : chatUser.value,
            createdAt: _parseTimestamp(data.timestamp),
            id: data.id.toString(),
            text: data.response ?? '',
            type: types.MessageType.text,
            status: types.Status.delivered,
          );
        }).toList();

    // Sort messages by timestamp (newest first for chat UI)
    messages.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    // Update the message list
    messageList.value = messages;

    print('Message list updated with ${messages.length} messages');
  }

  /// Parse timestamp string to milliseconds
  int _parseTimestamp(String? timestamp) {
    if (timestamp == null) return DateTime.now().millisecondsSinceEpoch;

    try {
      return DateTime.parse(timestamp).millisecondsSinceEpoch;
    } catch (e) {
      return DateTime.now().millisecondsSinceEpoch;
    }
  }

  /// Start new chat
  void startNewChat() {
    Get.dialog(
      AlertDialog(
        title: const Text('Start New Chat'),
        content: const Text(
          'Are you sure you want to start a new conversation? This will clear the current chat.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(Get.context!),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              messageList.clear();
              chatData = null;
              scholarAiModel = null;
              vectoroneController.clear();
              //Get.back();
              Navigator.pop(Get.context!);

              Get.snackbar(
                'New Chat',
                'Started a new conversation',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green,
                colorText: Colors.white,
                duration: Duration(seconds: 2),
              );
            },
            child: const Text('Start New'),
          ),
        ],
      ),
    );
  }

  /// View chat history (refresh conversations)
  void viewHistory() {
    // Reload conversations
    conversations();

    Get.snackbar(
      'Refreshed',
      'Chat history refreshed',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }

  /// Refresh conversations
  Future<void> refreshConversations() async {
    await conversations();
  }
}
