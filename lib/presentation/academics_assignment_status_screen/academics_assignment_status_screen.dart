import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/dashboard_extended_view.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../attendance_all_variants_page/attendance_all_variants_page.dart';
import '../news_all_variants_page/news_all_variants_page.dart';
import '../reports_report_card_all_variants_page/reports_report_card_all_variants_page.dart';
import 'academics_assignment_status_initial_page.dart';
import 'controller/academics_assignment_status_controller.dart'; // ignore_for_file: must_be_immutable

class AcademicsAssignmentStatusScreen
    extends GetWidget<AcademicsAssignmentStatusController> {
  const AcademicsAssignmentStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.dashboardExtendedView,
          onGenerateRoute:
              (routeSetting) => GetPageRoute(
                page: () => getCurrentPage(routeSetting.name!),
                transition: Transition.noTransition,
              ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottombar(),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottombar() {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.toNamed(getCurrentRoute(type), id: 1);
        },
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardExtendedView;
      case BottomBarEnum.Academics:
        return AppRoutes.academicsAssignmentStatusInitialPage;
      case BottomBarEnum.Attendance:
        return AppRoutes.attendanceAllVariantsPage;
      case BottomBarEnum.Reports:
        return AppRoutes.reportsReportCardAllVariantsPage;
      case BottomBarEnum.News:
        return AppRoutes.newsAllVariantsPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboardExtendedView:
        return DashboardExtendedView();
      case AppRoutes.academicsAssignmentStatusInitialPage:
        return AcademicsAssignmentStatusInitialPage();
      case AppRoutes.attendanceAllVariantsPage:
        return AttendanceAllVariantsPage();
      case AppRoutes.reportsReportCardAllVariantsPage:
        return ReportsReportCardAllVariantsPage();
      case AppRoutes.newsAllVariantsPage:
        return NewsAllVariantsPage();
      default:
        return DefaultWidget();
    }
  }
}
