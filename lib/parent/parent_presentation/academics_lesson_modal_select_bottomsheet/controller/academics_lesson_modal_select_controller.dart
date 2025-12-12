// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_modal_select_model.dart';

/// A controller class for the AcademicsLessonModalSelectBottomsheet.
///
/// This class manages the state of the AcademicsLessonModalSelectBottomsheet, including the
/// current academicsLessonModalSelectModelObj
class AcademicsLessonModalSelectController extends GetxController {
  Rx<AcademicsLessonModalSelectModel> academicsLessonModalSelectModelObj =
      AcademicsLessonModalSelectModel().obs;
}
