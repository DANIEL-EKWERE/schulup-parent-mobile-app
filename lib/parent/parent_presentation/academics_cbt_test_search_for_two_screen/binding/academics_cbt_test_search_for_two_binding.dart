// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_search_for_two_controller.dart';

/// A binding class for the AcademicsCbtTestSearchForTwoScreen.
///
/// This class ensures that the AcademicsCbtTestSearchForTwoController is created when the
/// AcademicsCbtTestSearchForTwoScreen is first loaded.
class AcademicsCbtTestSearchForTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestSearchForTwoController());
  }
}
