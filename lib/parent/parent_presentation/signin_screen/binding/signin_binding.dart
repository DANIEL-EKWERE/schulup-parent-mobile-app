import 'package:get/get.dart';
import 'package:schulupparent/parent/parent_presentation/signin_screen/controller/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}
