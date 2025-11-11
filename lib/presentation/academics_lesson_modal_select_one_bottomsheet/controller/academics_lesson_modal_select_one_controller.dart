// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_modal_select_one_model.dart';

/// A controller class for the AcademicsLessonModalSelectOneBottomsheet.
///
/// This class manages the state of the AcademicsLessonModalSelectOneBottomsheet, including the
/// current academicsLessonModalSelectOneModelObj
class AcademicsLessonModalSelectOneController extends GetxController {
  Rx<AcademicsLessonModalSelectOneModel> academicsLessonModalSelectOneModelObj =
      AcademicsLessonModalSelectOneModel().obs;
}
