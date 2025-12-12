// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../../../core/app_export.dart';
import '../models/academics_assignment_the_child_model.dart';

/// A controller class for the AcademicsAssignmentTheChildScreen.
///
/// This class manages the state of the AcademicsAssignmentTheChildScreen, including the
/// current academicsAssignmentTheChildModelObj
class AcademicsAssignmentTheChildController extends GetxController {
  TextEditingController vectoroneController = TextEditingController();

  Rx<AcademicsAssignmentTheChildModel> academicsAssignmentTheChildModelObj =
      AcademicsAssignmentTheChildModel().obs;

  Rx<types.User> chatUser = Rx(types.User(id: 'RECEIVER_USER'));

  Rx<List<types.Message>> messageList = Rx([
    types.TextMessage(
      type: types.MessageType.text,
      id: '586:22938',
      author: types.User(id: 'SENDER_USER'),
      text:
          "Well done, Ogechi! \nYour explanation of the respiratory system shows a good understanding of how air moves through the body. I also reviewed the pictures you attached. Next time, try to include short definitions for each organ you mention. Keep it up!",
      status: types.Status.delivered,
      createdAt: 1762872382656,
    ),
    types.TextMessage(
      type: types.MessageType.text,
      id: '586:22939',
      author: types.User(id: 'SENDER_USER'),
      text: "Mr Kayode • 08:55PM • Nov. 10, 2025",
      status: types.Status.delivered,
      createdAt: 1762872382656,
    ),
    types.TextMessage(
      type: types.MessageType.text,
      id: '586:22943',
      author: types.User(id: 'RECEIVER_USER'),
      text:
          "Thank you, Sir! I’m happy you liked my work. I’ll make sure to add short definitions next time.",
      status: types.Status.delivered,
      createdAt: 1762872382656,
    ),
  ]);

  @override
  void onClose() {
    super.onClose();
    vectoroneController.dispose();
  }
}
