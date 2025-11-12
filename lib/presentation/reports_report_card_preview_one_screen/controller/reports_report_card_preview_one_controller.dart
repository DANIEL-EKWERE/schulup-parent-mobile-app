// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_preview_one_model.dart';

/// A controller class for the ReportsReportCardPreviewOneScreen.
///
/// This class manages the state of the ReportsReportCardPreviewOneScreen, including the
/// current reportsReportCardPreviewOneModelObj
class ReportsReportCardPreviewOneController extends GetxController {
  Rx<ReportsReportCardPreviewOneModel> reportsReportCardPreviewOneModelObj =
      ReportsReportCardPreviewOneModel().obs;
}
