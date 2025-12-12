// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_modal_one_model.dart';

/// A controller class for the ReportsReportCardModalOneBottomsheet.
///
/// This class manages the state of the ReportsReportCardModalOneBottomsheet, including the
/// current reportsReportCardModalOneModelObj
class ReportsReportCardModalOneController extends GetxController {
  Rx<ReportsReportCardModalOneModel> reportsReportCardModalOneModelObj =
      ReportsReportCardModalOneModel().obs;
}
