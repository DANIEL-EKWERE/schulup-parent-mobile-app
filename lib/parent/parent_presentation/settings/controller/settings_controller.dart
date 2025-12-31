import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/core/utils/storage.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

import '../../../core/app_export.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

class SettingsController extends GetxController {
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Future<void> logOut() async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      final response = await _apiService.logOut();
      if (response.statusCode == 200 || response.statusCode == 201) {
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        var responseData = jsonDecode(response.body);
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
        // var controller = Get.find<DashboardExtendedViewController>(tag: 'parentDashboardExtendedViewController');
        // Get.delete<DashboardExtendedViewController>(tag: 'parentDashboardExtendedViewController');
        dataBase.logOut();
        dataBase.clearCache();
        Get.offAllNamed(AppRoutes.signinScreen);
        OverlayLoadingProgress.stop();

        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
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
        Fluttertoast.showToast(
          webShowClose: true,
          msg: 'Log Out failed. Please try again.',
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
