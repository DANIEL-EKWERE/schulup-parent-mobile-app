import 'package:schulupparent/parent/parent_presentation/settings/controller/settings_controller.dart';

import '../../../core/app_export.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
