// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_test_result_one_controller.dart';

/// A binding class for the AcademicsCbtTestTestResultOneScreen.
///
/// This class ensures that the AcademicsCbtTestTestResultOneController is created when the
/// AcademicsCbtTestTestResultOneScreen is first loaded.
class AcademicsCbtTestTestResultOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestTestResultOneController());
  }
}
