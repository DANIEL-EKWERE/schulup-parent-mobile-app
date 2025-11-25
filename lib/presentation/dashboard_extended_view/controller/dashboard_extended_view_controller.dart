import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/academics_assignment_status_initial_model.dart';

class DashboardExtendedViewController extends GetxController {
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Rx<bool> isLoading = false.obs;

  List<Student> students = [];
  AcademicsAssignmentStatusInitialModel? academicsAssignmentStatusInitialModel;
  Student? selectedStudent;
  Student? selectedStudent1;

  @override
  void onInit() {
    super.onInit();
    byGuardian();
  }

  Future<void> byGuardian() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      final response = await _apiService.byGuardian();
      if (response.statusCode == 200 || response.statusCode == 201) {
        // // OverlayLoadingProgress.stop();
        // // myLog.log('Login successful: ${response.body}');
        // // schoolCodeInputController.dispose();
        // // usernameInputController.dispose();
        // // passwordInputController.dispose();
        // var responseData = jsonDecode(response.body);
        // myLog.log(responseData.toString());
        isLoading.value = false;
        academicsAssignmentStatusInitialModel =
            academicsAssignmentStatusInitialModelFromJson(response.body);
        students = academicsAssignmentStatusInitialModel?.data ?? [];
        myLog.log('Students: ${students.length}');
        if (students.isNotEmpty) {
          selectedStudent = students.first;
          selectedStudent1 = students.first;
        }
        //   OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        // OverlayLoadingProgress.stop();
        var responseData = jsonDecode(response.body);
        var message = responseData['message'];
        Get.snackbar(
          'Error',
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
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
      //OverlayLoadingProgress.stop();
    }
  }
}
