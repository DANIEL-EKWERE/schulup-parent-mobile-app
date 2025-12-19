// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/reports_ward_progress_academic_controller.dart';

/// A binding class for the ReportsWardProgressAcademicScreen.
///
/// This class ensures that the ReportsWardProgressAcademicController is created when the
/// ReportsWardProgressAcademicScreen is first loaded.
class StudentReportsWardProgressAcademicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StudentReportsWardProgressAcademicController(),
      fenix: true,
    );
  }
}
