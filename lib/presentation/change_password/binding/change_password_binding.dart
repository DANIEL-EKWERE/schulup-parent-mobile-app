import 'package:get/get.dart';
import 'package:schulupparent/presentation/change_password/controller/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }

}