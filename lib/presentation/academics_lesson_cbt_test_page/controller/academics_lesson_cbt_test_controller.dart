
// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/cbt_detail_model.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/cbt_model.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/lesson_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_cbt_test_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the AcademicsLessonAllLessonsPage.
///
/// This class manages the state of the AcademicsLessonAllLessonsPage, including the
/// current academicsLessonAllLessonsModelObj
class AcademicsLessonCbtTestController extends GetxController {
  AcademicsLessonCbtTestController(this.academicsLessonAllLessonsModelObj);

  Rx<AcademicsLessonCbtTestModel> academicsLessonAllLessonsModelObj;

AcademicsAssignmentStatusController controllerx = Get.find<AcademicsAssignmentStatusController>();
@override
onInit(){
  super.onInit();
  getCbt();
}
Lesson lesson = Lesson();

  List<LessonData> lessonList = [];
CbtDetail? cbtDetail;

  Cbt? cbt;
  List<CbtData>? cbtData;

  SelectionPopupModel? selectedDropDownValue;



   ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));
  
  Rx<bool> isLoading = false.obs;
DashboardExtendedViewController dashboardExtendedViewController = Get.find<DashboardExtendedViewController>();
  onSelected(dynamic value) {
    for (var element
        in academicsLessonAllLessonsModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsLessonAllLessonsModelObj.value.dropdownItemList.refresh();
  }



  



  Future<void> getCbtDetails(String quizScheduledId) async {
   isLoading.value = true;
    try {
      var studentId =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      final response = await _apiService.cbtDetaails(
        studentId.toString(),
        quizScheduledId,
      );
      myLog.log("classId: ${studentId}, studentId: ${quizScheduledId}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        cbtDetail = cbtDetailFromJson(response.body);

        Get.toNamed(
          AppRoutes.academicsCbtTestTestDetailsScreen,
          arguments: {'model': cbtDetail},
        );
      } else if (response.statusCode == 404 || response.statusCode == 401) {
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
          'cbt fetch failed. Please try again.',
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCbt() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),

    // );a
    try {
      var classId = dashboardExtendedViewController.selectedClassID;
      final response = await _apiService.cbt(
        classId.toString(),
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
      );
      // myLog.log(
      //   "classId: ${classId}, studentId: ${controller.selectedStudent1!.studentID}",
      // );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        cbt = cbtFromJson(response.body);
        cbtData = cbt!.data;

        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        // OverlayLoadingProgress.stop();
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
          'cbt fetch failed. Please try again.',
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
      isLoading.value = false;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  //cbtDetails()
  Future<void> getCbtResult() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),

    // );a
    try {
      var classId = dashboardExtendedViewController.selectedClassID;
      final response = await _apiService.cbt(
       // controller.selectedClassID.toString(),
        classId.toString(),
        dashboardExtendedViewController.selectedStudent1!.studentID.toString()
      );
      // myLog.log(
      //   "classId: ${classId}, studentId: ${controller.selectedClassID}",
      // );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        cbt = cbtFromJson(response.body);
        cbtData = cbt!.data;

        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        // OverlayLoadingProgress.stop();
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
          'cbt fetch failed. Please try again.',
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
      isLoading.value = false;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }
}
