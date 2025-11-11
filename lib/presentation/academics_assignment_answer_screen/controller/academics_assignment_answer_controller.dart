// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_answer_model.dart';

/// A controller class for the AcademicsAssignmentAnswerScreen.
///
/// This class manages the state of the AcademicsAssignmentAnswerScreen, including the
/// current academicsAssignmentAnswerModelObj
class AcademicsAssignmentAnswerController extends GetxController {
  Rx<AcademicsAssignmentAnswerModel> academicsAssignmentAnswerModelObj =
      AcademicsAssignmentAnswerModel().obs;
}
