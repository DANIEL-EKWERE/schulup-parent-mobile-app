import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';

class DashboardEditWardProfileController extends GetxController {
  ///
  ///{
  // "studentID": 123,
  // "firstName": "John",
  // "lastName": "Doe",
  // "middleName": "Michael",
  // "gender": 1,
  // "dateOfBirth": "2010-05-15",
  // "bloodGroup": "O+",
  // "genotype": "AA",
  // "countryID": 1,
  // "state": "Lagos",
  // "city": "Ikeja",
  // "addressLine1": "123 Main Street",
  // "phone1": "+234 800 000 0000",
  // "religion": "Christianity",
  // "language": "English"
  //}

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();

  TextEditingController genderController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

  TextEditingController genotypeController = TextEditingController();
  TextEditingController placeOfBirthNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController languageController = TextEditingController();

  Future<void> firstLogin() async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      final body = {
        "studentID": 123,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "middleName": middleNameController.text,
        "gender":  genderController.text,  //1,
        "dateOfBirth": dateOfBirthController.text,
        "bloodGroup": bloodGroupController.text,//"O+",
        "genotype": genotypeController.text,//"AA",
        "countryID": 1,
        "state": stateController.text,
        "city": cityController.text,
        "addressLine1": addressController.text,//"123 Main Street",
        "phone1": phoneController.text,//"+234 800 000 0000",
        "religion": religionController.text,
        "language": languageController.text,
      };
      print(body);
      final response = await _apiService.updateStudentInfo(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        // var responseData = jsonDecode(response.body);
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
        // Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
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
          'Login failed. Please try again.',
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
