import 'dart:async';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/reports_ward_progress_subject_page/models/subject_model.dart';
import 'package:schulupparent/student/student_presentation/reports_ward_progress_subject_page/models/subject_progress_model.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_subject_model.dart';

/// A controller class for the ReportsWardProgressSubjectPage.
///
/// This class manages the state of the ReportsWardProgressSubjectPage, including the
/// current reportsWardProgressSubjectModelObj
class ReportsWardProgressSubjectController extends GetxController {
  ReportsWardProgressSubjectController(this.reportsWardProgressSubjectModelObj);

  Rx<ReportsWardProgressSubjectModel> reportsWardProgressSubjectModelObj;
  StudentDashboardExtendedViewController dashboardExtendedViewController =
      Get.find<StudentDashboardExtendedViewController>();
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Subjects? subjects;
  RxList<SubjectData> subjectDataList = <SubjectData>[].obs;

  Rx<bool> isSubjectLoading = false.obs;
  SubjectData? selectedSubject;
  Rx<String> selectedSubjectName = 'N/A'.obs;
  String? selectedSubjectId;

  Rx<bool> isLoading = false.obs;

  SubjectProgressModel? subjectProgress;
  List<SubjectProgressData> subjectProgressDataList = [];
  @override
  void onInit() {
    super.onInit();
    getSubjects();
    Timer(Duration(seconds: 1), () {
      getSubjectProgress();
    });
  }

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  void onrefresh() {
    getSubjects();
    getSubjectProgress();
  }

  Future<void> getSubjects() async {
    isSubjectLoading.value = true;
    try {
      final response = await _apiService.getSubjects(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSubjectLoading.value = false;
        subjects = subjectsFromJson(response.body);
        subjectDataList.clear();
        subjectDataList.value = subjects!.data!;
        selectedSubject =
            subjectDataList.isNotEmpty ? subjectDataList.first : null;
        selectedSubjectName.value =
            (subjectDataList.isNotEmpty ? subjectDataList.first.name : null)!;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isSubjectLoading.value = false;
      } else {
        // OverlayLoadingProgress.stop();
        isSubjectLoading.value = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Fluttertoast.showToast(
            webShowClose: true,
            msg: 'Something went wrong. Please try again.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });
      }
    } on SocketException {
      isSubjectLoading.value = false;
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
      isSubjectLoading.value = false;
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
      isSubjectLoading.value = false;
    } finally {
      // OverlayLoadingProgress.stop();
      isSubjectLoading.value = false;
    }
  }

  //selectedSubjectId

  Future<void> getSubjectProgress() async {
    isLoading.value = true;
    myLog.log('calling subject progress method');
    try {
      final response = await _apiService.getSubjectProgress(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        selectedSubjectId ?? subjectDataList.first.subjectMasterID.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        myLog.log(response.body);
        isLoading.value = false;
        subjectProgress = subjectProgressFromJson(response.body);
        myLog.log('message :${subjectProgress!.data!.length}');
        subjectProgressDataList = subjectProgress!.data!;
        myLog.log(subjectProgress!.data!.toString());
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
      } else {
        // OverlayLoadingProgress.stop();
        isLoading.value = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Fluttertoast.showToast(
            webShowClose: true,
            msg: 'Something went wrong. Please try again.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });
      }
    } on SocketException {
      isLoading.value = false;
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
      isLoading.value = false;
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
      isLoading.value = false;
      // OverlayLoadingProgress.stop();
    }
  }
}
