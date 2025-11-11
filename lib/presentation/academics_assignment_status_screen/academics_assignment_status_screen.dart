// TODO Implement this library.
import '../../../core/app_export.dart';
import 'controller/academics_assignment_status_controller.dart';

/// A binding class for the AcademicsAssignmentStatusScreen.
///
/// This class ensures that the AcademicsAssignmentStatusController is created when the
/// AcademicsAssignmentStatusScreen is first loaded.
class AcademicsAssignmentStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentStatusController());
  }
}
