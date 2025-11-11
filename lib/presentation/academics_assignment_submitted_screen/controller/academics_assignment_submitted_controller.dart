// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_submitted_model.dart';

/// A controller class for the AcademicsAssignmentSubmittedScreen.
///
/// This class manages the state of the AcademicsAssignmentSubmittedScreen, including the
/// current academicsAssignmentSubmittedModelObj
class AcademicsAssignmentSubmittedController extends GetxController {
  TextEditingController weburlController = TextEditingController();

  TextEditingController weburloneController = TextEditingController();

  Rx<AcademicsAssignmentSubmittedModel> academicsAssignmentSubmittedModelObj =
      AcademicsAssignmentSubmittedModel().obs;

  @override
  void onClose() {
    super.onClose();
    weburlController.dispose();
    weburloneController.dispose();
  }
}
