// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_modal_four_model.dart';

/// A controller class for the AcademicsAssignmentModalFourBottomsheet.
///
/// This class manages the state of the AcademicsAssignmentModalFourBottomsheet, including the
/// current academicsAssignmentModalFourModelObj
class AcademicsAssignmentModalFourController extends GetxController {
  Rx<AcademicsAssignmentModalFourModel> academicsAssignmentModalFourModelObj =
      AcademicsAssignmentModalFourModel().obs;
}
