import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/news_events_screen/news_events_screen.dart';

import '../../../core/app_export.dart';
import '../controller/academics_cbt_test_test_details_controller.dart';

/// A binding class for the AcademicsCbtTestTestDetailsScreen.
///
/// This class ensures that the AcademicsCbtTestTestDetailsController is created when the
/// AcademicsCbtTestTestDetailsScreen is first loaded.
class StudentAcademicsCbtTestTestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentAcademicsCbtTestTestDetailsController(), fenix: true);
    //Get.lazyPut(() => StudentDashboardExtendedViewController(), fenix: true);
  }
}
