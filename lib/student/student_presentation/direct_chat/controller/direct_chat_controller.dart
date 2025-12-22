import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/direct_chat/models/models.dart';
import 'package:schulupparent/student/student_presentation/direct_chat/models/ongoing_conversation_model.dart';
import 'package:schulupparent/student/student_presentation/direct_message_screen/direct_message_screen.dart';

class StudentDirectChatController extends GetxController {
  //students/47135/classteachers
  StudentDashboardExtendedViewController dashboardcontroller =
      Get.find<StudentDashboardExtendedViewController>();

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  TextEditingController subjectController = TextEditingController();

  ClassTeacher? classTeacher;
  List<TeacherData>? teacherData;
  Rx<bool> isLoading = false.obs;

  OngoingConversations? ongoingConversations;
  List<Conversations>? conversations;

  @override
  onInit() {
    super.onInit();
    getTeachers();
    getUserConversations();
  }

  Future<void> getTeachers() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    try {
      var studentID = dashboardcontroller.selectedStudent1!.studentID;
      myLog.log(studentID.toString());
      final response = await _apiService.getTeachers(studentID!.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        classTeacher = classTeacherFromJson(response.body);
        teacherData = classTeacher!.data;
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar(
          'Opps!!!',
          'No data found.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0XFFFF8C42),
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

  Future<void> getUserConversations() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    try {
      // var studentID = dashboardcontroller.selectedStudent1!.studentID;
      // myLog.log(studentID.toString());
      final response = await _apiService.getUserConversations();
      if (response.statusCode == 200 || response.statusCode == 201) {
        ongoingConversations = ongoingConversationsFromJson(response.body);
        conversations = ongoingConversations!.data!.conversations;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        Get.snackbar(
          'Opps!!!',
          'No data found.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0XFFFF8C42),
          colorText: Colors.white,
        );
      } else {
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'fetching Conversation failed. Please try again.',
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

  Future<void> startConversation(String participantUserIDs) async {
    // isLoading.value = true;
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      Map<String, dynamic> body = {
        "subject": subjectController.text,
        //"participantUserIDs": [101, 203, 405]
        "participantUserIDs": [participantUserIDs],
      };
      // var studentID = dashboardcontroller.selectedStudent1!.studentID;
      // myLog.log(studentID.toString());
      final response = await _apiService.startConversation(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Get.to(() => ChatScreen());
        OverlayLoadingProgress.stop();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //isLoading.value = false;
        Get.snackbar(
          'Opps!!!',
          'No data found.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0XFFFF8C42),
          colorText: Colors.white,
        );
      } else {
        // isLoading.value = false;
        OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'fetching Conversation failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      //isLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      // isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      OverlayLoadingProgress.stop();
      myLog.log(e.toString());
    } finally {
      //  isLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }
}
