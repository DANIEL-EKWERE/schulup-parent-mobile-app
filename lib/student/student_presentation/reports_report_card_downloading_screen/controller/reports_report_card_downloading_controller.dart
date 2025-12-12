// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_downloading_model.dart';

/// A controller class for the ReportsReportCardDownloadingScreen.
///
/// This class manages the state of the ReportsReportCardDownloadingScreen, including the
/// current reportsReportCardDownloadingModelObj
class ReportsReportCardDownloadingController extends GetxController {
  Rx<ReportsReportCardDownloadingModel> reportsReportCardDownloadingModelObj =
      ReportsReportCardDownloadingModel().obs;
}
