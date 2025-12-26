// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/student/core/utils/storage.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/academics_cbt_test_ongoing_screen/academics_cbt_test_ongoing_screen.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_test_details_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the AcademicsCbtTestTestDetailsScreen.
///
/// This class manages the state of the AcademicsCbtTestTestDetailsScreen, including the
/// current academicsCbtTestTestDetailsModelObj
class StudentAcademicsCbtTestTestDetailsController extends GetxController {
  Rx<StudentAcademicsCbtTestTestDetailsModel>
  academicsCbtTestTestDetailsModelObj =
      StudentAcademicsCbtTestTestDetailsModel().obs;

  // StudentDashboardExtendedViewController dashboardcontroller =
  //     Get.find<StudentDashboardExtendedViewController>();

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  StudentAcademicsCbtTestTestDetailsModel? academicsCbtTestTestDetailsModel;
  List<Questions>? questions;

  Future<void> startTest(String quizScheduleID) async {
    var studentID = await studentDataBase.getStudentId();
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      final response = await _apiService.startCbt(
        studentID.toString(),
        quizScheduleID,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        academicsCbtTestTestDetailsModel = startTestFromJson(response.body);
        questions = academicsCbtTestTestDetailsModel!.questions;
        // Get.toNamed(
        //   AppRoutes.academicsCbtTestOngoingScreen,
        //   arguments: {'startTest': academicsCbtTestTestDetailsModel},
        // );
        Get.to(
          () => StudentAcademicsCbtTestOngoingScreen(),
          arguments: {'startTest': academicsCbtTestTestDetailsModel},
        );
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        OverlayLoadingProgress.stop();
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
      OverlayLoadingProgress.stop();
    }
  }
}
