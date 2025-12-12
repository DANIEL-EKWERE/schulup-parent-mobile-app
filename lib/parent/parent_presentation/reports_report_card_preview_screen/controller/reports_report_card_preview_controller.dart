// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_preview_model.dart';

/// A controller class for the ReportsReportCardPreviewScreen.
///
/// This class manages the state of the ReportsReportCardPreviewScreen, including the
/// current reportsReportCardPreviewModelObj
class ReportsReportCardPreviewController extends GetxController {
  Rx<ReportsReportCardPreviewModel> reportsReportCardPreviewModelObj =
      ReportsReportCardPreviewModel().obs;
}
