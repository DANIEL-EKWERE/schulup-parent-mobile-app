// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/attendance_all_variants_model.dart';

/// A controller class for the AttendanceAllVariantsPage.
///
/// This class manages the state of the AttendanceAllVariantsPage, including the
/// current attendanceAllVariantsModelObj
class AttendanceAllVariantsController extends GetxController {
  AttendanceAllVariantsController(this.attendanceAllVariantsModelObj);

  TextEditingController time1Controller = TextEditingController();

  TextEditingController timeoneController = TextEditingController();

  TextEditingController timetwoController = TextEditingController();

  TextEditingController timethreeController = TextEditingController();

  TextEditingController timefourController = TextEditingController();

  TextEditingController timefiveController = TextEditingController();

  TextEditingController timesixController = TextEditingController();

  TextEditingController timesevenController = TextEditingController();

  TextEditingController timenineController = TextEditingController();

  TextEditingController timetenController = TextEditingController();

  TextEditingController timeelevenController = TextEditingController();

  TextEditingController timetwelveController = TextEditingController();

  TextEditingController publicholidayController = TextEditingController();

  Rx<AttendanceAllVariantsModel> attendanceAllVariantsModelObj;

  @override
  void onClose() {
    super.onClose();
    time1Controller.dispose();
    timeoneController.dispose();
    timetwoController.dispose();
    timethreeController.dispose();
    timefourController.dispose();
    timefiveController.dispose();
    timesixController.dispose();
    timesevenController.dispose();
    timenineController.dispose();
    timetenController.dispose();
    timeelevenController.dispose();
    timetwelveController.dispose();
    publicholidayController.dispose();
  }
}
