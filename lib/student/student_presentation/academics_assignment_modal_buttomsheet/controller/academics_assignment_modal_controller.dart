import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_modal_model.dart';

/// A controller class for the AcademicsAssignmentModalBottomsheet.
///
/// This class manages the state of the AcademicsAssignmentModalBottomsheet, including the
/// current academicsAssignmentModalModelObj
class AcademicsAssignmentModalController extends GetxController {
  Rx<AcademicsAssignmentModalModel> academicsAssignmentModalModelObj =
      AcademicsAssignmentModalModel().obs;
}
