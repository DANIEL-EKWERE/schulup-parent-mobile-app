import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/reports_ward_progress_class_two_controller.dart';
import 'models/reports_ward_progress_class_two_model.dart';

// ignore_for_file: must_be_immutable
class ReportsWardProgressClassTwoPage extends StatelessWidget {
  ReportsWardProgressClassTwoPage({Key? key}) : super(key: key);

  ReportsWardProgressClassTwoController controller = Get.put(
    ReportsWardProgressClassTwoController(
      ReportsWardProgressClassTwoModel().obs,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.maxFinite,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        _buildRowshowingone(),
                        SizedBox(height: 16.h),
                        _buildColumnlinefour(),
                        SizedBox(height: 10.h),
                        _buildColumnlineone(),
                        SizedBox(height: 10.h),
                        _buildColumnlinetwo(),
                        SizedBox(height: 10.h),
                        _buildColumnline(),
                      ],
                    ),
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
  Widget _buildRowshowingone() {
    return Container(
      decoration: AppDecoration.outline,
      width: double.maxFinite,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "msg_showing_averages4".tr,
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
                      padding: EdgeInsets.only(left: 6.h),
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
    );
  }

  /// Section Widget
  Widget _buildFrame427321469() {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 144.h,
        controller: controller.frame427321469Controller,
        hintText: "lbl_60".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlinefour() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_basic_science".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_ward_score".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                Container(
                  margin: EdgeInsets.only(left: 48.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 8.h,
                  ),
                  decoration: AppDecoration.errorC1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "lbl_49".tr,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_class_average".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321469(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321470() {
    return Padding(
      padding: EdgeInsets.only(right: 44.h),
      child: CustomTextFormField(
        width: 198.h,
        controller: controller.frame427321470Controller,
        hintText: "lbl_81".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlineone() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_christian_religious2".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_ward_score".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                Container(
                  margin: EdgeInsets.only(left: 48.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 8.h,
                  ),
                  decoration: AppDecoration.errorC1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "lbl_31".tr,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_class_average".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321470(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321471() {
    return CustomTextFormField(
      width: 236.h,
      controller: controller.frame427321471Controller,
      hintText: "lbl_97".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }

  /// Section Widget
  Widget _buildFrame427321472() {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 102.h,
        controller: controller.frame427321472Controller,
        hintText: "lbl_42".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlinetwo() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_civic_education".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 6.h),
            child: Column(
              spacing: 4,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_ward_score".tr,
                        style: CustomTextStyles.bodySmallGray700,
                      ),
                      _buildFrame427321471(),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Text(
                        "lbl_class_average".tr,
                        style: CustomTextStyles.bodySmallGray700,
                      ),
                      _buildFrame427321472(),
                    ],
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
  Widget _buildFrame427321473() {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 164.h,
        controller: controller.frame427321473Controller,
        hintText: "lbl_68".tr,
        textInputAction: TextInputAction.done,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnline() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_composition".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_ward_score".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                Container(
                  margin: EdgeInsets.only(left: 48.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 8.h,
                  ),
                  decoration: AppDecoration.errorC1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "lbl_47".tr,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_class_average".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321473(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
