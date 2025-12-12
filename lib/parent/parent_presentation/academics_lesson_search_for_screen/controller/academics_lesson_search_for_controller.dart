// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_search_for_model.dart';

/// A controller class for the AcademicsLessonSearchForScreen.
///
/// This class manages the state of the AcademicsLessonSearchForScreen, including the
/// current academicsLessonSearchForModelObj
class AcademicsLessonSearchForController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsLessonSearchForModel> academicsLessonSearchForModelObj =
      AcademicsLessonSearchForModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
