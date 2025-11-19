import 'package:schulupparent/core/utils/image_constant.dart';

class DashboardExtendedViewModel {
  final String title;
  final String imagePath;

  DashboardExtendedViewModel({
    required this.title,
    required this.imagePath,
  });

 // Static method to get sample data
  static List<DashboardExtendedViewModel> getSampleList() {
    return [
      DashboardExtendedViewModel(
        title: "Fees",
        imagePath: ImageConstant.imgFees,
      ),
      DashboardExtendedViewModel(
        title: "Assignments",
        imagePath: ImageConstant.imgAssignments,
      ),
      DashboardExtendedViewModel(
        title: "CBT Tests",
        imagePath: ImageConstant.imgCbttests,
      ),
      DashboardExtendedViewModel(
        title: "Lessons",
        imagePath: ImageConstant.imgLessons,
      ),
      DashboardExtendedViewModel(
        title: "Schular Ai",
        imagePath: ImageConstant.imgSchularai,
      ),
      DashboardExtendedViewModel(
        title: "Events",
        imagePath: ImageConstant.imgEvents,
      ),
       DashboardExtendedViewModel(
        title: "Ward Progress",
        imagePath: ImageConstant.imgWardprogress,
      ),
       DashboardExtendedViewModel(
        title: "Ward Profile",
        imagePath: ImageConstant.imgWardprofile,
      ),
    ];
  }
}

