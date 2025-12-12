// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_submitted_controller.dart';

/// A binding class for the AcademicsAssignmentSubmittedScreen.
///
/// This class ensures that the AcademicsAssignmentSubmittedController is created when the
/// AcademicsAssignmentSubmittedScreen is first loaded.
class AcademicsAssignmentSubmittedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentSubmittedController());
  }
}
