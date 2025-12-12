// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_modal_three_model.dart';

/// A controller class for the AcademicsAssignmentModalThreeBottomsheet.
///
/// This class manages the state of the AcademicsAssignmentModalThreeBottomsheet, including the
/// current academicsAssignmentModalThreeModelObj
class AcademicsAssignmentModalThreeController extends GetxController {
  Rx<AcademicsAssignmentModalThreeModel> academicsAssignmentModalThreeModelObj =
      AcademicsAssignmentModalThreeModel().obs;
}
