// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
          Fluttertoast.showToast(
            webShowClose: true,
            msg: message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });
      } else {
        OverlayLoadingProgress.stop();

         Fluttertoast.showToast(
            webShowClose: true,
            msg: 'Start Test failed. Please try again.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

        Get.snackbar(
          'Error',
          'Start Test failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      Fluttertoast.showToast(
        webShowClose: true,
        msg: 'SCheck your internet connection and try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      myLog.log(e.toString());
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Fluttertoast.showToast(
          webShowClose: true,
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
      //OverlayLoadingProgress.stop();
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
