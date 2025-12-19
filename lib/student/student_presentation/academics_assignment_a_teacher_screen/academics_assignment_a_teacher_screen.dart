// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../widgets/app_bar/appbar_title_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/academics_assignment_a_teacher_controller.dart'; // ignore_for_file: must_be_immutable

StudentDashboardExtendedViewController dashboardExtendedViewController =
    Get.find<StudentDashboardExtendedViewController>();

class AcademicsAssignmentATeacherScreen
    extends GetWidget<AcademicsAssignmentATeacherController> {
  const AcademicsAssignmentATeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 24.h, top: 18.h, right: 24.h),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 20.h,
                      top: 20.h,
                      right: 20.h,
                    ),
                    decoration: AppDecoration.fillGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "lbl_your_submission".tr,
                                style: CustomTextStyles.labelLargeBluegray700,
                              ),
                              Text(
                                "lbl_submitted".tr,
                                style:
                                    CustomTextStyles
                                        .bodySmallSecondaryContainer,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "msg_the_respiratory3".tr,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!.copyWith(
                            height: 1.50,
                          ),
                        ),
                        SizedBox(height: 18.h),
                        CustomTextFormField(
                          controller: controller.weburlController,
                          hintText: "lbl_image_jpeg".tr,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyImageFilled,
                              height: 16.h,
                              width: 16.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(maxHeight: 44.h),
                          suffix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyDownload,
                              height: 16.h,
                              width: 16.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          suffixConstraints: BoxConstraints(maxHeight: 44.h),
                          contentPadding: EdgeInsets.all(14.h),
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray20001,
                        ),
                        SizedBox(height: 14.h),
                        CustomTextFormField(
                          controller: controller.weburloneController,
                          hintText: "lbl_invitation_pdf".tr,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyPdf,
                              height: 16.h,
                              width: 16.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(maxHeight: 44.h),
                          suffix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyDownload,
                              height: 16.h,
                              width: 16.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          suffixConstraints: BoxConstraints(maxHeight: 44.h),
                          contentPadding: EdgeInsets.all(14.h),
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray20001,
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Divider(
                            color: appTheme.gray400.withValues(alpha: 0.5),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          "lbl_comments".tr,
                          style: CustomTextStyles.labelLargeBluegray700,
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: 202.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.h,
                            vertical: 8.h,
                          ),
                          decoration: AppDecoration.accentC4.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderBL10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "msg_well_done_ogechi".tr,
                                maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmallGray700
                                    .copyWith(height: 1.40),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "msg_mr_kayode_08_55pm".tr,
                                style: CustomTextStyles.bodySmall10_1,
                              ),
                              TextSpan(
                                text: "lbl_nov_10_2025".tr,
                                style: CustomTextStyles.bodySmall10_1,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildColumnvector(),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      height: 66.h,
      title: Container(
        height: 66.h,
        width: 334.h,
        margin: EdgeInsets.only(left: 25.h, right: 33.h),
        child: Stack(
          children: [
            AppbarSubtitleThree(text: "msg_in_your_own_words".tr),
            Padding(
              padding: EdgeInsets.only(left: 122.h, right: 114.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppbarSubtitleOne(text: "lbl_assignment".tr),
                  SizedBox(height: 1.h),
                  AppbarSubtitleFive(
                    text:
                        dashboardExtendedViewController
                            .selectedStudent1!
                            .firstName!,
                    margin: EdgeInsets.symmetric(horizontal: 33.h),
                  ),
                ],
              ),
            ),
            AppbarTitleIconbutton(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              margin: EdgeInsets.only(right: 300.h),
              onTap: () {
                onTapArrowleftone();
              },
            ),
          ],
        ),
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnvector() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: AppDecoration.grayC12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: controller.vectoroneController,
            hintText: "msg_type_your_reply".tr,
            hintStyle: CustomTextStyles.bodyMediumSecondaryContainer,
            suffix: Container(
              padding: EdgeInsets.fromLTRB(6.h, 4.h, 4.h, 4.h),
              margin: EdgeInsets.fromLTRB(16.h, 18.h, 24.h, 18.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(12.h),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 12.h,
                width: 12.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(maxHeight: 130.h),
            maxLines: 5,
            contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 24.h, 14.h),
            borderDecoration: TextFormFieldStyleHelper.outlineGray,
            fillColor: appTheme.whiteA700,
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
