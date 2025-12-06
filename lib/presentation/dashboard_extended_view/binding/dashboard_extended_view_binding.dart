import 'package:get/get.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/models/academics_lesson_all_lessons_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

class DashboardExtendedViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> DashboardExtendedViewController());
       Get.put(
      AcademicsLessonAllLessonsController(AcademicsLessonAllLessonsModel().obs),
      permanent: true,
    );
  }
  
  
}