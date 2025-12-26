// TODO Implement this library.
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/attendance_all_variants_page/models/attendance_model.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/attendance_all_variants_model.dart';

/// A controller class for the AttendanceAllVariantsPage.
///
/// This class manages the state of the AttendanceAllVariantsPage, including the
/// current attendanceAllVariantsModelObj

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

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

  Rx<bool> isLoading = false.obs;

  DateTime? datex;

  @override
  void onInit() {
    super.onInit();
    selectedMonth = DateTime.now().month - 1;
    myLog.log("setting selected month to the current month $selectedMonth");
    getStudentAttendance();
    datex = DateTime.now();
    //  date.value = formatDate(datex.toString());
  }

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

  Attendance? attendance;
  List<AttendanceData>? attendanceData;

  int? selectedMonth;

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Future<void> getStudentAttendance() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    try {
      var studentID =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      var year = DateTime.now().year;
      var month = DateTime.now().month;
      // myLog.log(year.toString());
      // myLog.log(selectedMonth.toString());
      myLog.log("month from datetime package : $month");
      myLog.log("selected month : ${selectedMonth! + 1}");
      final response = await _apiService.getStudentAttendance(
        studentID.toString(),
        year.toString(),
        "${selectedMonth! + 1}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        attendance = attendanceFromJson(response.body);
        attendanceData = attendance!.data!.reversed.toList();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        var responseData = jsonDecode(response.body);
        var message = responseData['message'];

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
      } else {
        // OverlayLoadingProgress.stop();
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Loading Attendance Failed failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      isLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      isLoading.value = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
      //OverlayLoadingProgress.stop();
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM. d, yyyy').format(dateTime);
  }
}
