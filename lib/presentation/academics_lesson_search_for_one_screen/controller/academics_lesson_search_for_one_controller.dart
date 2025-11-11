// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_search_for_one_model.dart';

/// A controller class for the AcademicsLessonSearchForOneScreen.
///
/// This class manages the state of the AcademicsLessonSearchForOneScreen, including the
/// current academicsLessonSearchForOneModelObj
class AcademicsLessonSearchForOneController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsLessonSearchForOneModel> academicsLessonSearchForOneModelObj =
      AcademicsLessonSearchForOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
