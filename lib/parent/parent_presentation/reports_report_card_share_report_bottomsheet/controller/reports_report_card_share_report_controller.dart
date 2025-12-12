// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_share_report_model.dart';

/// A controller class for the ReportsReportCardShareReportBottomsheet.
///
/// This class manages the state of the ReportsReportCardShareReportBottomsheet, including the
/// current reportsReportCardShareReportModelObj
class ReportsReportCardShareReportController extends GetxController {
  Rx<ReportsReportCardShareReportModel> reportsReportCardShareReportModelObj =
      ReportsReportCardShareReportModel().obs;
}
