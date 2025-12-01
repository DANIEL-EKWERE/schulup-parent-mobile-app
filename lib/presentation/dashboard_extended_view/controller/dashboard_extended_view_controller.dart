import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/core/utils/storage.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/academics_assignment_status_initial_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/models/academics_session_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/models/student_batch_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/models/student_class_model.dart';

class DashboardExtendedViewController extends GetxController {
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Rx<bool> isLoading = false.obs;
//AcademicsAssignmentStatusController controllerx = Get.find<AcademicsAssignmentStatusController>();
  List<Student> students = [];
  AcademicsAssignmentStatusInitialModel? academicsAssignmentStatusInitialModel;
  Student? selectedStudent;
  Student? selectedStudent1;
  Rx<String>? selectedClass;
  AcademicSessionData? selectedAcademicSessionData;

  StudentClass studentClassObj = StudentClass();
  StudentBatch studentBatchObj = StudentBatch();
  AcademicSession academicSessionObj = AcademicSession();

  List<ClassData> classDataList = [];
  List<BatchData> batchDataList = [];
  List<AcademicSessionData> academicSessionDataList = [];

  int? selectedClassID;
  int? selectedTerm;

  @override
  void onInit() {
    super.onInit();
    byGuardian();
    // Timer(Duration(seconds: 3), () {
      
    // });
  }

  Future<void> byGuardian() async {
    // getBatch(); 
    // getClass(); 
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      var userId = await dataBase.getUserId();
      myLog.log('User ID: $userId');
      final response = await _apiService.byGuardian(userId.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        // // OverlayLoadingProgress.stop();
        // // myLog.log('Login successful: ${response.body}');
        // // schoolCodeInputController.dispose();
        // // usernameInputController.dispose();
        // // passwordInputController.dispose();
        // var responseData = jsonDecode(response.body);
        // myLog.log(responseData.toString());
        isLoading.value = false;
        academicsAssignmentStatusInitialModel =
            academicsAssignmentStatusInitialModelFromJson(response.body);
        students = academicsAssignmentStatusInitialModel?.data ?? [];
        myLog.log('Students: ${students.length}');
        if (students.isNotEmpty) {
          selectedStudent = students.first;
          selectedStudent1 = students.first;
        }
        //   OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      await  getBatch();
    await  getClass();
     await getAcademicSessions();

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
      myLog.log('Error: ${e.toString()}');
    } finally {
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    }
  }




  Future<void> getAcademicSessions() async {
    // getBatch(); 
    // getClass(); 
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      var userId = await dataBase.getUserId();
      myLog.log('User ID: $userId');
      final response = await _apiService.getAcademicSessions(selectedStudent1!.studentID.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        // // OverlayLoadingProgress.stop();
        // // myLog.log('Login successful: ${response.body}');
        // // schoolCodeInputController.dispose();
        // // usernameInputController.dispose();
        // // passwordInputController.dispose();
        // var responseData = jsonDecode(response.body);
        // myLog.log(responseData.toString());
        isLoading.value = false;
        academicSessionObj = academicSessionFromJson(response.body);
        academicSessionDataList = academicSessionObj.data ?? [];
        selectedAcademicSessionData = academicSessionDataList.isNotEmpty ? academicSessionDataList.first : null;
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
      myLog.log('Error: ${e.toString()}');
    } finally {
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    }
  }





  Future<void> getClass() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    isLoading.value = true;
    // );
    try {
      
      final response = await _apiService.getClass(selectedStudent1!.studentID.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
          studentClassObj = studentClassFromJson(response.body);
          classDataList = studentClassObj.data ?? [];
          selectedClassID = classDataList.first.classID;
          selectedClass!.value = classDataList.first.name!;
        // myLog.log('Token: $responseData');

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
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }



  Future<void> getBatch() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
     
      final response = await _apiService.getBatch(selectedStudent1!.studentID.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        // var responseData = jsonDecode(response.body);

        // myLog.log('Token: $responseData');
          studentBatchObj = studentBatchFromJson(response.body);
          batchDataList = studentBatchObj.data ?? [];

        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        // OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        // OverlayLoadingProgress.stop();
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
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }
}
