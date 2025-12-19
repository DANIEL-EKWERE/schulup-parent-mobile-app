import 'package:schulupparent/student/core/app_export.dart';
import 'package:schulupparent/student/student_presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';

class StudentDashboardEditWardProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDashboardEditWardProfileController>(
      () => StudentDashboardEditWardProfileController(),
      fenix: false, // Set to false so it gets deleted when not in use
    );
  }
}
