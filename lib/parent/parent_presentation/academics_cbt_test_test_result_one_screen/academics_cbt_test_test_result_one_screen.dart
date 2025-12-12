// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_radio_button.dart';
import 'controller/academics_cbt_test_test_result_one_controller.dart'; // ignore_for_file: must_be_immutable

import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

class AcademicsCbtTestTestResultOneScreen
    extends GetWidget<AcademicsCbtTestTestResultOneController> {
  const AcademicsCbtTestTestResultOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                spacing: 30,
                children: [
                  _buildColumncurrentaf(),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_question_1_10".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "msg_who_was_the_first".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
                            height: 1.50,
                          ),
                        ),
                        SizedBox(height: 18.h),
                        _buildWhowasthe(),
                        SizedBox(height: 30.h),
                        Text(
                          "lbl_question_2_10".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "msg_in_what_year_did".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
                            height: 1.50,
                          ),
                        ),
                        SizedBox(height: 18.h),
                        _buildInwhatyear(),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
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
      leadingWidth: 59.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgCloseWhiteA700,
        margin: EdgeInsets.only(left: 25.h, top: 22.h, bottom: 8.h),
        onTap: () {
          onTapCloseone();
        },
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "lbl_result".tr),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumncurrentaf() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
      decoration: AppDecoration.primaryC10,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_current_affairs".tr,
            style: CustomTextStyles.titleMediumOnPrimary,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              spacing: 10,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_subject".tr,
                    durationTwo: "lbl_history".tr,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_duration".tr,
                    durationTwo: "lbl_2_minutes".tr,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "msg_marks_obtainable".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        decoration: AppDecoration.grayC7.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Text(
                          "lbl_10".tr,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmallWhiteA700_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_marks_obtained".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 22.h),
                        decoration: AppDecoration.warningC2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Text(
                          "lbl_6".tr,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmallWhiteA700_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_percentage".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.h),
                        decoration: AppDecoration.warningC2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Text(
                          "lbl_60".tr,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmallWhiteA700_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_started".tr,
                    durationTwo: "msg_nov_08_2025".tr,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_submitted2".tr,
                    durationTwo: "msg_nov_08_2025_19_56".tr,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWhowasthe() {
    return SizedBox(
      width: double.maxFinite,
      child: Obx(
        () => Column(
          children: [
            CustomRadioButton(
              text: "lbl_nnamdi_azikiwe".tr,
              value: "lbl_nnamdi_azikiwe".tr,
              groupValue: controller.whowasthe.value,
              padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
              decoration: RadioStyleHelper.outlineGreen,
              onChange: (value) {
                controller.whowasthe.value = value;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_obafemi_awolowo".tr,
                value: "lbl_obafemi_awolowo".tr,
                groupValue: controller.whowasthe.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineRed,
                onChange: (value) {
                  controller.whowasthe.value = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_tafawa_balewa".tr,
                value: "lbl_tafawa_balewa".tr,
                groupValue: controller.whowasthe.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGray,
                onChange: (value) {
                  controller.whowasthe.value = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_ahmadu_bello".tr,
                value: "lbl_ahmadu_bello".tr,
                groupValue: controller.whowasthe.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGray,
                onChange: (value) {
                  controller.whowasthe.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildInwhatyear() {
    return SizedBox(
      width: double.maxFinite,
      child: Obx(
        () => Column(
          children: [
            CustomRadioButton(
              text: "lbl_1956".tr,
              value: "lbl_1956".tr,
              groupValue: controller.inwhatyear.value,
              padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
              decoration: RadioStyleHelper.outlineGray,
              onChange: (value) {
                controller.inwhatyear.value = value;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_1963".tr,
                value: "lbl_1963".tr,
                groupValue: controller.inwhatyear.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGray,
                onChange: (value) {
                  controller.inwhatyear.value = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_1970".tr,
                value: "lbl_1970".tr,
                groupValue: controller.inwhatyear.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGray,
                onChange: (value) {
                  controller.inwhatyear.value = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_1960".tr,
                value: "lbl_1960".tr,
                groupValue: controller.inwhatyear.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGreen,
                onChange: (value) {
                  controller.inwhatyear.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildRowduration({
    required String durationOne,
    required String durationTwo,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          durationOne,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
        Text(
          durationTwo,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapCloseone() {
    Get.back();
  }
}
