// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
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
        // Get.snackbar(
        //   'Error',
        //   'Start Test failed. Please try again.',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );
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
      }
    } on SocketException {
      Fluttertoast.showToast(
        webShowClose: true,
        msg: 'Check your internet connection and try again.',
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
