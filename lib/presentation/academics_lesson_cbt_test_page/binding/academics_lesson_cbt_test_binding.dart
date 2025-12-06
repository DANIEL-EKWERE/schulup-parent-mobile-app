import 'package:get/get.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/models/academics_lesson_all_lessons_model.dart';
import 'package:schulupparent/presentation/academics_lesson_cbt_test_page/controller/academics_lesson_cbt_test_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_cbt_test_page/models/academics_lesson_cbt_test_model.dart';

class AcademicsCbtTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AcademicsLessonCbtTestController(
        AcademicsLessonCbtTestModel().obs,
      ),
    );

 
  }
}
