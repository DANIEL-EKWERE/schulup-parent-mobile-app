// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_the_child_controller.dart';

/// A binding class for the AcademicsAssignmentTheChildScreen.
///
/// This class ensures that the AcademicsAssignmentTheChildController is created when the
/// AcademicsAssignmentTheChildScreen is first loaded.
class AcademicsAssignmentTheChildBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentTheChildController());
  }
}
