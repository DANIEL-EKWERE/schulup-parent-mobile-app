import 'package:get/get.dart';
import 'package:schulupparent/parent/parent_presentation/notification/controller/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
  }
}
