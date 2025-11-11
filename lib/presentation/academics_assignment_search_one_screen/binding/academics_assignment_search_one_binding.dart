// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_assignment_search_one_controller.dart';

/// A binding class for the AcademicsAssignmentSearchOneScreen.
///
/// This class ensures that the AcademicsAssignmentSearchOneController is created when the
/// AcademicsAssignmentSearchOneScreen is first loaded.
class AcademicsAssignmentSearchOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentSearchOneController());
  }
}
