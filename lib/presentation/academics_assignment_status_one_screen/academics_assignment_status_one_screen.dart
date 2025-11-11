// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../attendance_all_variants_page/attendance_all_variants_page.dart';
import '../news_all_variants_page/news_all_variants_page.dart';
import '../reports_report_card_all_variants_page/reports_report_card_all_variants_page.dart';
import 'controller/academics_assignment_status_one_controller.dart'; // ignore_for_file: must_be_immutable

class AcademicsAssignmentStatusOneScreen
    extends GetWidget<AcademicsAssignmentStatusOneController> {
  const AcademicsAssignmentStatusOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: Container(
          height: 694.h,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [],
                ),
              ),
              _buildColumnacademics(),
            ],
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
  Widget _buildColumnacademics() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: AppDecoration.primaryC7Main,
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(
              height: 38.h,
              centerTitle: true,
              title: Column(
                children: [
                  AppbarSubtitleOne(text: "lbl_academics".tr),
                  AppbarSubtitleFive(
                    text: "lbl_ogechi".tr,
                    margin: EdgeInsets.only(left: 28.h, right: 29.h),
                  ),
                ],
              ),
              actions: [
                AppbarTrailingIconbutton(
                  imagePath: ImageConstant.imgIconsSmallSchularAi,
                ),
                AppbarTrailingIconbutton(
                  imagePath: ImageConstant.imgSearch,
                  margin: EdgeInsets.only(left: 11.h, right: 25.h),
                ),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              child: Obx(
                () => Container(
                  margin: EdgeInsets.symmetric(horizontal: 66.h),
                  child: TabBar(
                    controller: controller.tabviewController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: appTheme.whiteA700,
                    labelStyle: TextStyle(
                      fontSize: 12.fSize,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelColor: theme.colorScheme.onPrimary,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 12.fSize,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: [
                      Tab(
                        height: 38,
                        child: Container(
                          alignment: Alignment.center,
                          decoration:
                              controller.tabIndex.value == 0
                                  ? BoxDecoration(
                                    color: theme.colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(18.h),
                                  )
                                  : BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(18.h),
                                  ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.h,
                              vertical: 10.h,
                            ),
                            child: Text("lbl_assignment".tr),
                          ),
                        ),
                      ),
                      Tab(
                        height: 38,
                        child: Container(
                          alignment: Alignment.center,
                          decoration:
                              controller.tabIndex.value == 1
                                  ? BoxDecoration(
                                    color: theme.colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(18.h),
                                  )
                                  : BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(18.h),
                                  ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.h,
                              vertical: 10.h,
                            ),
                            child: Text("lbl_cbt_test".tr),
                          ),
                        ),
                      ),
                      Tab(
                        height: 38,
                        child: Container(
                          alignment: Alignment.center,
                          decoration:
                              controller.tabIndex.value == 2
                                  ? BoxDecoration(
                                    color: theme.colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(18.h),
                                  )
                                  : BoxDecoration(
                                    color: appTheme.whiteA700,
                                    borderRadius: BorderRadius.circular(18.h),
                                  ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.h,
                              vertical: 10.h,
                            ),
                            child: Text("lbl_lesson".tr),
                          ),
                        ),
                      ),
                    ],
                    indicatorColor: Colors.transparent,
                    onTap: (index) {
                      controller.tabIndex.value = index;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.h),
          ],
        ),
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
        return "/";
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
}
