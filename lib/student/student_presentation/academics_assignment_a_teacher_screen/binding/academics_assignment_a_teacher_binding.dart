// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_a_teacher_controller.dart';

/// A binding class for the AcademicsAssignmentATeacherScreen.
///
/// This class ensures that the AcademicsAssignmentATeacherController is created when the
/// AcademicsAssignmentATeacherScreen is first loaded.
class AcademicsAssignmentATeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentATeacherController());
  }
}
