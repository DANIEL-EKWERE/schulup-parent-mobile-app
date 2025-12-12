// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_ongoing_two_controller.dart';

/// A binding class for the AcademicsCbtTestOngoingTwoScreen.
///
/// This class ensures that the AcademicsCbtTestOngoingTwoController is created when the
/// AcademicsCbtTestOngoingTwoScreen is first loaded.
class AcademicsCbtTestOngoingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestOngoingTwoController());
  }
}
