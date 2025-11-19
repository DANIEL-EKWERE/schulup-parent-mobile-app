// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';
import 'package:schulupparent/widgets/custom_text_form_field.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

class DashboardEditWardProfileScreen
    extends GetWidget<DashboardEditWardProfileController> {
  const DashboardEditWardProfileScreen({Key? key}) : super(key: key);

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
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //  _buildColumntherespir()
                    SizedBox(height: 30),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/images/ward_image.png',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CustomImageView(
                            imagePath: 'assets/images/img_take_photo.svg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Last Name',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Last Name",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'First Name',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "First Name",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Middle Name',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Middle Name",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Gender',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Gender",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgChevronDown,
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

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Date Of Birth',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Date Of Birth",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgEvents,
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

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Blood Group',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Blood Group",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Genotype',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Genotype",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Place Of Birth',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Place Of Birth",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'State',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "State",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Address',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Address",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),

                    SizedBox(height: 30),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        'Religion',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      //  controller: controller.passwordController,
                      hintText: "Religion",
                      hintStyle: CustomTextStyles.labelLargeBluegray700,
                      // prefix: Container(
                      //   margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgPassword,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgVisibility,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.gray100,
                    ),
                    SizedBox(height: 30),
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
          AppbarSubtitleOne(text: "lbl_assignment".tr),
          AppbarSubtitleFive(
            text: "lbl_ogechi".tr,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
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
    Get.back();
  }
}
