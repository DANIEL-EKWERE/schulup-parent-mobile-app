import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schulupparent/core/utils/image_constant.dart';
import 'package:schulupparent/core/utils/size_utils.dart';
import 'package:schulupparent/presentation/signin_screen/controller/signin_controller.dart';
import 'package:schulupparent/presentation/signin_screen/test_screen.dart';
import 'package:schulupparent/routes/app_routes.dart';
import 'package:schulupparent/theme/custom_button_style.dart';
import 'package:schulupparent/theme/custom_text_style.dart';
import 'package:schulupparent/theme/theme_helper.dart';
import 'package:schulupparent/widgets/custom_elevated_button.dart';
import 'package:schulupparent/widgets/custom_image_view.dart';
import 'package:schulupparent/widgets/custom_text_form_field.dart';

SigninController controller = Get.put(SigninController());

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //  appBar: Cus
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [
                Color(0xffFF8D2A),
                Color(0xffFF8D2A),
                Color(0xffFF8D2A).withValues(alpha: 0.5),
                Color(0xffffffff),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    CustomImageView(
                      imagePath: 'assets/images/img_schulup_icon.png',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 30),
                    // Text(
                    //   'Please sign into your account',
                    //   style: CustomTextStyles.titleSmallWhiteA700,
                    // ),
                    //SizedBox(height: 30),
                    Obx(
                      () =>
                          controller.errorMessage.value != ''
                              ? Row(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.h),
                                    height: 40.h,
                                    width: 40.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffFFBC71),
                                        width: 1,
                                      ),
                                      color: appTheme.red500.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CustomImageView(
                                      imagePath:
                                          'assets/images/img_icons_small_caution.png',
                                      height: 16.h,
                                      width: 16.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    controller.errorMessage.value,
                                    style: CustomTextStyles.titleSmallWhiteA700,
                                  ),
                                ],
                              )
                              : Text(
                                'Please sign into your account',
                                style: CustomTextStyles.titleSmallWhiteA700,
                              ),
                    ),
                    SizedBox(height: 30),
                    CustomTextFormField(
                      textInputType: TextInputType.text,
                      controller: controller.usernameController,
                      hintText: "Username",
                      hintStyle: CustomTextStyles.bodyMediumGray700,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgUsername,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(maxHeight: 44.h),
                      // suffix: Container(
                      //   margin: EdgeInsets.fromLTRB(16.h, 14.h, 14.h, 14.h),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgIconsTinyDownload,
                      //     height: 16.h,
                      //     width: 16.h,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      suffixConstraints: BoxConstraints(maxHeight: 44.h),
                      contentPadding: EdgeInsets.all(14.h),
                      borderDecoration: TextFormFieldStyleHelper.outlineGray,
                      fillColor: appTheme.whiteA700,
                    ),

                    SizedBox(height: 30),
                    CustomTextFormField(
                      textInputType: TextInputType.visiblePassword,
                      controller: controller.passwordController,
                      hintText: "Passowrd",
                      hintStyle: CustomTextStyles.bodyMediumGray700,
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
                      fillColor: appTheme.whiteA700,
                    ),
                    SizedBox(height: 30),
                    CustomTextFormField(
                      textInputType: TextInputType.text,
                      controller: controller.schoolCodeController,
                      hintText: "School Code",
                      hintStyle: CustomTextStyles.bodyMediumGray700,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(14.h, 14.h, 4.h, 14.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroup,
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
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
                      fillColor: appTheme.whiteA700,
                    ),
                    Spacer(),
                    CustomElevatedButton(
                      onPressed: () => controller.firstLogin(),
                      // Get.offAllNamed(
                      //   AppRoutes.academicsAssignmentStatusScreen,
                      // )
                      height: 64.h,
                      text: "Sign In",
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: theme.textTheme.titleMedium!,
                    ),

                    // CustomElevatedButton(
                    //   onPressed: () => Get.to(() => const TestScreen()),
                    //   height: 64.h,
                    //   text: "Test Screen",
                    //   buttonStyle: CustomButtonStyles.fillPrimary,
                    //   buttonTextStyle: theme.textTheme.titleMedium!,
                    // ),
                    //TestScreen
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
