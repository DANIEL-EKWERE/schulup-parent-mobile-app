import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/direct_chat/models/models.dart';

class DirectChatController extends GetxController {
  //students/47135/classteachers
  DashboardExtendedViewController dashboardcontroller =
      Get.find<DashboardExtendedViewController>();

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  ClassTeacher? classTeacher;
  List<TeacherData>? teacherData;
  Rx<bool> isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getTeachers();
  }

  Future<void> getTeachers() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    try {
      var studentID = dashboardcontroller.selectedStudent1!.studentID;
      myLog.log(studentID.toString());
      final response = await _apiService.getTeachers(studentID!.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        classTeacher = classTeacherFromJson(response.body);
        teacherData = classTeacher!.data;
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar(
          'Opps!!!',
          'No data found.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0XFFFF8C42),
          colorText: Colors.white,
        );
      } else {
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
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
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
    } finally {
      isLoading.value = false;
      // OverlayLoadingProgress.stop();
    }
  }
}
