// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/attendance_filter_start_date_model.dart';

/// A controller class for the AttendanceFilterStartDateBottomsheet.
///
/// This class manages the state of the AttendanceFilterStartDateBottomsheet, including the
/// current attendanceFilterStartDateModelObj
class AttendanceFilterStartDateController extends GetxController {
  Rx<AttendanceFilterStartDateModel> attendanceFilterStartDateModelObj =
      AttendanceFilterStartDateModel().obs;
}
