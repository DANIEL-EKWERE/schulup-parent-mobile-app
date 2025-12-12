// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/data/model/selectionPopupModel/selection_popup_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/assignment_details.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/assignment_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/cbt_detail_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/cbt_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/lesson_model.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the AcademicsLessonAllLessonsPage.
///
/// This class manages the state of the AcademicsLessonAllLessonsPage, including the
/// current academicsLessonAllLessonsModelObj
class AcademicsAssignmentController extends GetxController {
  AcademicsAssignmentController(this.academicsLessonAllLessonsModelObj);

  Rx<AcademicsAssignmentModel> academicsLessonAllLessonsModelObj;

  AcademicsAssignmentStatusController controllerx =
      Get.find<AcademicsAssignmentStatusController>();
  @override
  onInit() {
    super.onInit();
    getAssignment();
  }

  Assignment? assignment;
  List<AssignmentData>? assignmentData;
  Rx<bool> isLoading = false.obs;

  AssignmentDetails? assignmentDetails;

  SelectionPopupModel? selectedDropDownValue;

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  // Rx<bool> isLoading = false.obs;
  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();
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

  // Future<void> getCbtDetails(String quizScheduledId) async {
  //  isLoading.value = true;
  //   try {
  //     var studentId =
  //         dashboardExtendedViewController.selectedStudent1!.studentID;
  //     final response = await _apiService.cbtDetaails(
  //       studentId.toString(),
  //       quizScheduledId,
  //     );
  //     myLog.log("classId: ${studentId}, studentId: ${quizScheduledId}");
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       isLoading.value = false;
  //       cbtDetail = cbtDetailFromJson(response.body);

  //       Get.toNamed(
  //         AppRoutes.academicsCbtTestTestDetailsScreen,
  //         arguments: {'model': cbtDetail},
  //       );
  //     } else if (response.statusCode == 404 || response.statusCode == 401) {
  //       isLoading.value = false;
  //       var responseData = jsonDecode(response.body);
  //       var message = responseData['message'];
  //       Get.snackbar(
  //         'Error',
  //         message,
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     } else {
  //       isLoading.value = false;
  //       Get.snackbar(
  //         'Error',
  //         'cbt fetch failed. Please try again.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } on SocketException {
  //     isLoading.value = false;
  //     Get.snackbar(
  //       'Opps!!!',
  //       'Check your internet connection and try again.',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Color(0XFFFF8C42),
  //       colorText: Colors.white,
  //     );
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Future<void> getCbt() async {
  //   isLoading.value = true;
  //   // OverlayLoadingProgress.start(
  //   //   context: Get.context!,
  //   //   circularProgressColor: Color(0XFFFF8C42),

  //   // );a
  //   try {
  //     var classId = dashboardExtendedViewController.selectedClassID;
  //     final response = await _apiService.cbt(
  //       classId.toString(),
  //       dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
  //     );
  //     // myLog.log(
  //     //   "classId: ${classId}, studentId: ${controller.selectedStudent1!.studentID}",
  //     // );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       isLoading.value = false;

  //       cbt = cbtFromJson(response.body);
  //       cbtData = cbt!.data;

  //       //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
  //       // OverlayLoadingProgress.stop();
  //       //   Get.toNamed(AppRoutes.signFourScreen);
  //     } else if (response.statusCode == 404 || response.statusCode == 401) {
  //       isLoading.value = false;
  //       //Get.offAllNamed(AppRoutes.signTwoScreen);
  //       // OverlayLoadingProgress.stop();
  //       var responseData = jsonDecode(response.body);
  //       var message = responseData['message'];
  //       Get.snackbar(
  //         'Error',
  //         message,
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     } else {
  //       isLoading.value = false;
  //       // OverlayLoadingProgress.stop();
  //       Get.snackbar(
  //         'Error',
  //         'cbt fetch failed. Please try again.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } on SocketException {
  //     Get.snackbar(
  //       'Opps!!!',
  //       'Check your internet connection and try again.',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Color(0XFFFF8C42),
  //       colorText: Colors.white,
  //     );
  //     isLoading.value = false;
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     isLoading.value = false;
  //     //OverlayLoadingProgress.stop();
  //   } finally {
  //     // OverlayLoadingProgress.stop();
  //     isLoading.value = false;
  //   }
  // }

  // //cbtDetails()
  // Future<void> getCbtResult() async {
  //   isLoading.value = true;
  //   // OverlayLoadingProgress.start(
  //   //   context: Get.context!,
  //   //   circularProgressColor: Color(0XFFFF8C42),

  //   // );a
  //   try {
  //     var classId = dashboardExtendedViewController.selectedClassID;
  //     final response = await _apiService.cbt(
  //      // controller.selectedClassID.toString(),
  //       classId.toString(),
  //       dashboardExtendedViewController.selectedStudent1!.studentID.toString()
  //     );
  //     // myLog.log(
  //     //   "classId: ${classId}, studentId: ${controller.selectedClassID}",
  //     // );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       isLoading.value = false;

  //       cbt = cbtFromJson(response.body);
  //       cbtData = cbt!.data;

  //       //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
  //       // OverlayLoadingProgress.stop();
  //       //   Get.toNamed(AppRoutes.signFourScreen);
  //     } else if (response.statusCode == 404 || response.statusCode == 401) {
  //       isLoading.value = false;
  //       //Get.offAllNamed(AppRoutes.signTwoScreen);
  //       // OverlayLoadingProgress.stop();
  //       var responseData = jsonDecode(response.body);
  //       var message = responseData['message'];
  //       Get.snackbar(
  //         'Error',
  //         message,
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     } else {
  //       isLoading.value = false;
  //       // OverlayLoadingProgress.stop();
  //       Get.snackbar(
  //         'Error',
  //         'cbt fetch failed. Please try again.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } on SocketException {
  //     Get.snackbar(
  //       'Opps!!!',
  //       'Check your internet connection and try again.',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Color(0XFFFF8C42),
  //       colorText: Colors.white,
  //     );
  //     isLoading.value = false;
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     isLoading.value = false;
  //     //OverlayLoadingProgress.stop();
  //   } finally {
  //     // OverlayLoadingProgress.stop();
  //     isLoading.value = false;
  //   }
  // }

  AcademicsAssignmentStatusController controls = Get.put(
    AcademicsAssignmentStatusController(),
  );

  Future<void> getAssignment() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    isLoading.value = true;
    // );
    try {
      var studentID =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      var classID = dashboardExtendedViewController.selectedClassID;
      // myLog.log(
      //   'parameters: student id: $studentID, $classID, ${termType.value}, $selectedStatus',
      // );
      final response = await _apiService.getStudentAssignment(
        studentID.toString(),
        classID.toString(),
        controls.termTypeId.value,
        controls.selectedStatus.value,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        assignment = assignmentFromJson(response.body);
        assignmentData = assignment!.data;
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
    }
  }

  Future<void> getAssignmentDetail(String id) async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    // isDetailLoading.value = true;
    try {
      final response = await _apiService.getStudentAssignmentById(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Assignemt Retrived',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        OverlayLoadingProgress.stop();
        // isDetailLoading.value = false;
        assignmentDetails = assignmentDetailsFromJson(response.body);
        Get.toNamed(
          AppRoutes.academicsAssignmentAnswerScreen,
          arguments: {'model': assignmentDetails},
        );
        myLog.log(assignmentDetails!.data!.subjectName!);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        // isDetailLoading.value = false;
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
        //  isDetailLoading.value = false;
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      OverlayLoadingProgress.stop();
      // isDetailLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      myLog.log(e.toString());
      OverlayLoadingProgress.stop();
      //  isDetailLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      OverlayLoadingProgress.stop();
    } finally {
      // isDetailLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }
}
