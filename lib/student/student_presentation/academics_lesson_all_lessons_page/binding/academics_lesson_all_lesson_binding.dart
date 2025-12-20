import 'package:get/get.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/academics_assignment_status_model.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_all_lessons_page/models/academics_lesson_all_lessons_model.dart';

class StudentAcademicsLessonAllLessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StudentAcademicsLessonAllLessonsController(
        StudentAcademicsLessonAllLessonsModel().obs,
      ),
    );
    Get.lazyPut(
      () => StudentAcademicsAssignmentStatusController(
        // AcademicsAssignmentStatusModel().obs,
      ),
      fenix: true,
    );
  }
}
