// TODO Implement this library.
// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle_four.dart';
import '../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/reports_report_card_preview_one_controller.dart'; // ignore_for_file: must_be_immutable

DashboardExtendedViewController dashboardExtendedViewController = Get.find<DashboardExtendedViewController>();
class ReportsReportCardPreviewOneScreen
    extends GetWidget<ReportsReportCardPreviewOneController> {
  const ReportsReportCardPreviewOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.black900,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: 14.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgBeigeAndBlack,
                    height: 554.h,
                    width: double.maxFinite,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgBeigeAndBlack,
                    height: 554.h,
                    width: double.maxFinite,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 49.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftWhiteA700,
        margin: EdgeInsets.only(left: 25.h),
        onTap: () {
          onTapArrowleftone();
        },
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleTwo(text: "msg_first_term_primary".tr),
          AppbarSubtitleFour(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.only(left: 61.h, right: 62.h),
          ),
        ],
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconsTinyDownloading,
          margin: EdgeInsets.only(right: 24.h),
        ),
      ],
      styleType: Style.bgFillOnPrimary,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
