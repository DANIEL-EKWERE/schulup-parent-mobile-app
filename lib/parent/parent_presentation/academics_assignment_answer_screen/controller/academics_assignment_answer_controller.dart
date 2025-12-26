// TODO Implement this library.
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_answer_screen/models/assignment_thread_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_answer_screen/models/reply_model.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/comments_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_answer_model.dart';

/// A controller class for the AcademicsAssignmentAnswerScreen.
///
/// This class manages the state of the AcademicsAssignmentAnswerScreen, including the
/// current academicsAssignmentAnswerModelObj
class AcademicsAssignmentAnswerController extends GetxController {
  Rx<AcademicsAssignmentAnswerModel> academicsAssignmentAnswerModelObj =
      AcademicsAssignmentAnswerModel().obs;
  DashboardExtendedViewController controller =
      Get.find<DashboardExtendedViewController>();
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  RxList<Messages> tempMessageList = <Messages>[].obs;

  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();
  // ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  // DailyReport? dailyReports;
  // List<DailyReportDate> dailyReportDataList = [];

  // ReportModel? reportsWeekly;
  // List<ReportData> reportDataWeeklyList = [];

  // ReportModel? reportsTermly;
  // List<ReportData> reportDataTermlyList = [];

  Comments? commets;
  List<Messages> messageList = [];

  AssignmentThread? assignmentThread;
  List<Replies> replies = [];
  // ReportData? selectedReport;

  // DailyReportDate? selectedDailyReport;

  String? selectedReportId;
  Rx<bool> isCommentsSendLoading = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isCommentsLoading = false.obs;
  Rx<bool> isLoading1 = false.obs;

  TextEditingController replyController = TextEditingController();
  StudentReply? studentReply;

  Future<void> studentReplyCall(String assignmentId) async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isCommentsSendLoading.value = true;
    try {
      final body = {
        "assignmentId": assignmentId,
        "replyText": replyController.text,
      };
      print(body);

      final response = await _apiService.studentReply(
        body,
        controller.selectedStudent1!.studentID.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //  OverlayLoadingProgress.stop();
        isCommentsSendLoading.value = false;
        replyController.clear();
        studentReply = studentReplyFromJson(response.body);
        //TODO: call thread endpoint
        studentThread(assignmentId);
        AlertInfo.show(context: Get.context!, text: 'Message to be displayed');
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        // OverlayLoadingProgress.stop();
        isCommentsSendLoading.value = false;
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
        // OverlayLoadingProgress.stop();
        isCommentsSendLoading.value = false;
        Get.snackbar(
          'Error',
          'Reply failed. Please try again.',
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
      isCommentsSendLoading.value = false;
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
      isCommentsSendLoading.value = false;
      //OverlayLoadingProgress.stop();
    } finally {
      //OverlayLoadingProgress.stop();
      isCommentsSendLoading.value = false;
    }
  }

  Future<void> studentThread(String assignmentId) async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      final response = await _apiService.studentThreadById(
        assignmentId,
        controller.selectedStudent1!.studentID.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //  OverlayLoadingProgress.stop();
        isLoading.value = false;
        replyController.clear();

        assignmentThread = assignmentThreadFromJson(response.body);
        replies = assignmentThread!.data!.replies!;
        myLog.log(replies.first.replyText.toString());
        AlertInfo.show(context: Get.context!, text: 'Message to be displayed');
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        // OverlayLoadingProgress.stop();
        isLoading.value = false;
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
        // OverlayLoadingProgress.stop();
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Reply failed. Please try again.',
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    } finally {
      //OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }
}
