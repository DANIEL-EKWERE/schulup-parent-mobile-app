import 'package:get/get.dart';
import 'package:schulupparent/student/student_presentation/signalr_chat/controller/chatController.dart';
import 'package:schulupparent/student/student_presentation/signalr_chat/controller/signalr_service.dart';

class DirectMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController1());
    Get.lazyPut(() => SignalRChatService());
  }
}
