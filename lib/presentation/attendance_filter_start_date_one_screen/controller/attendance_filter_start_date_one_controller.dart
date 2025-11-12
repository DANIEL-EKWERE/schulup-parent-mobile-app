// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/attendance_filter_start_date_one_model.dart';

/// A controller class for the AttendanceFilterStartDateOneScreen.
///
/// This class manages the state of the AttendanceFilterStartDateOneScreen, including the
/// current attendanceFilterStartDateOneModelObj
class AttendanceFilterStartDateOneController extends GetxController {
  TextEditingController publicholidayController = TextEditingController();

  Rx<AttendanceFilterStartDateOneModel> attendanceFilterStartDateOneModelObj =
      AttendanceFilterStartDateOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    publicholidayController.dispose();
  }
}
