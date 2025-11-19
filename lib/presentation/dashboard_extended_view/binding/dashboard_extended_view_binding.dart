import 'package:get/get.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

class DashboardExtendedViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> DashboardExtendedViewController());
  }
  
}