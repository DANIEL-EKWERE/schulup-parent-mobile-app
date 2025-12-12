// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_search_for_controller.dart';

/// A binding class for the AcademicsCbtTestSearchForScreen.
///
/// This class ensures that the AcademicsCbtTestSearchForController is created when the
/// AcademicsCbtTestSearchForScreen is first loaded.
class AcademicsCbtTestSearchForBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestSearchForController());
  }
}
