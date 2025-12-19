import 'dart:convert';
import 'dart:io';
import 'dart:developer' as myLog;
import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/academics_assignment_status_initial_model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_edit_ward_profile/dashboard_edit_ward_profile.dart';
import 'package:schulupparent/student/student_presentation/dashboard_edit_ward_profile/model/model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

class StudentDashboardEditWardProfileController extends GetxController {
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  StudentDashboardExtendedViewController dashboardExtendedViewController =
      Get.find<StudentDashboardExtendedViewController>();

  Rx<String> selectedGender = 'Male'.obs;

  Rx<String> selectedBloodGroup = 'A'.obs;

  Rx<String> selectedGenotype = 'AA'.obs;

  Rx<bool> isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    // // Get the student from arguments
    // var selectedStudent = Get.arguments;
    // if (selectedStudent != null) {
    //   _updateControllers(selectedStudent);
    // }
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

  StudentProfile? studentProfile;

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
        "gender": 1, //selectedGender.value,
        "dateOfBirth": dateOfBirthController.text,
        "bloodGroup": selectedBloodGroup.value,
        "genotype": selectedGenotype.value,
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
        // AlertInfo.show(
        //   context: Get.context!,
        //   text: 'Profile updated successfully!!!',
        // );
        Get.snackbar(
          'Success',
          'Student information updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.back(); // Go back after successful update
        Navigator.pop(Get.context!);
        myLog.log("profile updated successfully");
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

  Future<void> getStudentInfo() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    isLoading.value = true;
    try {
      String studentId =
          dashboardExtendedViewController.selectedStudent1!.studentID
              .toString();
      final response = await _apiService.getStudentsById(studentId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        studentProfile = studentProfileFromJson(response.body);
        isLoading.value = false;

        lastNameController.text = studentProfile!.data!.lastName!;
        firstNameController.text = studentProfile!.data!.firstName!;
        middleNameController.text = studentProfile!.data!.middleName!;
        genderController.text = studentProfile!.data!.gender!;
        dateOfBirthController.text = studentProfile!.data!.dateOfBirth!;
        bloodGroupController.text = studentProfile!.data!.bloodGroup!;
        genotypeController.text = studentProfile!.data!.genotype!;
        stateController.text = studentProfile!.data!.state!;
        cityController.text = studentProfile!.data!.city!;
        addressController.text = studentProfile!.data!.address!;
        religionController.text = studentProfile!.data!.religion!;
        languageController.text = studentProfile!.data!.language!;
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
}
