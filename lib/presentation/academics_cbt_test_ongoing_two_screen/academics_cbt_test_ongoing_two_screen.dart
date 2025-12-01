// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_radio_button.dart';
import 'controller/academics_cbt_test_ongoing_two_controller.dart'; // ignore_for_file: must_be_immutable

class AcademicsCbtTestOngoingTwoScreen
    extends GetWidget<AcademicsCbtTestOngoingTwoController> {
  const AcademicsCbtTestOngoingTwoScreen({Key? key}) : super(key: key);

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
              _buildColumnarrowleft(),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [_buildColumnquestion2()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildColumnprevious(),
    );
  }

  /// Section Widget
  Widget _buildColumnarrowleft() {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 4,
        children: [
          CustomAppBar(
            height: 38.h,
            leadingWidth: 59.h,
            leading: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              margin: EdgeInsets.only(left: 25.h, top: 1.h, bottom: 2.h),
              onTap: () {
                onTapArrowleftone();
              },
            ),
            centerTitle: true,
            title: Column(
              children: [
                Row(
                  children: [
                    AppbarTitleImage(
                      imagePath: ImageConstant.imgIconsTinyClock,
                      height: 16.h,
                      width: 16.h,
                      margin: EdgeInsets.only(top: 3.h, bottom: 4.h),
                    ),
                    AppbarSubtitleOne(
                      text: "lbl_00_00_52".tr,
                      margin: EdgeInsets.only(left: 6.h),
                    ),
                  ],
                ),
                AppbarSubtitleFive(
                  text:
                      "", //dashboardExtendedViewController.selectedStudent1!.firstName!,
                  margin: EdgeInsets.symmetric(horizontal: 40.h),
                ),
              ],
            ),
          ),
          Container(
            height: 10.h,
            width: 392.h,
            decoration: BoxDecoration(color: appTheme.gray20001),
            child: ClipRRect(
              child: LinearProgressIndicator(
                value: 0.33,
                backgroundColor: appTheme.gray20001,
                valueColor: AlwaysStoppedAnimation<Color>(appTheme.cyan400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnquestion2() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_question_2_10".tr, style: theme.textTheme.bodySmall),
          SizedBox(height: 10.h),
          Text(
            "msg_in_what_year_did".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyMediumOnPrimary.copyWith(height: 1.50),
          ),
          SizedBox(height: 28.h),
          SizedBox(
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
                      decoration: RadioStyleHelper.outlinePrimary,
                      onChange: (value) {
                        controller.inwhatyear.value = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnprevious() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  height: 38.h,
                  width: 112.h,
                  text: "lbl_previous".tr,
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 4.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftWhiteA700,
                      height: 16.h,
                      width: 16.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL18,
                  buttonTextStyle: theme.textTheme.labelLarge!,
                ),
                CustomElevatedButton(
                  height: 38.h,
                  width: 112.h,
                  text: "lbl_submit".tr,
                  buttonStyle: CustomButtonStyles.fillCyan,
                  buttonTextStyle: theme.textTheme.labelLarge!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
