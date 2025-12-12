// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_answer_controller.dart';

/// A binding class for the AcademicsAssignmentAnswerScreen.
///
/// This class ensures that the AcademicsAssignmentAnswerController is created when the
/// AcademicsAssignmentAnswerScreen is first loaded.
class AcademicsAssignmentAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentAnswerController());
  }
}
