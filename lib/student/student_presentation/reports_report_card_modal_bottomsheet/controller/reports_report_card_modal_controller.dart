// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_modal_model.dart';

/// A controller class for the ReportsReportCardModalBottomsheet.
///
/// This class manages the state of the ReportsReportCardModalBottomsheet, including the
/// current reportsReportCardModalModelObj
class ReportsReportCardModalController extends GetxController {
  Rx<ReportsReportCardModalModel> reportsReportCardModalModelObj =
      ReportsReportCardModalModel().obs;
}
