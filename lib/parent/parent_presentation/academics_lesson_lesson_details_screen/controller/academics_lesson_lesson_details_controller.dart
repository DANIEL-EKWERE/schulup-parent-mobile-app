// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_lesson_details_model.dart';

/// A controller class for the AcademicsLessonLessonDetailsScreen.
///
/// This class manages the state of the AcademicsLessonLessonDetailsScreen, including the
/// current academicsLessonLessonDetailsModelObj
class AcademicsLessonLessonDetailsController extends GetxController {
  Rx<AcademicsLessonLessonDetailsModel> academicsLessonLessonDetailsModelObj =
      AcademicsLessonLessonDetailsModel().obs;
}
