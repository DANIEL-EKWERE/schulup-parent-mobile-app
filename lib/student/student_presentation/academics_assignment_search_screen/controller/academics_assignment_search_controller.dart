// TODO Implement this library.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schulupparent/student/core/utils/storage.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/data/model/selectionPopupModel/selection_popup_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/assignment_details.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/assignment_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/cbt_detail_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/cbt_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/lesson_model.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_search_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the AcademicsAssignmentSearchScreen.
///
/// This class manages the state of the AcademicsAssignmentSearchScreen, including the
/// current academicsAssignmentSearchModelObj
class StudentAcademicsAssignmentSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsAssignmentSearchModel> academicsAssignmentSearchModelObj =
      AcademicsAssignmentSearchModel().obs;
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));
  StudentDashboardExtendedViewController dashboardExtendedViewController =
      Get.find<StudentDashboardExtendedViewController>();

  StudentAcademicsAssignmentStatusController controllerx =
      Get.find<StudentAcademicsAssignmentStatusController>();

  SelectionPopupModel? selectedDropDownValue;
  String? searchQuery;

  // Debounce timer for search
  Timer? _searchDebounce;
  // @override
  // void onClose() {
  //   super.onClose();
  //   searchController.dispose();
  // }
  @override
  onInit() {
    super.onInit();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    // Cancel previous timer
    _searchDebounce?.cancel();

    // Wait 500ms after user stops typing
    _searchDebounce = Timer(Duration(milliseconds: 500), () {
      String query = searchController.text.trim();

      if (query.isEmpty) {
        searchQuery = null;
      } else {
        searchQuery = query;
      }

      print('🔍 Search query: $searchQuery');
      if (controllerx.tabIndex == 0) {
        searchAssignment();
      } else if (controllerx.tabIndex == 1) {
        searchCbt();
      } else {
        searchLessons();
      }
      // fetchAttendanceLogs(isRefresh: true);
    });
  }

  // // Manual search trigger (for search button if needed)
  void onSearchSubmit() {
    _searchDebounce?.cancel();
    String query = searchController.text.trim();
    searchQuery = query.isEmpty ? null : query;
    print('🔍 Manual search: $searchQuery');
    if (controllerx.tabIndex == 0) {
      searchAssignment();
    } else if (controllerx.tabIndex == 1) {
      searchCbt();
    } else {
      searchLessons();
    }
  }

  // Clear search
  void clearSearch() {
    searchController.clear();
    searchQuery = null;
    if (controllerx.tabIndex == 0) {
      searchAssignment();
    } else if (controllerx.tabIndex == 1) {
      searchCbt();
    } else {
      searchLessons();
    }
  }

  onSelected(dynamic value) {
    for (var element
        in academicsAssignmentSearchModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsAssignmentSearchModelObj.value.dropdownItemList.refresh();
  }

  StudentDashboardExtendedViewController controller =
      Get.find<StudentDashboardExtendedViewController>();
  Lesson lesson = Lesson();

  List<StudentLessonData> lessonList = [];

  Assignment? assignment;
  List<AssignmentData> assignmentData = <AssignmentData>[].obs;

  Cbt? cbt;
  List<CbtData> cbtData = <CbtData>[].obs;

  AssignmentDetails? assignmentDetails;

  CbtDetail? cbtDetail;

  Rx<bool> isLoading = false.obs;

  Rx<bool> isDetailLoading = false.obs;

  void getUserId() async {
    var userId = await studentDataBase.getUserId();
    myLog.log('User ID: $userId');
  }

  Future<void> searchLessons() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),
    var termId;
    // );
    try {
      if (controllerx.termType.value == 'First') {
        termId = '1';
      } else if (controllerx.termType.value == 'Second') {
        termId = '2';
      } else if (controllerx.termType.value == 'Third') {
        termId = '3';
      }
      final response = await _apiService.searchLessons(
        controller.selectedClassID.toString(),
        termId,
        searchQuery!,
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

  Future<void> searchCbt() async {
    isLoading.value = true;
    // OverlayLoadingProgress.start(
    //   context: Get.context!,
    //   circularProgressColor: Color(0XFFFF8C42),

    // );a
    try {
      var classId = dashboardExtendedViewController.selectedClassID;
      final response = await _apiService.serachCbt(
        controller.selectedClassID.toString(),
        controller.selectedStudent1!.studentID.toString(),
        searchQuery!,
      );
      myLog.log(
        "classId: ${classId}, studentId: ${controller.selectedStudent1!.studentID}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        cbt = cbtFromJson(response.body);
        cbtData = cbt!.data!;

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
      final response = await _apiService.cbt(
        controller.selectedClassID.toString(),
        classId.toString(),
      );
      myLog.log(
        "classId: ${classId}, studentId: ${controller.selectedClassID}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        cbt = cbtFromJson(response.body);
        cbtData = cbt!.data!;

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
          AppRoutes.studentAcademicsCbtTestTestDetailsScreen,
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

  Future<void> searchAssignment() async {
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
        'parameters: student id: $studentID, $classID, ${controllerx.termType.value}, $controllerx.selectedStatus',
      );
      final response = await _apiService.searchStudentAssignment(
        studentID.toString(),
        classID.toString(),
        controllerx.termTypeId.value,
        controllerx.selectedStatus.value,
        searchQuery!,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        assignment = assignmentFromJson(response.body);
        assignmentData = assignment!.data!;
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
          AppRoutes.studentAcademicsAssignmentAnswerScreen,
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
