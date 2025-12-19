// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../attendance_all_variants_page/attendance_all_variants_page.dart';
import '../news_all_variants_page/news_all_variants_page.dart';
import '../reports_report_card_all_variants_page/reports_report_card_all_variants_page.dart';
import 'controller/attendance_filter_start_date_one_controller.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart'; // ignore_for_file: must_be_immutable

StudentDashboardExtendedViewController dashboardExtendedViewController =
    Get.find<StudentDashboardExtendedViewController>();

class AttendanceFilterStartDateOneScreen
    extends GetWidget<AttendanceFilterStartDateOneController> {
  const AttendanceFilterStartDateOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnattendanc(),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      spacing: 10,
                      children: [
                        SizedBox(height: 14.h),
                        _buildListline(),
                        _buildColumnlineone(),
                      ],
                    ),
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
  Widget _buildColumnattendanc() {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            height: 38.h,
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_attendance".tr),
                AppbarSubtitleFive(
                  text:
                      dashboardExtendedViewController
                          .selectedStudent1!
                          .firstName!,
                  margin: EdgeInsets.symmetric(horizontal: 32.h),
                ),
              ],
            ),
            actions: [
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgUserWhiteA700,
                margin: EdgeInsets.only(top: 1.h, right: 25.h, bottom: 2.h),
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
                      "lbl_jun_2025".tr,
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
                      "lbl_jul_2025".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 8.h,
                    ),
                    decoration: AppDecoration.grayC13.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_sept_2025".tr,
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
                      "lbl_oct_2025".tr,
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
                      "lbl_nov_2025".tr,
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
                    horizontal: 24.h,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "msg_showing_attendance".tr,
                        style: CustomTextStyles.bodySmallWhiteA700,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgIconsTinyRefresh,
                            height: 16.h,
                            width: 16.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              "lbl_reset".tr,
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ],
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
  Widget _buildListline() {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 10.h);
        },
        itemCount:
            controller
                .attendanceFilterStartDateOneModelObj
                .value
                .listlineItemList
                .value
                .length,
        itemBuilder: (context, index) {
          ListlineItemModel model =
              controller
                  .attendanceFilterStartDateOneModelObj
                  .value
                  .listlineItemList
                  .value[index];
          return ListlineItemWidget(model);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPublicholiday() {
    return CustomTextFormField(
      controller: controller.publicholidayController,
      hintText: "lbl_public_holiday".tr,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
    );
  }

  /// Section Widget
  Widget _buildColumnlineone() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 8,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_monday_aug_18".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          _buildPublicholiday(),
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
