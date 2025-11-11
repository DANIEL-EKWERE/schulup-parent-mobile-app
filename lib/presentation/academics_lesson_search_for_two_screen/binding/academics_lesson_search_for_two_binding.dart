import '../../../core/app_export.dart';
import '../controller/academics_lesson_s
earch_for_two_controller.dart';

/// A binding class for the AcademicsLessonSearchForTwoScreen.
///
/// This class ensures that the AcademicsLessonSearchForTwoController is created when the
/// AcademicsLessonSearchForTwoScreen is first loaded.
class AcademicsLessonSearchForTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsLessonSearchForTwoController());
  }
}
