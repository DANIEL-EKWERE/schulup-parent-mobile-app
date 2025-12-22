// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../reports_ward_progress_class_page/reports_ward_progress_class_page.dart';
import '../reports_ward_progress_subject_page/reports_ward_progress_subject_page.dart';
import 'controller/reports_ward_progress_academic_controller.dart';
import 'scrollview_tab_page.dart'; // ignore_for_file: must_be_immutable

StudentDashboardExtendedViewController dashboardExtendedViewController =
    Get.find<StudentDashboardExtendedViewController>();

StudentReportsWardProgressAcademicController controller = Get.put(
  StudentReportsWardProgressAcademicController(),
);

class StudentReportsWardProgressAcademicScreen extends StatefulWidget {
  const StudentReportsWardProgressAcademicScreen({Key? key}) : super(key: key);

  @override
  State<StudentReportsWardProgressAcademicScreen> createState() =>
      _StudentReportsWardProgressAcademicScreenState();
}

class _StudentReportsWardProgressAcademicScreenState
    extends State<StudentReportsWardProgressAcademicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnarrowleft(),
              Expanded(
                child: Container(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    //NeverScrollableScrollPhysics(),
                    controller: controller.tabviewController,
                    children: [
                      ScrollviewTabPage(),
                      ReportsWardProgressSubjectPage(),
                      ReportsWardProgressClassPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnarrowleft() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            height: 36.h,
            leadingWidth: 59.h,
            leading: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              margin: EdgeInsets.only(left: 25.h, bottom: 1.h),
              onTap: () {
                onTapArrowleftone();
              },
            ),
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_ward_progress".tr),
                AppbarSubtitleFive(
                  text:
                      dashboardExtendedViewController
                          .selectedStudent1!
                          .firstName!,
                  margin: EdgeInsets.symmetric(horizontal: 43.h),
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              width: double.infinity,
              // margin: EdgeInsets.only(left: 24.h),
              child: TabBar(
                controller: controller.tabviewController,
                isScrollable: true,
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: 4.h),
                tabAlignment: TabAlignment.start,
                labelColor: appTheme.whiteA700,
                labelStyle: TextStyle(
                  fontSize: 16.fSize,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: theme.colorScheme.onPrimary,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.fSize,
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
                        child: Text("msg_academic_progress".tr),
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
                        child: Text("msg_subject_progress".tr),
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
                        child: Text("lbl_class_overview".tr),
                      ),
                    ),
                  ),
                ],
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    controller.tabIndex.value = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.of(Get.context!).pop(); //
  }
}
