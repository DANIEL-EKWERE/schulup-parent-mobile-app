// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_class_model.dart';

/// A controller class for the ReportsWardProgressClassPage.
///
/// This class manages the state of the ReportsWardProgressClassPage, including the
/// current reportsWardProgressClassModelObj
class ReportsWardProgressClassController extends GetxController {
  ReportsWardProgressClassController(this.reportsWardProgressClassModelObj);

  TextEditingController frame427321469Controller = TextEditingController();

  TextEditingController frame427321470Controller = TextEditingController();

  TextEditingController frame427321471Controller = TextEditingController();

  TextEditingController frame427321472Controller = TextEditingController();

  TextEditingController frame427321473Controller = TextEditingController();

  TextEditingController frame427321474Controller = TextEditingController();

  TextEditingController frame427321475Controller = TextEditingController();

  Rx<ReportsWardProgressClassModel> reportsWardProgressClassModelObj;

  @override
  void onClose() {
    super.onClose();
    frame427321469Controller.dispose();
    frame427321470Controller.dispose();
    frame427321471Controller.dispose();
    frame427321472Controller.dispose();
    frame427321473Controller.dispose();
    frame427321474Controller.dispose();
    frame427321475Controller.dispose();
  }
}
