import 'dart:convert';
import 'dart:io';

import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/core/utils/storage.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/routes/app_routes.dart';
import 'dart:developer' as myLog;

class SigninController extends GetxController {
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController schoolCodeController = TextEditingController();
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
      print(body);
      final response = await _apiService.firstLogin(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //AlertInfo.show(context: Get.context!, text: 'Login Successful');
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        var responseData = jsonDecode(response.body);
        var token = responseData['data']['token'];
        var userId = responseData['data']['userID'];
        var userName = responseData['data']['displayName'];
        myLog.log('Token: $token');
        dataBase.saveToken(token);
        dataBase.saveUserId(userId);
        dataBase.saveUserName(userName);
        dataBase.saveTransactionPin(passwordController.text);
        dataBase.saveBrmCode(schoolCodeController.text);
        usernameController.clear();
        passwordController.clear();
        schoolCodeController.clear();
        Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen);
        OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
        myLog.log(name: 'User ID', userId);
        AlertInfo.show(context: Get.context!, text: 'Login Successful');
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        
        OverlayLoadingProgress.stop();
        AlertInfo.show(
          context: Get.context!,
          text: 'Somehting went wrong',
          typeInfo: TypeInfo.error,
        );
        var responseData = jsonDecode(response.body);
        var message = responseData['message'];
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
        AlertInfo.show(
          context: Get.context!,
          text: 'Somehting went wrong',
          typeInfo: TypeInfo.error,
        );
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
      AlertInfo.show(
        context: Get.context!,
        text: 'No internet connection',
        typeInfo: TypeInfo.error,
      );
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      OverlayLoadingProgress.stop();
      // AlertInfo.show(
      //   context: Get.context!,
      //   text: e.toString(),
      //   typeInfo: TypeInfo.error,
      // );
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
