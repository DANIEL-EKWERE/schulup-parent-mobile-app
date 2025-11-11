import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_test_details_controller.dart';

/// A binding class for the AcademicsCbtTestTestDetailsScreen.
///
/// This class ensures that the AcademicsCbtTestTestDetailsController is created when the
/// AcademicsCbtTestTestDetailsScreen is first loaded.
class AcademicsCbtTestTestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestTestDetailsController());
  }
}
