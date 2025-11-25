// TODO Implement this library.
import 'dart:convert';
import 'dart:developer' as myLog;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_status_initial_model.dart';
import '../models/academics_assignment_status_model.dart';
import '../models/academics_four_model.dart';

/// A controller class for the AcademicsAssignmentStatusScreen.
///
/// This class manages the state of the AcademicsAssignmentStatusScreen, including the
/// current academicsAssignmentStatusModelObj
class AcademicsAssignmentStatusController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<AcademicsAssignmentStatusModel> academicsAssignmentStatusModelObj =
      AcademicsAssignmentStatusModel().obs;
ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));
  late TabController tabviewController = Get.put(
    TabController(vsync: this, length: 3),
  );

  @override
  void onInit() {
    super.onInit();
    byGuardian(); 
  }

  Rx<AcademicsFourModel> academicsFourModelObj = AcademicsFourModel().obs;

  Rx<AcademicsAssignmentStatusInitialModel>
  academicsAssignmentStatusInitialModelObj =
      AcademicsAssignmentStatusInitialModel().obs;

  Rx<int> tabIndex = 0.obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  onSelected(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList2.refresh();
  }

  Rx<String> classType = 'primary 5'.obs;

  Rx<String> termType = 'First Term'.obs;

  Rx<String> statusType = 'Pending'.obs;

// cbt
  Rx<String> classType1 = 'primary 50'.obs;

  Rx<String> cbtType = 'Scheduled Test 0'.obs;

// lesson
  Rx<String> classType2 = 'primary 50'.obs;

  Rx<String> termType1 = 'First Term 0'.obs;

  //search
  Rx<String> searchStatus = 'All'.obs;


  Future<void> byGuardian() async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      
      
      final response = await _apiService.byGuardian();
      if (response.statusCode == 200 || response.statusCode == 201) {
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        var responseData = jsonDecode(response.body);
        
        myLog.log('Token: $responseData');
        
        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
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
