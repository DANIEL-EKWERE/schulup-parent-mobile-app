// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_search_controller.dart';

/// A binding class for the AcademicsAssignmentSearchScreen.
///
/// This class ensures that the AcademicsAssignmentSearchController is created when the
/// AcademicsAssignmentSearchScreen is first loaded.
class StudentAcademicsAssignmentSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentAcademicsAssignmentSearchController());
  }
}
