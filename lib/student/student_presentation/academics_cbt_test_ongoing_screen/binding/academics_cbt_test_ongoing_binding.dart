// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_ongoing_controller.dart';

/// A binding class for the AcademicsCbtTestOngoingScreen.
///
/// This class ensures that the AcademicsCbtTestOngoingController is created when the
/// AcademicsCbtTestOngoingScreen is first loaded.
class AcademicsCbtTestOngoingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestOngoingController());
  }
}
