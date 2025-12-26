// TODO Implement this library.
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as myLog;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/parent/core/utils/storage.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/data/model/selectionPopupModel/selection_popup_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/assignment_details.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/assignment_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/cbt_detail_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/cbt_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/lesson_model.dart';
// import 'package:schulupparent/presentation/dashboard_extended_view/models/student_batch_model.dart';
// import 'package:schulupparent/presentation/dashboard_extended_view/models/student_class_model.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
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
  Rx<bool> isLoading = false.obs;

  Rx<bool> isDetailLoading = false.obs;

  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();

  @override
  void onInit() {
    super.onInit();
    byGuardian();
    termType.value =
        dashboardExtendedViewController.selectedTerm1.value!.termID == 1
            ? 'First'
            : dashboardExtendedViewController.selectedTerm1.value!.termID == 2
            ? 'Second'
            : 'Third';
    termTypeId.value =
        dashboardExtendedViewController.selectedTerm1.value!.termID == 1
            ? '1'
            : dashboardExtendedViewController.selectedTerm1.value!.termID == 2
            ? '2'
            : '3';
    // getAssignment();
    // classType.value =
    //     dashboardExtendedViewController.selectedClass!.value.isEmpty
    //         ? 'Loading...'
    //         : dashboardExtendedViewController.selectedClass!.value;
    //   dashboardExtendedViewController.studentClassObj.data!.first.name!;
  }

  DashboardExtendedViewController controller =
      Get.find<DashboardExtendedViewController>();
  Lesson lesson = Lesson();

  List<LessonData> lessonList = [];

  Assignment? assignment;
  List<AssignmentData>? assignmentData;

  Cbt? cbt;
  List<CbtData>? cbtData;

  AssignmentDetails? assignmentDetails;

  CbtDetail? cbtDetail;

  void getUserId() async {
    var userId = await dataBase.getUserId();
    myLog.log('User ID: $userId');
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

  Rx<String> classType = 'N/A'.obs;

  Rx<String> termType = 'First'.obs;

  Rx<String> termTypeId = '1'.obs;

  Rx<String> statusType = 'all'.obs;

  // cbt
  Rx<String> classType1 = 'primary 50'.obs;

  Rx<String> cbtType = 'Scheduled Test'.obs;

  // lesson
  Rx<String> classType2 = 'primary 50'.obs;

  Rx<String> termType1 = 'First Term 0'.obs;

  Rx<String> selectedStatus = 'all'.obs;

  //search
  Rx<String> searchStatus = 'all'.obs;

  Future<void> byGuardian() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    // );
    try {
      var userId = await dataBase.getUserId();
      myLog.log('User ID: $userId');
      final response = await _apiService.byGuardian(userId.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        // schoolCodeInputController.dispose();
        // usernameInputController.dispose();
        // passwordInputController.dispose();
        var responseData = jsonDecode(response.body);

        myLog.log('Token: $responseData');
        Timer(Duration(seconds: 1), () {
          getAssignment();
          getCbt();
          allLessons();
        });
        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        // OverlayLoadingProgress.stop();
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            'Login failed. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
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

  Future<void> allLessons() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    var termId;
    // );
    try {
      if (termType.value == 'First') {
        termId = '1';
      } else if (termType.value == 'Second') {
        termId = '2';
      } else if (termType.value == 'Third') {
        termId = '3';
      }
      final response = await _apiService.allLessons(
        controller.selectedClassID.toString(),
        termId,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        lessonList = lessonFromJson(response.body).data!;
        myLog.log('Lessons Length: ${lessonList.length}');

        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        // OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        // OverlayLoadingProgress.stop();
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
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            'Login failed. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
      }
    } on SocketException {
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
      isLoading.value = false;
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
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  Future<void> getCbt() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),

    // );a
    try {
      var classId = dashboardExtendedViewController.selectedClassID;
      final response = await _apiService.cbt(
        controller.selectedClassID.toString(),
        controller.selectedStudent1!.studentID.toString(),
      );
      myLog.log(
        "classId: ${classId}, studentId: ${controller.selectedStudent1!.studentID}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        cbt = cbtFromJson(response.body);
        cbtData = cbt!.data;

        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        // OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        // OverlayLoadingProgress.stop();
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
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'cbt fetch failed. Please try again.',
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
      isLoading.value = false;
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
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  //cbtDetails()
  Future<void> getCbtResult() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),

    // );a
    try {
      var classId = dashboardExtendedViewController.selectedClassID;
      var studentId =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      final response = await _apiService.cbtResults(
        controller.selectedClassID.toString(),
        studentId.toString(),
      );
      myLog.log(
        "classId: ${classId}, studentId: ${controller.selectedClassID}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        cbt = cbtFromJson(response.body);
        cbtData = cbt!.data;

        //Get.offAllNamed(AppRoutes.academicsAssignmentStatusScreen,);
        // OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        // OverlayLoadingProgress.stop();
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
        isLoading.value = false;
        // OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'cbt fetch failed. Please try again.',
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
      isLoading.value = false;
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
      myLog.log(e.toString());
      isLoading.value = false;
      //OverlayLoadingProgress.stop();
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  Future<void> getCbtDetails(String quizScheduledId) async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    try {
      var studentId =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      final response = await _apiService.cbtDetaails(
        studentId.toString(),
        quizScheduledId,
      );
      myLog.log("classId: ${studentId}, studentId: ${quizScheduledId}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        OverlayLoadingProgress.stop();
        cbtDetail = cbtDetailFromJson(response.body);

        Get.toNamed(
          AppRoutes.academicsCbtTestTestDetailsScreen,
          arguments: {'model': cbtDetail},
        );
      } else if (response.statusCode == 404 || response.statusCode == 401) {
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
          'cbt fetch failed. Please try again.',
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } finally {
      OverlayLoadingProgress.stop();
    }
  }

  Future<void> getAssignment() async {
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    isLoading.value = true;
    // );
    try {
      var studentID =
          dashboardExtendedViewController.selectedStudent1!.studentID;
      var classID = dashboardExtendedViewController.selectedClassID;
      myLog.log(
        'parameters: student id: $studentID, $classID, ${termType.value}, $selectedStatus',
      );
      final response = await _apiService.getStudentAssignment(
        studentID.toString(),
        classID.toString(),
        termTypeId.value,
        selectedStatus.value,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        assignment = assignmentFromJson(response.body);
        assignmentData = assignment!.data;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
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
        isLoading.value = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            'Login failed. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
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
      isLoading.value = false;
    }
  }

  Future<void> getAssignmentDetail(String id) async {
    OverlayLoadingProgress.start(
      context: Get.context!,
      circularProgressColor: Color(0XFFFF8C42),
    );
    isDetailLoading.value = true;
    try {
      final response = await _apiService.getStudentAssignmentById(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Assignemt Retrived',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        OverlayLoadingProgress.stop();
        isDetailLoading.value = false;
        assignmentDetails = assignmentDetailsFromJson(response.body);
        Get.toNamed(
          AppRoutes.academicsAssignmentAnswerScreen,
          arguments: {'model': assignmentDetails},
        );
        myLog.log(assignmentDetails!.data!.subjectName!);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isDetailLoading.value = false;
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
        isDetailLoading.value = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            'Login failed. Please try again.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        });
      }
    } on SocketException {
      OverlayLoadingProgress.stop();
      isDetailLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      myLog.log(e.toString());
      OverlayLoadingProgress.stop();
      isDetailLoading.value = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
      OverlayLoadingProgress.stop();
    } finally {
      isDetailLoading.value = false;
      OverlayLoadingProgress.stop();
    }
  }
}
