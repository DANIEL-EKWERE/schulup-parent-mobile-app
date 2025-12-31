import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/core/utils/storage.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/routes/app_routes.dart';
import 'dart:developer' as myLog;

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Future<void> changePassword() async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      final body = {
        "CurrentPassword": currentPasswordController.text,
        "NewPassword": newPasswordController.text,
        "ConfirmPassword": confirmPasswordController.text,
      };

      print(body);
      final response = await _apiService.resetPassword(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Get.snackbar(
        //   'Success',
        //   'Password changed Successfully',
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );
        Fluttertoast.showToast(
            webShowClose: true,
            msg: 'Password changed Successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        print(response.body);
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
        Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen);
        OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        Fluttertoast.showToast(
            webShowClose: true,
            msg: 'Password change Field. Try again.',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        // Get.snackbar(
        //   'Error!!!',
        //   'Password change Field. Try again.',
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );
        OverlayLoadingProgress.stop();
        var responseData = jsonDecode(response.body);
        var message = responseData['message'];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Fluttertoast.showToast(
            webShowClose: true,
            msg: message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });
      } else {
        OverlayLoadingProgress.stop();
        // Get.snackbar(
        //   'Error',
        //   'Password change failed. Please try again.',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        // );
        Fluttertoast.showToast(
        webShowClose: true,
        msg: 'Password change failed. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      }
    } on SocketException {
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
      OverlayLoadingProgress.stop();
    }
  }
}
