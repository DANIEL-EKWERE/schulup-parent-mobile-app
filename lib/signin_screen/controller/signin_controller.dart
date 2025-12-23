// import 'dart:convert';
// import 'dart:io';

// import 'package:alert_info/alert_info.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:overlay_kit/overlay_kit.dart';

// //TODO: PARENT ROUTING
// import 'package:schulupparent/parent/core/utils/storage.dart';
// import 'package:schulupparent/parent/data/apiClient/api_client.dart';
// import 'package:schulupparent/parent/routes/app_routes.dart';

// //TODO: STUDENT ROUTING
// import 'package:schulupparent/student/core/utils/storage.dart' as student;
// import 'package:schulupparent/student/data/apiClient/api_client.dart'
//     as student;
// import 'package:schulupparent/student/routes/app_routes.dart' as student;

// //TODO: STUDENT ROUTING
// import 'package:schulupparent/student/core/utils/storage.dart' as student;
// import 'package:schulupparent/student/data/apiClient/api_client.dart'
//     as student;
// import 'package:schulupparent/admin/routes/app_routes.dart' as admin;

// import 'dart:developer' as myLog;

// class SigninController extends GetxController {
//   ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

//   TextEditingController passwordController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController schoolCodeController = TextEditingController();
//   Rx<String> errorMessage = ''.obs;
//   Future<void> firstLogin() async {
//     OverlayLoadingProgress.start(
//       context: Get.context!,
//       circularProgressColor: Color(0XFFFF8C42),
//     );
//     try {
//       final body = {
//         "username": usernameController.text,
//         "password": passwordController.text,
//         "schoolCode": schoolCodeController.text,
//       };
//       print(body);
//       final response = await _apiService.firstLogin(body);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         //AlertInfo.show(context: Get.context!, text: 'Login Successful');
//         // OverlayLoadingProgress.stop();
//         // myLog.log('Login successful: ${response.body}');
//         // schoolCodeInputController.dispose();
//         // usernameInputController.dispose();
//         // passwordInputController.dispose();
//         var responseData = jsonDecode(response.body);
//         var token = responseData['data']['token'];
//         var userId = responseData['data']['userID'];
//         var userName = responseData['data']['displayName'];

//         myLog.log('Token: $token');
//         dataBase.saveToken(token);
//         myLog.log('Saved token');
//         dataBase.saveUserId(userId);
//         myLog.log('Saved user id');
//         dataBase.saveUserName(userName);
//         myLog.log('Saved user name');
//         dataBase.saveTransactionPin(passwordController.text);
//         myLog.log('Saved password');
//         dataBase.saveBrmCode(schoolCodeController.text);
//         myLog.log('Saved school code');
//         usernameController.clear();
//         passwordController.clear();
//         schoolCodeController.clear();
//         //student
//         //userType":4
//         if (responseData['data']['userType'] == 4) {
//           var guardianID = responseData['data']['guardianID'];
//           dataBase.saveGuardianID(guardianID);
//           Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen);
//         } else if (responseData['data']['userType'] == 3) {
//           Get.offAllNamed(student.AppRoutes.academicsAssignmentStatusScreen);
//         } else {
//           myLog.log('========================');
//           myLog.log(userId);
//           myLog.log(userName);
//           dataBase.saveToken(token);
//           dataBase.saveUserId(int.tryParse(userId)!);
//           dataBase.saveUserName(userName.toString());
//           dataBase.saveTransactionPin(passwordController.text.toString());
//           dataBase.saveBrmCode(schoolCodeController.text.toString());
//           usernameController.clear();
//           passwordController.clear();
//           schoolCodeController.clear();
//           Get.offAllNamed(admin.AppRoutes.homeScreen);
//         }

//         // if
//         //   Get.toNamed(AppRoutes.signFourScreen);
//         // myLog.log(name: 'User ID', userId);
//         // myLog.log(name: 'Login DATA', responseData);

//         // Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen);
//         OverlayLoadingProgress.stop();
//         //  AlertInfo.show(context: Get.context!, text: 'Login Successful');
//       } else if (response.statusCode == 404 || response.statusCode == 401) {
//         //Get.offAllNamed(AppRoutes.signTwoScreen);

//         OverlayLoadingProgress.stop();
//         AlertInfo.show(
//           context: Get.context!,
//           text: 'Somehting went wrong',
//           typeInfo: TypeInfo.error,
//         );
//         var responseData = jsonDecode(response.body);
//         var message = responseData['message'];
//         errorMessage.value = message;
//         Get.snackbar(
//           'Error',
//           message,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       } else {
//         OverlayLoadingProgress.stop();
//         AlertInfo.show(
//           context: Get.context!,
//           text: 'Somehting went wrong',
//           typeInfo: TypeInfo.error,
//         );
//         Get.snackbar(
//           'Error',
//           'Login failed. Please try again.',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } on SocketException {
//       OverlayLoadingProgress.stop();
//       // AlertInfo.show(
//       //   context: Get.context!,
//       //   text: 'No internet connection',
//       //   typeInfo: TypeInfo.error,
//       // );
//       Get.snackbar(
//         'Opps!!!',
//         'Check your internet connection and try again.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Color(0XFFFF8C42),
//         colorText: Colors.white,
//       );
//     } catch (e) {
//       OverlayLoadingProgress.stop();
//       // AlertInfo.show(
//       //   context: Get.context!,
//       //   text: e.toString(),
//       //   typeInfo: TypeInfo.error,
//       // );
//       // Get.snackbar(
//       //   'Error',
//       //   e.toString(),
//       //   snackPosition: SnackPosition.BOTTOM,
//       //   backgroundColor: Colors.red,
//       //   colorText: Colors.white,
//       // );
//       myLog.log(e.toString());
//       //OverlayLoadingProgress.stop();
//     } finally {
//       OverlayLoadingProgress.stop();
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/admin/presentation/home_screen/home_screen.dart';

//TODO: PARENT ROUTING
import 'package:schulupparent/parent/core/utils/storage.dart' as parent;
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/academics_assignment_status_screen.dart';
import 'package:schulupparent/parent/routes/app_routes.dart';

//TODO: STUDENT ROUTING
import 'package:schulupparent/student/core/utils/storage.dart' as student;
import 'package:schulupparent/student/data/apiClient/api_client.dart'
    as student;
import 'package:schulupparent/student/routes/app_routes.dart' as studentRoutes;

//TODO: ADMIN ROUTING
import 'package:schulupparent/admin/routes/app_routes.dart' as admin;
import 'package:schulupparent/admin/core/utils/storage.dart' as admin;

import 'dart:developer' as myLog;

import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/academics_assignment_status_screen.dart';

class SigninController extends GetxController {
  final ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController schoolCodeController = TextEditingController();

  Rx<String> errorMessage = ''.obs;

  Future<void> firstLogin() async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );

    try {
      final body = {
        "username": usernameController.text,
        "password": passwordController.text,
        "schoolCode": schoolCodeController.text,
      };

      myLog.log('Login request: $body');

      final response = await _apiService.firstLogin(body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = jsonDecode(response.body);

        myLog.log('Response data: $responseData');

        // Extract data
        var token = responseData['data']['token'] as String;
        var userId = responseData['data']['userID'] as int;
        // var studentID = responseData['data']['studentID'] as int;

        var userName = responseData['data']['displayName'] as String;
        var userType = responseData['data']['userType'] as int;

        // Save common data

        // Clear controllers
        usernameController.clear();
        passwordController.clear();
        schoolCodeController.clear();

        // Route based on user type
        if (userType == 4) {
          var token = responseData['data']['token'] as String;
          var userId = responseData['data']['userID'] as int;

          var userName = responseData['data']['displayName'] as String;
          // var userType = responseData['data']['userType'] as int;
          // Parent/Guardian
          var guardianID = responseData['data']['guardianID'] as int;
          await parent.dataBase.saveGuardianID(guardianID);
          await parent.dataBase.saveToken(token);
          await parent.dataBase.saveUserId(userId);
          await parent.dataBase.saveUserName(userName);
          // await parent.dataBase.saveTransactionPin(passwordController.text);
          // await parent.dataBase.saveBrmCode(schoolCodeController.text);
          myLog.log(guardianID.toString());
          myLog.log(token);
          myLog.log(userId.toString());
          myLog.log(userName);
          myLog.log(passwordController.text);
          myLog.log(schoolCodeController.text);

          myLog.log('Routing to Parent dashboard');
          //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen);
          Get.offAll(() => AcademicsAssignmentStatusScreen());
        } else if (userType == 3) {
          // Student
          myLog.log('Routing to Student dashboard');
          var studentID = responseData['data']['studentID'] as int;
          await student.studentDataBase.saveToken(token);
          myLog.log('save token');
          await student.studentDataBase.saveUserId(userId);
          await student.studentDataBase.saveStudent(studentID);
          myLog.log('save user id');
          await student.studentDataBase.saveUserName(userName);
          myLog.log('save user name $userName');
          await student.studentDataBase.saveTransactionPin(
            passwordController.text,
          );
          await student.studentDataBase.saveBrmCode(schoolCodeController.text);

          myLog.log(
            studentRoutes.AppRoutes.studentAcademicsAssignmentStatusScreen,
          );
          // Get.offAllNamed(
          //   studentRoutes.AppRoutes.studentAcademicsAssignmentStatusScreen,
          // );
          Get.offAll(() => StudentAcademicsAssignmentStatusScreen());
        } else {
          // Admin or other user type
          await admin.adminDataBase.saveToken(token);
          await admin.adminDataBase.saveUserId(userId);
          await admin.adminDataBase.saveUserName(userName);
          await admin.adminDataBase.saveTransactionPin(passwordController.text);
          await admin.adminDataBase.saveBrmCode(schoolCodeController.text);
          myLog.log('Routing to Admin dashboard');
          //Get.offAllNamed(admin.AppRoutes.homeScreen);
          Get.offAll(() => HomeScreen());
        }

        OverlayLoadingProgress.stop();

        Get.snackbar(
          'Success',
          'Welcome back, $userName!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0XFFFF8C42),
          colorText: Colors.white,
        );
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        OverlayLoadingProgress.stop();

        var responseData = jsonDecode(response.body);
        var message = responseData['message'] ?? 'Invalid credentials';
        errorMessage.value = message;

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
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      OverlayLoadingProgress.stop();

      Get.snackbar(
        'No Internet',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      OverlayLoadingProgress.stop();

      myLog.log('Login error: ${e.toString()}');

      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // @override
  // void onClose() {
  //   passwordController.dispose();
  //   usernameController.dispose();
  //   schoolCodeController.dispose();
  //   super.onClose();
  // }
}
