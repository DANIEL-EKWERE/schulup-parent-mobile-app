import 'package:get/get.dart';
import 'package:schulupparent/student/student_presentation/change_password/controller/change_password_controller.dart';

class StudentChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentChangePasswordController());
  }
}
