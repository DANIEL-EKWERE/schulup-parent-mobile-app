// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_class_two_model.dart';

/// A controller class for the ReportsWardProgressClassTwoPage.
///
/// This class manages the state of the ReportsWardProgressClassTwoPage, including the
/// current reportsWardProgressClassTwoModelObj
class ReportsWardProgressClassTwoController extends GetxController {
  ReportsWardProgressClassTwoController(
    this.reportsWardProgressClassTwoModelObj,
  );

  TextEditingController frame427321469Controller = TextEditingController();

  TextEditingController frame427321470Controller = TextEditingController();

  TextEditingController frame427321471Controller = TextEditingController();

  TextEditingController frame427321472Controller = TextEditingController();

  TextEditingController frame427321473Controller = TextEditingController();

  Rx<ReportsWardProgressClassTwoModel> reportsWardProgressClassTwoModelObj;

  @override
  void onClose() {
    super.onClose();
    frame427321469Controller.dispose();
    frame427321470Controller.dispose();
    frame427321471Controller.dispose();
    frame427321472Controller.dispose();
    frame427321473Controller.dispose();
  }
}
