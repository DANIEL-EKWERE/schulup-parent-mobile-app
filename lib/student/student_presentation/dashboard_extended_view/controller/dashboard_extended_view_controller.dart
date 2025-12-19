import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/student/core/utils/storage.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/academics_assignment_status_initial_model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_edit_ward_profile/model/model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/models/academics_session_model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/models/student_batch_model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/models/student_class_model.dart';
import 'package:schulupparent/student/student_presentation/news_all_variants_page/models/news_model.dart';

class StudentDashboardExtendedViewController extends GetxController {
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Rx<bool> isLoading = false.obs;
  //AcademicsAssignmentStatusController controllerx = Get.find<AcademicsAssignmentStatusController>();
  List<Student> students = [];
  AcademicsAssignmentStatusInitialModel? academicsAssignmentStatusInitialModel;
  Student? selectedStudent;
  Student selectedStudent1 = Student();
  Rx<String> selectedClass = 'n/a'.obs;
  String? selectedStudentClass;
  Rx<String> selectedSession = 'n/a'.obs;
  AcademicSessionData? selectedAcademicSessionData;
  StudentProfile? studentProfile;

  StudentClass studentClassObj = StudentClass();
  StudentBatch studentBatchObj = StudentBatch();
  AcademicSession academicSessionObj = AcademicSession();

  List<ClassData> classDataList = [];
  List<BatchData> batchDataList = [];
  List<AcademicSessionData> academicSessionDataList = [];

  NewsResponse? newsResponse;
  List<NewsItem> newsItems = [];

  int? selectedClassID;
  int? selectedTerm;

  @override
  void onInit() {
    super.onInit();
    // byGuardian();
    setVAlue();
    // Timer(Duration(seconds: 3), () {0101

    // });
  }

  void setVAlue() async {
    myLog.log('setting value');
    int studentId = await studentDataBase.getStudentId();
    // String studentName = await dataBase.getUserName();
    myLog.log('setting $studentId');
    selectedStudent1.studentID = studentId;
    selectedStudent1.firstName = await studentDataBase.getUserName();
    myLog.log('value set');

    await getBatch();
    await getClass();
    await getAcademicSessions();
    await getNews();
    await getStudentInfo();
  }

  Future<void> getStudentInfo() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      String studentId = selectedStudent1.studentID.toString();
      final response = await _apiService.getStudentsById(studentId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        studentProfile = studentProfileFromJson(response.body);
        isLoading.value = false;
        selectedStudent1.profilePicBase64 =
            studentProfile!.data!.profilePicBase64;
        // lastNameController.text = studentProfile!.data!.lastName!;
        // firstNameController.text = studentProfile!.data!.firstName!;
        // middleNameController.text = studentProfile!.data!.middleName!;
        // genderController.text = studentProfile!.data!.gender!;
        // dateOfBirthController.text = studentProfile!.data!.dateOfBirth!;
        // bloodGroupController.text = studentProfile!.data!.bloodGroup!;
        // genotypeController.text = studentProfile!.data!.genotype!;
        // stateController.text = studentProfile!.data!.state!;
        // cityController.text = studentProfile!.data!.city!;
        // addressController.text = studentProfile!.data!.address!;
        // religionController.text = studentProfile!.data!.religion!;
        // languageController.text = studentProfile!.data!.language!;
        //   OverlayLoadingProgress.stop();
        Get.snackbar(
          'Success',
          'Student information retrived successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        //Get.back(); // Go back after successful update
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        //OverlayLoadingProgress.stop();
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
        //  OverlayLoadingProgress.stop();
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Update failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      //  OverlayLoadingProgress.stop();
      isLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
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
      var userId = await studentDataBase.getUserId();
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
        await getBatch();
        await getClass();
        await getAcademicSessions();
        await getNews();
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
      var userId = await studentDataBase.getUserId();
      myLog.log('User ID: $userId');
      final response = await _apiService.getAcademicSessions(
        selectedStudent1!.studentID.toString(),
      );
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
        selectedAcademicSessionData =
            academicSessionDataList.isNotEmpty
                ? academicSessionDataList.first
                : null;
        for (var session in academicSessionDataList) {
          myLog.log(session.isActive.toString());
          if (session.isActive == true) {
            selectedSession.value = session.name ?? 'n/a';
            myLog.log('Found an active session ${session.name}');
            break; // Stop once found
          } else {
            myLog.log('active session not found');
            selectedSession.value = 'No Active Session';
          }
        }
        myLog.log("seesion List ${academicSessionDataList.first}");
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
    myLog.log('get class called');
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    isLoading.value = true;
    // );
    try {
      final response = await _apiService.getClass(
        selectedStudent1!.studentID.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        myLog.log(response.body);
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        studentClassObj = studentClassFromJson(response.body);
        classDataList = studentClassObj.data ?? [];
        //myLog.log('Token: ${classDataList.first.name}');
        selectedClassID = classDataList.first.classID;
        //myLog.log('Token: ${classDataList.first.name}');
        // selectedClass!.value = classDataList.first.name!;
        // myLog.log('Token: ${classDataList.first.name}');
        // myLog.log('Token: $classDataList');

        for (var studentClass in classDataList) {
          myLog.log(studentClass.name!);
          if (studentClass.isActive == true) {
            myLog.log('Token: xxx');
            myLog.log('Token: ${studentClass.isActive}');
            myLog.log('Token: ${studentClass.name}');
            selectedStudentClass = studentClass.name!;
            selectedClass.value = studentClass.name ?? 'n/a';
            myLog.log('class id before: ${selectedClassID}');
            selectedClassID = studentClass.classID;
            myLog.log('class id after: ${selectedClassID}');
            myLog.log('Token: assigned');
            // myLog.log('Token: ${selectedClass!.value}');
            // myLog.log('Found an active class ${studentClass.name}');
            break;
          } else {
            myLog.log('active class not found');
            selectedClass!.value = 'No Active Class';
          }
        }

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
      myLog.log(e.toString());
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
      final response = await _apiService.getBatch(
        selectedStudent1!.studentID.toString(),
      );
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

  Future<void> getNews() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      final response = await _apiService.getNews();
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        var responseData = jsonDecode(response.body);
        newsResponse = newsResponseFromJson(response.body);
        newsItems =
            newsResponse!.data.news.length > 3
                ? newsResponse!.data.news.sublist(0, 3)
                : newsResponse!.data.news;
        // carouselItems.value = allItems.length > 3
        //   ? allItems.sublist(0, 3)
        //   : allItems;
        // var token = responseData['data']['token'];
        // var userId = responseData['data']['userID'];
        // var userName = responseData['data']['displayName'];
        // myLog.log('Token: $token');
        // dataBase.saveToken(token);
        // dataBase.saveUserId(userId);
        // dataBase.saveUserName(userName);
        // dataBase.saveTransactionPin(passwordController.text);
        // dataBase.saveBrmCode(schoolCodeController.text);
        // usernameController.clear();
        // passwordController.clear();
        // schoolCodeController.clear();
        //Get.offAllNamed(AppRoutes.signinScreen,);
        myLog.log(response.body);

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
          'Fetching news failed. Please try again.',
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
