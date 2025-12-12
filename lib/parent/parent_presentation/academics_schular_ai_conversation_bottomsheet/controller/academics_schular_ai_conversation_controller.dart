// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_schular_ai_conversation_model.dart';

/// A controller class for the AcademicsSchularAiConversationBottomsheet.
///
/// This class manages the state of the AcademicsSchularAiConversationBottomsheet, including the
/// current academicsSchularAiConversationModelObj
class AcademicsSchularAiConversationController extends GetxController {
  Rx<AcademicsSchularAiConversationModel>
  academicsSchularAiConversationModelObj =
      AcademicsSchularAiConversationModel().obs;
}
