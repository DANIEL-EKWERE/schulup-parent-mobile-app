// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_not_submitted_model.dart';

/// A controller class for the AcademicsAssignmentNotSubmittedScreen.
///
/// This class manages the state of the AcademicsAssignmentNotSubmittedScreen, including the
/// current academicsAssignmentNotSubmittedModelObj
class AcademicsAssignmentNotSubmittedController extends GetxController {
  TextEditingController weburloneController = TextEditingController();

  Rx<AcademicsAssignmentNotSubmittedModel>
  academicsAssignmentNotSubmittedModelObj =
      AcademicsAssignmentNotSubmittedModel().obs;

  @override
  void onClose() {
    super.onClose();
    weburloneController.dispose();
  }
}
