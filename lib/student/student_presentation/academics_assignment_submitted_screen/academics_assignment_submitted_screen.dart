// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/academics_assignment_submitted_controller.dart';
import 'models/chipviewdueonoc_item_model.dart';
import 'widgets/chipviewdueonoc_item_widget.dart'; // ignore_for_file: must_be_immutable

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

class AcademicsAssignmentSubmittedScreen
    extends GetWidget<AcademicsAssignmentSubmittedController> {
  const AcademicsAssignmentSubmittedScreen({Key? key}) : super(key: key);

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
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_the_respiratory".tr,
                          style: CustomTextStyles.titleMediumOnPrimary,
                        ),
                        SizedBox(height: 18.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Divider(
                            color: appTheme.gray400.withValues(alpha: 0.5),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: _buildRowpostedon(
                            postedonOne: "lbl_subject".tr,
                            oct272025One: "lbl_basic_science".tr,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: _buildRowpostedon(
                            postedonOne: "lbl_posted_on".tr,
                            oct272025One: "lbl_oct_27_2025".tr,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        _buildChipviewdueonoc(),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Divider(
                            color: appTheme.gray400.withValues(alpha: 0.5),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "lbl_question".tr,
                          style: CustomTextStyles.bodyMediumOnPrimary,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "msg_in_your_own_words".tr,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall!.copyWith(
                            height: 1.50,
                          ),
                        ),
                        SizedBox(height: 36.h),
                        _buildColumnyoursubmi(),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.h),
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
        imagePath: ImageConstant.imgArrowLeftWhiteA700,
        margin: EdgeInsets.only(left: 25.h, top: 22.h, bottom: 8.h),
        onTap: () {
          onTapArrowleftone();
        },
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "lbl_assignment".tr),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildChipviewdueonoc() {
    return SizedBox(
      width: double.maxFinite,
      child: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10.h,
            spacing: 10.h,
            children: List<Widget>.generate(
              controller
                  .academicsAssignmentSubmittedModelObj
                  .value
                  .chipviewdueonocItemList
                  .value
                  .length,
              (index) {
                ChipviewdueonocItemModel model =
                    controller
                        .academicsAssignmentSubmittedModelObj
                        .value
                        .chipviewdueonocItemList
                        .value[index];
                return ChipviewdueonocItemWidget(model);
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnyoursubmi() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 18,
        mainAxisSize: MainAxisSize.min,
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
                  style: CustomTextStyles.bodySmallSecondaryContainer,
                ),
              ],
            ),
          ),
          Text(
            "msg_the_respiratory3".tr,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall!.copyWith(height: 1.50),
          ),
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
          CustomTextFormField(
            controller: controller.weburloneController,
            hintText: "lbl_invitation_pdf".tr,
            textInputAction: TextInputAction.done,
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
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRowpostedon({
    required String postedonOne,
    required String oct272025One,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          postedonOne,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
        Text(
          oct272025One,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
