import 'dart:convert';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/direct_chat/models/models.dart';
import 'package:schulupparent/student/student_presentation/direct_chat/models/ongoing_conversation_model.dart';
import 'package:schulupparent/student/student_presentation/signalr_chat/signalr_chat_screen.dart';
//import 'package:schulupparent/student/student_presentation/direct_message_screen/direct_message_screen.dart';
import '../../../core/app_export.dart';

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

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  void onrefresh() {
    getTeachers();
    getUserConversations();
  }

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
        Fluttertoast.showToast(
          webShowClose: true,
          msg: 'No data found.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
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
        Fluttertoast.showToast(
          webShowClose: true,
          msg: 'No data found.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        Fluttertoast.showToast(
          webShowClose: true,
          msg: 'fetching Conversation failed. Please try again.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
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
        var responseData = jsonDecode(response.body);
        myLog.log(responseData['data']['conversationID'].toString());
        Get.to(
          () => ChatScreen(),
          arguments: {
            'conversationId': responseData['data']['conversationID'],
            // 'userId':
            //     conversation.,
            'teacherName': 'Teacher',
            'subject': subjectController.text,
          },
        );

        OverlayLoadingProgress.stop();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //isLoading.value = false;
        Fluttertoast.showToast(
          webShowClose: true,
          msg: 'No data found.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        // isLoading.value = false;
        OverlayLoadingProgress.stop();
        Fluttertoast.showToast(
          webShowClose: true,
          msg: 'fetching Conversation failed. Please try again.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } on SocketException {
      //isLoading.value = false;
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
      // isLoading.value = false;
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
      OverlayLoadingProgress.stop();
      myLog.log(e.toString());
    } finally {
      //  isLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }
}
