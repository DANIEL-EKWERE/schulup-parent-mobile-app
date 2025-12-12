import 'package:get/get.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_page/controller/academics_assignment_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_page/models/academics_assignment_model.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_all_lessons_page/models/academics_lesson_all_lessons_model.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_cbt_test_page/controller/academics_lesson_cbt_test_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_cbt_test_page/models/academics_lesson_cbt_test_model.dart';

class AcademicsAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AcademicsAssignmentController(AcademicsAssignmentModel().obs),
    );

    Get.put(
      AcademicsAssignmentController(AcademicsAssignmentModel().obs),
      permanent: true,
    );
  }
}
