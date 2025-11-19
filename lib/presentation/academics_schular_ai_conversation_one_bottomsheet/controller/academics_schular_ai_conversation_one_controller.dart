// TODO Implement this library.
// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_schular_ai_conversation_one_model.dart';

/// A controller class for the AcademicsSchularAiConversationOneBottomsheet.
///
/// This class manages the state of the AcademicsSchularAiConversationOneBottomsheet, including the
/// current academicsSchularAiConversationOneModelObj
class AcademicsSchularAiConversationOneController extends GetxController {
  Rx<AcademicsSchularAiConversationOneModel>
  academicsSchularAiConversationOneModelObj =
      AcademicsSchularAiConversationOneModel().obs;
}
