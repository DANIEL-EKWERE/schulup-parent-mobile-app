// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_modal_one_model.dart';

/// A controller class for the AcademicsAssignmentModalOneBottomsheet.
///
/// This class manages the state of the AcademicsAssignmentModalOneBottomsheet, including the
/// current academicsAssignmentModalOneModelObj
class AcademicsAssignmentModalOneController extends GetxController {
  Rx<AcademicsAssignmentModalOneModel> academicsAssignmentModalOneModelObj =
      AcademicsAssignmentModalOneModel().obs;
}
