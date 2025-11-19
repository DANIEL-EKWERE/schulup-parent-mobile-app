import 'package:get/get.dart';
import 'package:schulupparent/presentation/direct_chat/controller/direct_chat_controller.dart';

class DirectChatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DirectChatController());
  }
  
}