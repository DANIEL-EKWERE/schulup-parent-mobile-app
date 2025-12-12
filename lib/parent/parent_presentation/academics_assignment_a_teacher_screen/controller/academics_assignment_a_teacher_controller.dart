// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_a_teacher_model.dart';

/// A controller class for the AcademicsAssignmentATeacherScreen.
///
/// This class manages the state of the AcademicsAssignmentATeacherScreen, including the
/// current academicsAssignmentATeacherModelObj
class AcademicsAssignmentATeacherController extends GetxController {
  TextEditingController weburlController = TextEditingController();

  TextEditingController weburloneController = TextEditingController();

  TextEditingController vectoroneController = TextEditingController();

  Rx<AcademicsAssignmentATeacherModel> academicsAssignmentATeacherModelObj =
      AcademicsAssignmentATeacherModel().obs;

  @override
  void onClose() {
    super.onClose();
    weburlController.dispose();
    weburloneController.dispose();
    vectoroneController.dispose();
  }
}
