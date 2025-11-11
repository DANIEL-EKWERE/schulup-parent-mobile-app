// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_assignment_model.dart';

/// A controller class for the AcademicsAssignmentAssignmentScreen.
///
/// This class manages the state of the AcademicsAssignmentAssignmentScreen, including the
/// current academicsAssignmentAssignmentModelObj
class AcademicsAssignmentAssignmentController extends GetxController {
  TextEditingController vectoroneController = TextEditingController();

  Rx<AcademicsAssignmentAssignmentModel> academicsAssignmentAssignmentModelObj =
      AcademicsAssignmentAssignmentModel().obs;

  @override
  void onClose() {
    super.onClose();
    vectoroneController.dispose();
  }
}
