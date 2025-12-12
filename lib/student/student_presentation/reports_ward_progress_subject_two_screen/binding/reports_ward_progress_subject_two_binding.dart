// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/reports_ward_progress_subject_two_controller.dart';

/// A binding class for the ReportsWardProgressSubjectTwoScreen.
///
/// This class ensures that the ReportsWardProgressSubjectTwoController is created when the
/// ReportsWardProgressSubjectTwoScreen is first loaded.
class ReportsWardProgressSubjectTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsWardProgressSubjectTwoController());
  }
}
