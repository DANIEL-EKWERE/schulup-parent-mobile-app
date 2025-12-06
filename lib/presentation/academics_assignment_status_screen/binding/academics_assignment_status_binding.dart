// TODO Implement this library.
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/models/academics_lesson_all_lessons_model.dart';
import 'package:schulupparent/presentation/attendance_filter_start_date_bottomsheet/controller/attendance_filter_start_date_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/direct_message_screen/controller/direct_message_controller.dart';
import 'package:schulupparent/presentation/news_modal_jump_to_a_date_bottomsheet/controller/news_modal_jump_to_a_date_controller.dart';

import '../../../core/app_export.dart';
import '../controller/academics_assignment_status_controller.dart';

/// A binding class for the AcademicsAssignmentStatusScreen.
///
/// This class ensures that the AcademicsAssignmentStatusController is created when the
/// AcademicsAssignmentStatusScreen is first loaded.
class AcademicsAssignmentStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcademicsAssignmentStatusController());

    // DashboardExtendedViewController controller = Get.put(
    //   DashboardExtendedViewController(),
    // );

    //AttendanceFilterStartDateController
    Get.put(DashboardExtendedViewController(), permanent: true);
    Get.put(AttendanceFilterStartDateController(), permanent: true);
    Get.put(NewsModalJumpToADateController(), permanent: true);
    Get.put(
      AcademicsLessonAllLessonsController(AcademicsLessonAllLessonsModel().obs),
      permanent: true,
    );

    //Get.put(ChatController(), permanent: true);
  }
}
