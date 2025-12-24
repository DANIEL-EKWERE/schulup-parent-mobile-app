// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/academics_cbt_test_test_result_screen/models/test_result_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_test_result_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the AcademicsCbtTestTestResultScreen.
///
/// This class manages the state of the AcademicsCbtTestTestResultScreen, including the
/// current academicsCbtTestTestResultModelObj
class AcademicsCbtTestTestResultController extends GetxController {
  Rx<AcademicsCbtTestTestResultModel> academicsCbtTestTestResultModelObj =
      AcademicsCbtTestTestResultModel().obs;

  Rx<String> whowasthe = "".obs;

  Rx<String> inwhatyear = "".obs;


  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Rx<bool> isLoading = false.obs;

  // StudentDashboardExtendedViewController dashboardExtendedViewController =
  //     Get.find<StudentDashboardExtendedViewController>();

  @override
  void onInit() {
    super.onInit();
    // studentQuizResult();
  }

  QuizResult? quizResult;

  List<Questions> questionsList = [];

  Future<void> studentQuizResult(String id) async {
    isLoading.value = true;
    myLog.log(id);
    try {
      final response = await _apiService.getQuizResult(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        quizResult = quizResultFromJson(response.body);
        questionsList = quizResult!.questions!;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        isLoading.value = false;
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
      myLog.log(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
