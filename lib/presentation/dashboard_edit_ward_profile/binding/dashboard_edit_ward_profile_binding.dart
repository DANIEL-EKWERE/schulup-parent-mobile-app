import 'package:schulupparent/core/app_export.dart';
import 'package:schulupparent/presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';

class DashboardEditWardProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardEditWardProfileController>(
      () => DashboardEditWardProfileController(),
      fenix: false, // Set to false so it gets deleted when not in use
    );
  }
}
