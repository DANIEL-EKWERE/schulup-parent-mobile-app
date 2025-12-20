// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/data/model/selectionPopupModel/selection_popup_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/lesson_model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_all_lessons_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the AcademicsLessonAllLessonsPage.
///
/// This class manages the state of the AcademicsLessonAllLessonsPage, including the
/// current academicsLessonAllLessonsModelObj
class StudentAcademicsLessonAllLessonsController extends GetxController {
  StudentAcademicsLessonAllLessonsController(
    this.academicsLessonAllLessonsModelObj,
  );

  Rx<StudentAcademicsLessonAllLessonsModel> academicsLessonAllLessonsModelObj;

  StudentAcademicsAssignmentStatusController controllerx = Get.put(
    StudentAcademicsAssignmentStatusController(),
  );

  Lesson lesson = Lesson();

  List<StudentLessonData> studentLessonList = [];

  SelectionPopupModel? selectedDropDownValue;

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Rx<bool> isLoading = false.obs;
  StudentDashboardExtendedViewController dashboardExtendedViewController =
      Get.find<StudentDashboardExtendedViewController>();
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

  @override
  onInit() {
    super.onInit();
    allLessons();
  }

  Future<void> allLessons() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    var termId;
    // );
    try {
      if (controllerx.termType.value == 'First') {
        termId = '1';
      } else if (controllerx.termType.value == 'Second') {
        termId = '2';
      } else if (controllerx.termType.value == 'Third') {
        termId = '3';
      }
      final response = await _apiService.allLessons(
        dashboardExtendedViewController.selectedClassID.toString(),
        termId,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        studentLessonList = lessonFromJson(response.body).data!;
        myLog.log('Lessons Length: ${studentLessonList.length}');

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
          'Login failed. Please try again.',
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
