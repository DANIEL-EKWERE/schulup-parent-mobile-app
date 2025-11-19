import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schulupparent/core/utils/image_constant.dart';
import 'package:schulupparent/core/utils/size_utils.dart';
import 'package:schulupparent/presentation/signin_screen/controller/signin_controller.dart';
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
      child: Scaffold(
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
                    Text(
                      'Please sign into your account',
                      style: CustomTextStyles.titleSmallWhiteA700,
                    ),
                    SizedBox(height: 30),
                    CustomTextFormField(
                      controller: controller.usernameController,
                      hintText: "Username",
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
                      controller: controller.passwordController,
                      hintText: "Passowrd",
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
                    Spacer(),
                    CustomElevatedButton(
                      onPressed:
                          () => Get.offAllNamed(
                            AppRoutes.academicsAssignmentStatusScreen,
                          ),
                      height: 64.h,
                      text: "Sign In",
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: theme.textTheme.titleMedium!,
                    ),
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
