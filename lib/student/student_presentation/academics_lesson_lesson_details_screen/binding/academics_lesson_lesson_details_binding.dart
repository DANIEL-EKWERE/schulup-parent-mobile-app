// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_lesson_lesson_details_controller.dart';

/// A binding class for the AcademicsLessonLessonDetailsScreen.
///
/// This class ensures that the AcademicsLessonLessonDetailsController is created when the
/// AcademicsLessonLessonDetailsScreen is first loaded.
class StudentAcademicsLessonLessonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentAcademicsLessonLessonDetailsController());
  }
}
