import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_all_variants_model.dart';

/// A controller class for the ReportsReportCardAllVariantsPage.
///
/// This class manages the state of the ReportsReportCardAllVariantsPage, including the
/// current reportsReportCardAllVariantsModelObj
class ReportsReportCardAllVariantsController extends GetxController {
  ReportsReportCardAllVariantsController(
    this.reportsReportCardAllVariantsModelObj,
  );

  Rx<ReportsReportCardAllVariantsModel> reportsReportCardAllVariantsModelObj;

  Rx<String> termType = 'First Term'.obs;
  Rx<String> dayType = 'Daily'.obs;
}
