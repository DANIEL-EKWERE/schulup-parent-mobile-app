// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_ongoing_one_controller.dart';

/// A binding class for the AcademicsCbtTestOngoingOneScreen.
///
/// This class ensures that the AcademicsCbtTestOngoingOneController is created when the
/// AcademicsCbtTestOngoingOneScreen is first loaded.
class AcademicsCbtTestOngoingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestOngoingOneController());
  }
}
