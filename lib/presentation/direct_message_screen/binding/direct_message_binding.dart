import 'package:get/get.dart';
import 'package:schulupparent/presentation/direct_message_screen/controller/direct_message_controller.dart';

class DirectMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ChatController());
  }

}