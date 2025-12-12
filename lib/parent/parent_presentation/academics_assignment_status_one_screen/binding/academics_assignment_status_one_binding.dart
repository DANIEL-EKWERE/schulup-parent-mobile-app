// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_status_one_controller.dart';

/// A binding class for the AcademicsAssignmentStatusOneScreen.
///
/// This class ensures that the AcademicsAssignmentStatusOneController is created when the
/// AcademicsAssignmentStatusOneScreen is first loaded.
class AcademicsAssignmentStatusOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentStatusOneController());
  }
}
