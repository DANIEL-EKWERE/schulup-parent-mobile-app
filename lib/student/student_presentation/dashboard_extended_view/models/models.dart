import 'package:schulupparent/student/core/utils/image_constant.dart';

class DashboardExtendedViewModel {
  final String title;
  final String imagePath;
  final String? route;

  DashboardExtendedViewModel({
    required this.title,
    required this.imagePath,
    required this.route,
  });

  // Static method to get sample data
  static List<DashboardExtendedViewModel> getSampleList() {
    return [
      DashboardExtendedViewModel(
        title: "Fees",
        imagePath: ImageConstant.imgFees,
        route: '',
      ),
      DashboardExtendedViewModel(
        title: "Assignments",
        imagePath: ImageConstant.imgAssignments,
        route: '/academics_assignment_page',
      ),
      DashboardExtendedViewModel(
        title: "CBT Tests",
        imagePath: ImageConstant.imgCbttests,
        route: '/academics_cbt_test_page',
      ),
      DashboardExtendedViewModel(
        title: "Lessons",
        imagePath: ImageConstant.imgLessons,
        route: '/academics_lesson_all_lessons_page',
      ),
      DashboardExtendedViewModel(
        title: "Schular Ai",
        imagePath: ImageConstant.imgSchularai,
        route: '/academics_schular_ai_ongoing_screen',
      ),
      DashboardExtendedViewModel(
        title: "Events",
        imagePath: ImageConstant.imgEvents,
        route: '/news_events_screen',
      ),
      DashboardExtendedViewModel(
        title: "Ward Progress",
        imagePath: ImageConstant.imgWardprogress,
        route: '/reports_ward_progress_academic_screen',
      ),
      DashboardExtendedViewModel(
        title: "Ward Profile",
        imagePath: ImageConstant.imgWardprofile,
        route: '/student_dashboard_editWard_profile_screen',
      ),
    ];
  }
}
