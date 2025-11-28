// TODO Implement this library.
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/presentation/academics_assignment_answer_screen/models/reply_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
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

  TextEditingController replyController = TextEditingController();
  StudentReply? studentReply;

  Future<void> studentReplyCall(String assignmentId) async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
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
        OverlayLoadingProgress.stop();
        replyController.clear();
        studentReply = studentReplyFromJson(response.body);
        AlertInfo.show(context: Get.context!, text: 'Message to be displayed');
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
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
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
