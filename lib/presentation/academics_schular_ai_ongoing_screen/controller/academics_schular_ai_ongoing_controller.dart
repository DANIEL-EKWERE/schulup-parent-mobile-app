// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../../../core/app_export.dart';
import '../models/academics_schular_ai_ongoing_model.dart';

/// A controller class for the AcademicsSchularAiOngoingScreen.
///
/// This class manages the state of the AcademicsSchularAiOngoingScreen, including the
/// current academicsSchularAiOngoingModelObj
class AcademicsSchularAiOngoingController extends GetxController {
  TextEditingController vectoroneController = TextEditingController();

  Rx<AcademicsSchularAiOngoingModel> academicsSchularAiOngoingModelObj =
      AcademicsSchularAiOngoingModel().obs;

  Rx<types.User> chatUser = Rx(types.User(id: 'RECEIVER_USER'));

  Rx<List<types.Message>> messageList = Rx([
    types.TextMessage(
      type: types.MessageType.text,
      id: '586:23345',
      author: types.User(id: 'SENDER_USER'),
      text: "Hello! Ogechi 👋\nYou can ask me anything?",
      status: types.Status.delivered,
      createdAt: 1762872382676,
    ),
    types.TextMessage(
      type: types.MessageType.text,
      id: '586:23350',
      author: types.User(id: 'RECEIVER_USER'),
      text:
          "Hi! Please, what is the difference between breathing in and breathing out?",
      status: types.Status.delivered,
      createdAt: 1762872382676,
    ),
    types.TextMessage(
      type: types.MessageType.text,
      id: '591:23355',
      author: types.User(id: 'SENDER_USER'),
      text:
          "Good question! 😊\nWhen you breathe in (inhale), your lungs fill with air that contains oxygen, which your body needs. When you breathe out (exhale), your body releases carbon dioxide, a gas it doesn’t need. So breathing in gives your body oxygen, and breathing out removes waste gas.",
      status: types.Status.delivered,
      createdAt: 1762872382676,
    ),
    types.TextMessage(
      type: types.MessageType.text,
      id: '591:23356',
      author: types.User(id: 'SENDER_USER'),
      text: "Schular AI • 01:07PM • Nov. 10, 2025",
      status: types.Status.delivered,
      createdAt: 1762872382676,
    ),
  ]);

  @override
  void onClose() {
    super.onClose();
    vectoroneController.dispose();
  }
}
