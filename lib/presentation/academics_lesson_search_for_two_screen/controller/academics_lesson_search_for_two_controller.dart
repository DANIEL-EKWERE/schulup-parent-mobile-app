// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_search_for_two_model.dart';

/// A controller class for the AcademicsLessonSearchForTwoScreen.
///
/// This class manages the state of the AcademicsLessonSearchForTwoScreen, including the
/// current academicsLessonSearchForTwoModelObj
class AcademicsLessonSearchForTwoController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsLessonSearchForTwoModel> academicsLessonSearchForTwoModelObj =
      AcademicsLessonSearchForTwoModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
