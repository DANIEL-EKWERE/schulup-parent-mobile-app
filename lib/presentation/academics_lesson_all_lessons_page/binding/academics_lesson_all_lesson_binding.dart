import 'package:get/get.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/models/academics_lesson_all_lessons_model.dart';

class AcademicsLessonAllLessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AcademicsLessonAllLessonsController(
        AcademicsLessonAllLessonsModel().obs,
      ),
    );

 
  }
}
