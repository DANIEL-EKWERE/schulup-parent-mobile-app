// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_lesson_search_for_one_controller.dart';

/// A binding class for the AcademicsLessonSearchForOneScreen.
///
/// This class ensures that the AcademicsLessonSearchForOneController is created when the
/// AcademicsLessonSearchForOneScreen is first loaded.
class AcademicsLessonSearchForOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsLessonSearchForOneController());
  }
}
