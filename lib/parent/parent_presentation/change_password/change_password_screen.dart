// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/parent/parent_presentation/change_password/controller/change_password_controller.dart';
import 'package:schulupparent/parent/parent_presentation/settings/controller/settings_controller.dart';
import 'package:schulupparent/parent/widgets/custom_text_form_field.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();
ChangePasswordController controller = Get.put(ChangePasswordController());

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: ListView(
            //  mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 10),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Current Password',
                        style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
                          fontSize: 16.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controller.currentPasswordController,
                      hintText: "Current Password",
                      hintStyle: CustomTextStyles.labelLargeBluegray700
                          .copyWith(fontSize: 16.h),
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPassword,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgVisibility,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'New Password',
                        style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
                          fontSize: 16.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controller.newPasswordController,
                      hintText: "New Password",
                      hintStyle: CustomTextStyles.labelLargeBluegray700
                          .copyWith(fontSize: 16.h),
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPassword,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgVisibility,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Confirm New Password',
                        style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
                          fontSize: 16.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controller.confirmPasswordController,
                      hintText: "Confirm New Password",
                      hintStyle: CustomTextStyles.labelLargeBluegray700
                          .copyWith(fontSize: 16.h),
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPassword,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgVisibility,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //  bottomNavigationBar: _buildColumniconssmal(),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 75.h,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 10,
          width: 10,
          //margin: EdgeInsets.only(left: 25.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffEF5A07),
            border: Border.all(color: Color(0xffFFBC71)),
          ),
          child: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            //margin: EdgeInsets.only(left: 25.h),
            onTap: () {
              onTapArrowleftone();
            },
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "Settings"),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
      actions: [
        (controller.currentPasswordController.text.isEmpty ||
                controller.newPasswordController.text.isEmpty ||
                controller.confirmPasswordController.text.isEmpty)
            ? SizedBox.shrink()
            : ElevatedButton(
              onPressed: () {
                // print(controller.currentPasswordController.text);
                // print(controller.newPasswordController.text);
                // print(controller.confirmPasswordController.text);
                controller.changePassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff20C6E6),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffA8EFF9)),
                  borderRadius: BorderRadius.circular(16.h),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
                textStyle: CustomTextStyles.bodySmallWhiteA700_1,
              ),
              child: Text('save', style: TextStyle(color: Colors.white)),
            ),
        SizedBox(width: 16.h),
      ],
    );
  }

  /// Section Widget
  Widget _buildColumntherespir() {
    return SizedBox(
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
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
            decoration: AppDecoration.errorC1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Text(
              "msg_due_on_oct_30".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmallWhiteA700,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
          ),
          SizedBox(height: 20.h),
          Text("lbl_question".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(height: 6.h),
          Text(
            "msg_in_your_own_words".tr,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall!.copyWith(height: 1.50),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumniconssmal() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: AppDecoration.grayC12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconsSmallAttachment,
                  height: 24.h,
                  width: 24.h,
                  alignment: Alignment.bottomCenter,
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 18.h,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    decoration: AppDecoration.grayC11.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 228.h,
                          child: Text(
                            "msg_the_respiratory2".tr,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumGray700.copyWith(
                              height: 1.50,
                            ),
                          ),
                        ),
                        CustomIconButton(
                          height: 24.h,
                          width: 24.h,
                          padding: EdgeInsets.all(4.h),
                          decoration: IconButtonStyleHelper.fillPrimary,
                          alignment: Alignment.centerRight,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgVector,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
    //  Get.back();
    Navigator.pop(context);
  }
}
