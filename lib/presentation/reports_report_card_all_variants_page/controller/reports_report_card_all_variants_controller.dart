import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_all_variants_page/models/report_model.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_all_variants_model.dart';

/// A controller class for the ReportsReportCardAllVariantsPage.
///
/// This class manages the state of the ReportsReportCardAllVariantsPage, including the
/// current reportsReportCardAllVariantsModelObj
class ReportsReportCardAllVariantsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ReportsReportCardAllVariantsController(
    this.reportsReportCardAllVariantsModelObj,
  );

  Rx<ReportsReportCardAllVariantsModel> reportsReportCardAllVariantsModelObj;

  Rx<String> termType = 'First Term'.obs;
  Rx<String> dayType = 'Daily'.obs;
  Rx<String> session = ''.obs;
  Rx<int> selectedTermId = 1.obs;
  Rx<int> tabIndex = 0.obs;
  Rx<String> date = ''.obs;
  DateTime? datex; 
  late TabController tabviewController = Get.put(
    TabController(vsync: this, length: 3),
  );
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  void onrefresh() {
    getWeeklyReports();
  }

  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  ReportModel? reports;
  List<ReportData> reportDataList = [];

  ReportModel? reportsWeekly;
  List<ReportData> reportDataWeeklyList = [];

  ReportModel? reportsTermly;
  List<ReportData> reportDataTermlyList = [];

  ReportData? selectedReport;
  String? selectedReportId;

  Rx<bool> isLoading = false.obs;
  Rx<bool> isLoading1 = false.obs;

  // SubjectProgressModel? subjectProgress;
  // List<SubjectProgressData> subjectProgressDataList = [];
  @override
  void onInit() {
    super.onInit();
    getWeeklyReports();
    getTermlyReports();
    datex = DateTime.now();
    date.value = formatDate(datex.toString()); 
    // getTermlyReports();
    // Timer(Duration(seconds: 3), (){
    //   getSubjectProgress();
    // });
    session.value =
        dashboardExtendedViewController.selectedAcademicSessionData!.name!;
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM. d, yyyy').format(dateTime);
  }

  Future<void> getTermlyReports() async {
    isLoading.value = true;
    try {
      if (termType.value.contains('First Term')) {
        selectedTermId.value = 1;
      } else if (termType.value.contains('Second Term')) {
        selectedTermId.value = 2;
      } else if (termType.value.contains('Third Term')) {
        selectedTermId.value = 3;
      }
      final response = await _apiService.getTermlyReport(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        dashboardExtendedViewController
            .selectedAcademicSessionData!
            .academicSessionID
            .toString(),
        selectedTermId.value.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        reportsTermly = reportModelFromJson(response.body);
        reportDataTermlyList = reportsTermly!.data!;
        selectedReport =
            reportDataTermlyList.isNotEmpty ? reportDataTermlyList.first : null;
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

  Future<void> getWeeklyReports() async {
    isLoading.value = true;
    try {
      if (termType.value.contains('First Term')) {
        selectedTermId.value = 1;
      } else if (termType.value.contains('Second Term')) {
        selectedTermId.value = 2;
      } else if (termType.value.contains('Third Term')) {
        selectedTermId.value = 3;
      }
      final response = await _apiService.getWeeklyReport(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        dashboardExtendedViewController
            .selectedAcademicSessionData!
            .academicSessionID
            .toString(),
        selectedTermId.value.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        reportsWeekly = reportModelFromJson(response.body);
        reportDataWeeklyList = reportsWeekly!.data!;
        selectedReport =
            reportDataWeeklyList.isNotEmpty ? reportDataWeeklyList.first : null;
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

  Future<void> getDailyReports() async {
    isLoading.value = true;
    try {
      if (termType.value.contains('First Term')) {
        selectedTermId.value = 1;
      } else if (termType.value.contains('Second Term')) {
        selectedTermId.value = 2;
      } else if (termType.value.contains('Third Term')) {
        selectedTermId.value = 3;
      }
      final response = await _apiService.getDailyReport(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        dashboardExtendedViewController
            .selectedAcademicSessionData!
            .academicSessionID
            .toString(),
        selectedTermId.value.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        reports = reportModelFromJson(response.body);
        reportDataList = reports!.data!;
        selectedReport =
            reportDataList.isNotEmpty ? reportDataList.first : null;
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
}
