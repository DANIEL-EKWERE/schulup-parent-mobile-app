import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_subject_one_model.dart';

/// A controller class for the ReportsWardProgressSubjectOneBottomsheet.
///
/// This class manages the state of the ReportsWardProgressSubjectOneBottomsheet, including the
/// current reportsWardProgressSubjectOneModelObj
class ReportsWardProgressSubjectOneController extends GetxController {
  Rx<ReportsWardProgressSubjectOneModel> reportsWardProgressSubjectOneModelObj =
      ReportsWardProgressSubjectOneModel().obs;
}
