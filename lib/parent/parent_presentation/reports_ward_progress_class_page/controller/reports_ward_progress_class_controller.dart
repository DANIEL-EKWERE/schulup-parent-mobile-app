// TODO Implement this library.
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/parent/parent_presentation/reports_ward_progress_class_page/models/class_overview_model.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_class_model.dart';

// List<String> type = ["lbl_first".tr, "lbl_second".tr, "lbl_third".tr];
//   List<String> selectedType = [controller1.termType.value];
/// A controller class for the ReportsWardProgressClassPage.
///
/// This class manages the state of the ReportsWardProgressClassPage, including the
/// current reportsWardProgressClassModelObj
class ReportsWardProgressClassController extends GetxController {
  ReportsWardProgressClassController(this.reportsWardProgressClassModelObj);

  TextEditingController frame427321469Controller = TextEditingController();

  TextEditingController frame427321470Controller = TextEditingController();

  TextEditingController frame427321471Controller = TextEditingController();

  TextEditingController frame427321472Controller = TextEditingController();

  TextEditingController frame427321473Controller = TextEditingController();

  TextEditingController frame427321474Controller = TextEditingController();

  TextEditingController frame427321475Controller = TextEditingController();

  Rx<ReportsWardProgressClassModel> reportsWardProgressClassModelObj;

  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();

  @override
  void onInit() {
    super.onInit();
    academicPerformance();
    classOverview();
    selectedBatch.value =
        dashboardExtendedViewController.batchDataList.first.name!;
  }

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  void onrefresh() {
    academicPerformance();
    classOverview();
    selectedBatch.value =
        dashboardExtendedViewController.batchDataList.first.name!;
  }

  Rx<String> selectedBatch = "".obs;
  Rx<int> selectedBatchId = 0.obs;
  Rx<bool> isLoading = false.obs;

  List<AcademicsPerformance>? selectedPerformance = [];
  ReportsWardProgressClassModel? reportsWardProgressClassModel;
  ClassOverview? classOverviewModel;
  List<SubjectData>? selectedSubjectPerformance = [];

  @override
  void onClose() {
    super.onClose();
    frame427321469Controller.dispose();
    frame427321470Controller.dispose();
    frame427321471Controller.dispose();
    frame427321472Controller.dispose();
    frame427321473Controller.dispose();
    frame427321474Controller.dispose();
    frame427321475Controller.dispose();
  }

  // DashboardExtendedViewController dashboardExtendedViewController =
  //     Get.find<DashboardExtendedViewController>();

  @override
  void onReady() {
    super.onReady();
  }

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Future<void> academicPerformance() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    myLog.log('calling progress');
    isLoading.value = true;
    try {
      var studentID =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      final response = await _apiService.academicsPerformance(
        studentID.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        myLog.log(response.body);
        ReportsWardProgressClassModel reportsWardProgressClassModel =
            reportsWardProgressClassModelFromJson(response.body);
        selectedPerformance = reportsWardProgressClassModel.data;
        //var responseData = jsonDecode(response.body);
        myLog.log('success =======================');
        // OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
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
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            'Login failed. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
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
      myLog.log(e.toString());
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  Future<void> classOverview() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      var studentID =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      var batchID = dashboardExtendedViewController.batchDataList.first.batchID;
      final response = await _apiService.classOverview(
        studentID.toString(),
        batchID.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        ClassOverview classOverviewModel = subjectPerformanceFromJson(
          response.body,
        );
        selectedSubjectPerformance = classOverviewModel.data;
        //var responseData = jsonDecode(response.body);
        //selectedBatch.value = selectedSubjectPerformance.first.;

        // OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
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
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            'Login failed. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
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
      myLog.log(e.toString());
      isLoading.value = false;
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
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }
}
