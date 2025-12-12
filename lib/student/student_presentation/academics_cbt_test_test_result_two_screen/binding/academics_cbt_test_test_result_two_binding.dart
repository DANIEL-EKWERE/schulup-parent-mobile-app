// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_test_result_two_controller.dart';

/// A binding class for the AcademicsCbtTestTestResultTwoScreen.
///
/// This class ensures that the AcademicsCbtTestTestResultTwoController is created when the
/// AcademicsCbtTestTestResultTwoScreen is first loaded.
class AcademicsCbtTestTestResultTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestTestResultTwoController());
  }
}
