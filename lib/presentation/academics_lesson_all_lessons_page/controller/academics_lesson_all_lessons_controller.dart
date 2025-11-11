// TODO Implement this library.
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_lesson_all_lessons_model.dart';

/// A controller class for the AcademicsLessonAllLessonsPage.
///
/// This class manages the state of the AcademicsLessonAllLessonsPage, including the
/// current academicsLessonAllLessonsModelObj
class AcademicsLessonAllLessonsController extends GetxController {
  AcademicsLessonAllLessonsController(this.academicsLessonAllLessonsModelObj);

  Rx<AcademicsLessonAllLessonsModel> academicsLessonAllLessonsModelObj;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element
        in academicsLessonAllLessonsModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsLessonAllLessonsModelObj.value.dropdownItemList.refresh();
  }
}
