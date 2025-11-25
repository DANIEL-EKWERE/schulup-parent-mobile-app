import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/data/apiClient/api_client.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/academics_assignment_status_initial_model.dart';
import 'package:schulupparent/presentation/dashboard_edit_ward_profile/dashboard_edit_ward_profile.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

class DashboardEditWardProfileController extends GetxController {
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();

  @override
  void onReady() {
    super.onReady();
    // Get the student from arguments
    var selectedStudent = Get.arguments;
    if (selectedStudent != null) {
      _updateControllers(selectedStudent);
    }
  }

  void _updateControllers(Student selectedStudent) {
    //var selectedStudent = dashboardExtendedViewController.selectedStudent1;
    if (selectedStudent != null) {
      lastNameController.text = selectedStudent.lastName ?? '';
      firstNameController.text = selectedStudent.firstName ?? '';
      middleNameController.text = selectedStudent.middleName ?? '';
      genderController.text = selectedStudent.gender ?? '';
      dateOfBirthController.text = selectedStudent.dateOfBirth ?? '';
      bloodGroupController.text = selectedStudent.bloodGroup ?? '';
      genotypeController.text = selectedStudent.genotype ?? '';
      stateController.text = selectedStudent.state ?? '';
      cityController.text = selectedStudent.city ?? '';
      addressController.text = selectedStudent.address ?? '';
      religionController.text = selectedStudent.religion ?? '';
      languageController.text = selectedStudent.language ?? '';
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   lastNameController.clear();
  //   firstNameController.clear();
  //   middleNameController.clear();
  //   genderController.clear();
  //   dateOfBirthController.clear();
  //   bloodGroupController.clear();
  //   genotypeController.clear();
  //   stateController.clear();
  //   cityController.clear();
  //   addressController.clear();
  //   phoneController.clear();
  //   religionController.clear();
  //   languageController.clear();
  //   placeOfBirthNameController.clear();
  // }

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

  Future<void> updateStudentInfo() async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      final body = {
        "studentID":
            dashboardExtendedViewController.selectedStudent1?.studentID ?? 123,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "middleName": middleNameController.text,
        "gender": genderController.text,
        "dateOfBirth": dateOfBirthController.text,
        "bloodGroup": bloodGroupController.text,
        "genotype": genotypeController.text,
        "countryID": 1,
        "state": stateController.text,
        "city": cityController.text,
        "addressLine1": addressController.text,
        "phone1": phoneController.text,
        "religion": religionController.text,
        "language": languageController.text,
      };
      print(body);
      final response = await _apiService.updateStudentInfo(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        Get.snackbar(
          'Success',
          'Student information updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.back(); // Go back after successful update
      } else if (response.statusCode == 404 || response.statusCode == 401) {
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
          'Update failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      OverlayLoadingProgress.stop();
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      OverlayLoadingProgress.stop();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
