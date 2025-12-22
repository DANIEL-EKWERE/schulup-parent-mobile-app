import 'package:schulupparent/student/student_presentation/settings/controller/settings_controller.dart';

import '../../../core/app_export.dart';

class StudentSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentSettingsController());
  }
}
