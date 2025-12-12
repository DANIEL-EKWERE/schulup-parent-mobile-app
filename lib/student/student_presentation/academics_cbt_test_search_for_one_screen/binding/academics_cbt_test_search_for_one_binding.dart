// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_search_for_one_controller.dart';

/// A binding class for the AcademicsCbtTestSearchForOneScreen.
///
/// This class ensures that the AcademicsCbtTestSearchForOneController is created when the
/// AcademicsCbtTestSearchForOneScreen is first loaded.
class AcademicsCbtTestSearchForOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsCbtTestSearchForOneController());
  }
}
