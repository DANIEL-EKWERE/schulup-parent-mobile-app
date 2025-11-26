import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_page/models/subject_model.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_page/models/subject_progress_model.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_subject_model.dart';

/// A controller class for the ReportsWardProgressSubjectPage.
///
/// This class manages the state of the ReportsWardProgressSubjectPage, including the
/// current reportsWardProgressSubjectModelObj
class ReportsWardProgressSubjectController extends GetxController {
  ReportsWardProgressSubjectController(this.reportsWardProgressSubjectModelObj);

  Rx<ReportsWardProgressSubjectModel> reportsWardProgressSubjectModelObj;
DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();
    ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

Subjects? subjects;
List<SubjectData> subjectDataList = [];

SubjectData? selectedSubject;
String? selectedSubjectId;

Rx<bool> isLoading = false.obs;

SubjectProgressModel? subjectProgress;
List<SubjectProgressData> subjectProgressDataList = [];
@override
void onInit (){
super.onInit();
getSubjects();
Timer(Duration(seconds: 3), (){
  getSubjectProgress();
});
}

  Future<void> getSubjects() async {
    isLoading.value = true;
    try {
      
      final response = await _apiService.getSubjects(dashboardExtendedViewController.selectedStudent1!.studentID.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        subjects = subjectsFromJson(response.body);
        subjectDataList = subjects!.data!;
        selectedSubject = subjectDataList.isNotEmpty ? subjectDataList.first : null;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        
        
      } else {
        // OverlayLoadingProgress.stop();
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
      isLoading.value = false;
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  //selectedSubjectId

  Future<void> getSubjectProgress() async {
    isLoading.value = true;
    try {
      
      final response = await _apiService.getSubjectProgress(dashboardExtendedViewController.selectedStudent1!.studentID.toString(), selectedSubjectId ?? subjectDataList.first.subjectMasterID.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        subjectProgress = subjectProgressFromJson(response.body);
        subjectProgressDataList = subjectProgress!.data!;
        
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        
        
      } else {
        // OverlayLoadingProgress.stop();
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
      // OverlayLoadingProgress.stop();
    }
  }
}
