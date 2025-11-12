// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_all_variants_one_model.dart';

/// A controller class for the ReportsReportCardAllVariantsOneScreen.
///
/// This class manages the state of the ReportsReportCardAllVariantsOneScreen, including the
/// current reportsReportCardAllVariantsOneModelObj
class ReportsReportCardAllVariantsOneController extends GetxController {
  Rx<ReportsReportCardAllVariantsOneModel>
  reportsReportCardAllVariantsOneModelObj =
      ReportsReportCardAllVariantsOneModel().obs;
}
