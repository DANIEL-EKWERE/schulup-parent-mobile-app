// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_assignment_controller.dart';

/// A binding class for the AcademicsAssignmentAssignmentScreen.
///
/// This class ensures that the AcademicsAssignmentAssignmentController is created when the
/// AcademicsAssignmentAssignmentScreen is first loaded.
class AcademicsAssignmentAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentAssignmentController());
  }
}
