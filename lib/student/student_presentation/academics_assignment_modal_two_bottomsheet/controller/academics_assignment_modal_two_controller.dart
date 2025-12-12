// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_modal_two_model.dart';

/// A controller class for the AcademicsAssignmentModalTwoBottomsheet.
///
/// This class manages the state of the AcademicsAssignmentModalTwoBottomsheet, including the
/// current academicsAssignmentModalTwoModelObj
class AcademicsAssignmentModalTwoController extends GetxController {
  Rx<AcademicsAssignmentModalTwoModel> academicsAssignmentModalTwoModelObj =
      AcademicsAssignmentModalTwoModel().obs;
}
