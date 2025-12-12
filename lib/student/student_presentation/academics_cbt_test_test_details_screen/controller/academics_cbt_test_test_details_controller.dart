// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_test_details_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the AcademicsCbtTestTestDetailsScreen.
///
/// This class manages the state of the AcademicsCbtTestTestDetailsScreen, including the
/// current academicsCbtTestTestDetailsModelObj
class AcademicsCbtTestTestDetailsController extends GetxController {
  Rx<AcademicsCbtTestTestDetailsModel> academicsCbtTestTestDetailsModelObj =
      AcademicsCbtTestTestDetailsModel().obs;

  DashboardExtendedViewController dashboardcontroller =
      Get.find<DashboardExtendedViewController>();

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  AcademicsCbtTestTestDetailsModel? academicsCbtTestTestDetailsModel;
  List<Questions>? questions;

  Future<void> startTest(String quizScheduleID) async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      final response = await _apiService.startCbt(
        dashboardcontroller.selectedStudent1!.studentID.toString(),
        quizScheduleID,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        academicsCbtTestTestDetailsModel = startTestFromJson(response.body);
        questions = academicsCbtTestTestDetailsModel!.questions;
        Get.toNamed(
          AppRoutes.academicsCbtTestOngoingScreen,
          arguments: {'startTest': academicsCbtTestTestDetailsModel},
        );
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        OverlayLoadingProgress.stop();
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
        OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'Start Test failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      myLog.log(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
