// TODO Implement this library.
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/news_all_variants_page/models/news_model.dart';
import '../../../core/app_export.dart';
import '../models/news_all_variants_model.dart';

/// A controller class for the NewsAllVariantsPage.
///
/// This class manages the state of the NewsAllVariantsPage, including the
/// current newsAllVariantsModelObj
class NewsAllVariantsController extends GetxController {
  NewsAllVariantsController(this.newsAllVariantsModelObj);

  Rx<NewsAllVariantsModel> newsAllVariantsModelObj;
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  NewsResponse? newsResponse;
  List<NewsItem>? newsItems;
  Rx<bool> isLoading = false.obs;
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
        newsItems = newsResponse!.data.news;
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
      //OverlayLoadingProgress.stop();
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  Future<void> getNewsDetails(String newsId) async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      final response = await _apiService.getNewsDetails(newsId);
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
        //Get.offAllNamed(AppRoutes.signinScreen,);
        myLog.log(response.body);
        OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        OverlayLoadingProgress.stop();
        var responseData = jsonDecode(response.body);
        var message = responseData['message'];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
      } else {
        OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'Fetching news failed. Please try again.',
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
      //OverlayLoadingProgress.stop();
    } finally {
      OverlayLoadingProgress.stop();
    }
  }

  String formatDate1(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
