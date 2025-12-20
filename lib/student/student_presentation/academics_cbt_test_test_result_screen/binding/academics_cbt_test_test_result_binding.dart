// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_test_result_controller.dart';

/// A binding class for the AcademicsCbtTestTestResultScreen.
///
/// This class ensures that the AcademicsCbtTestTestResultController is created when the
/// AcademicsCbtTestTestResultScreen is first loaded.
class StudentAcademicsCbtTestTestResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentAcademicsCbtTestTestResultController());
  }
}
