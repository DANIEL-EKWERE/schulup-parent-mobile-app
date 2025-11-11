// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_lesson_search_for_controller.dart';

/// A binding class for the AcademicsLessonSearchForScreen.
///
/// This class ensures that the AcademicsLessonSearchForController is created when the
/// AcademicsLessonSearchForScreen is first loaded.
class AcademicsLessonSearchForBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsLessonSearchForController());
  }
}
