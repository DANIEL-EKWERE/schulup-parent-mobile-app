import 'package:get/get.dart';
import 'package:schulupparent/student/student_presentation/direct_chat/controller/direct_chat_controller.dart';

class StudentDirectChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentDirectChatController());
  }
}
