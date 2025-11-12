import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_subject_model.dart';

/// A controller class for the ReportsWardProgressSubjectPage.
///
/// This class manages the state of the ReportsWardProgressSubjectPage, including the
/// current reportsWardProgressSubjectModelObj
class ReportsWardProgressSubjectController extends GetxController {
  ReportsWardProgressSubjectController(this.reportsWardProgressSubjectModelObj);

  Rx<ReportsWardProgressSubjectModel> reportsWardProgressSubjectModelObj;
}
