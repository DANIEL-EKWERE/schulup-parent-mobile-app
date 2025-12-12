// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_search_two_controller.dart';

/// A binding class for the AcademicsAssignmentSearchTwoScreen.
///
/// This class ensures that the AcademicsAssignmentSearchTwoController is created when the
/// AcademicsAssignmentSearchTwoScreen is first loaded.
class AcademicsAssignmentSearchTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentSearchTwoController());
  }
}
