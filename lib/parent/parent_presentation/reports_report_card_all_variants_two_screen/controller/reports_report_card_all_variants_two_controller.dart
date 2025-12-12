// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_all_variants_two_model.dart';

/// A controller class for the ReportsReportCardAllVariantsTwoScreen.
///
/// This class manages the state of the ReportsReportCardAllVariantsTwoScreen, including the
/// current reportsReportCardAllVariantsTwoModelObj
class ReportsReportCardAllVariantsTwoController extends GetxController {
  Rx<ReportsReportCardAllVariantsTwoModel>
  reportsReportCardAllVariantsTwoModelObj =
      ReportsReportCardAllVariantsTwoModel().obs;
}
