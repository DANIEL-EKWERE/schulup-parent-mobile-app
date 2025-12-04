// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../attendance_all_variants_page/attendance_all_variants_page.dart';
import '../news_all_variants_page/news_all_variants_page.dart';
import '../reports_report_card_all_variants_page/reports_report_card_all_variants_page.dart';
import 'controller/reports_report_card_all_variants_two_controller.dart'; // ignore_for_file: must_be_immutable

DashboardExtendedViewController dashboardExtendedViewController = Get.find<DashboardExtendedViewController>();
class ReportsReportCardAllVariantsTwoScreen
    extends GetWidget<ReportsReportCardAllVariantsTwoController> {
  const ReportsReportCardAllVariantsTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildColumnreportcar(),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 24.h, top: 14.h, right: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [_buildColumnlineone()],
                  ),
                ),
              ),
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
  Widget _buildColumnreportcar() {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            height: 36.h,
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_report_card".tr),
                AppbarSubtitleFive(
                  text:
                      dashboardExtendedViewController
                          .selectedStudent1!
                          .firstName!,
                  margin: EdgeInsets.symmetric(horizontal: 33.h),
                ),
              ],
            ),
            actions: [
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgIconsSmallWardProgress,
                margin: EdgeInsets.only(right: 25.h, bottom: 1.h),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC13.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2022_2023".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC13.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2023_2024".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC13.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2024_2025".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC2.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2025_2026".tr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: AppDecoration.outline,
            width: double.maxFinite,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 54.h,
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "lbl_first_term".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsTinyDown,
                        height: 16.h,
                        width: 18.h,
                        margin: EdgeInsets.only(left: 10.h),
                      ),
                      Spacer(),
                      Text("lbl_termly".tr, style: theme.textTheme.labelLarge),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsTinyDown,
                        height: 16.h,
                        width: 18.h,
                        margin: EdgeInsets.symmetric(horizontal: 10.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlineone() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 20.h, top: 20.h, right: 20.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_first_term_primary".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsTinyDownload,
                  height: 16.h,
                  width: 18.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsTinyShare,
                  height: 16.h,
                  width: 18.h,
                  margin: EdgeInsets.only(left: 14.h),
                ),
              ],
            ),
          ),
          Text(
            "msg_monday_sept_12".tr,
            style: CustomTextStyles.bodySmallSecondaryContainer10,
          ),
        ],
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
