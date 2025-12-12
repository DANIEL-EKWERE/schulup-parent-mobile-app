// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_not_submitted_controller.dart';

/// A binding class for the AcademicsAssignmentNotSubmittedScreen.
///
/// This class ensures that the AcademicsAssignmentNotSubmittedController is created when the
/// AcademicsAssignmentNotSubmittedScreen is first loaded.
class AcademicsAssignmentNotSubmittedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentNotSubmittedController());
  }
}
