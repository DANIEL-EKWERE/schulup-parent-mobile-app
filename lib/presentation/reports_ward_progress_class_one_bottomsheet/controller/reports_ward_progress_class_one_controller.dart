// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_class_one_model.dart';

/// A controller class for the ReportsWardProgressClassOneBottomsheet.
///
/// This class manages the state of the ReportsWardProgressClassOneBottomsheet, including the
/// current reportsWardProgressClassOneModelObj
class ReportsWardProgressClassOneController extends GetxController {
  Rx<ReportsWardProgressClassOneModel> reportsWardProgressClassOneModelObj =
      ReportsWardProgressClassOneModel().obs;
}
