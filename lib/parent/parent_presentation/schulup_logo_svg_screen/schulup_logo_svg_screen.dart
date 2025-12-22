// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_seven.dart';
import '../../widgets/app_bar/appbar_subtitle_six.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/schulup_logo_svg_controller.dart'; // ignore_for_file: must_be_immutable

class SchulupLogoSvgScreen extends GetWidget<SchulupLogoSvgController> {
  const SchulupLogoSvgScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF8D2A),
     // appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          //padding: EdgeInsets.only(left: 64.h, top: 26.h),
          child: Column(
            //spacing: 64,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //  SizedBox(width: 306.h, child: Divider(color: appTheme.gray200)),
              // Container(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 24.h,
              //     vertical: 106.h,
              //   ),
              //   decoration: AppDecoration.primaryC7Main.copyWith(
              //     borderRadius: BorderRadiusStyle.circleBorder150,
              //   ),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       // Text("lbl_schulup".tr, style: theme.textTheme.displayLarge),
              //       // Padding(
              //       //   padding: EdgeInsets.only(left: 14.h),
              //       //   child: Text(
              //       //     "msg_best_school_partner".tr,
              //       //     style: theme.textTheme.titleLarge,
              //       //   ),
              //       // ),
                    
              //     ],
              //   ),
              // ),
              // SizedBox(height: 36.h),

              Hero(
                tag: 'logo',
                child: CustomImageView(
                        imagePath: 'assets/images/img_schulup_icon.png',
                        height: 150,
                        width: 150,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      height: 60.h,
      leadingWidth: 120.h,
      leading: Container(
        width: 56.h,
        margin: EdgeInsets.only(left: 64.h, bottom: 3.h),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder28,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.h),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.grayC1.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  AppbarSubtitleSix(
                    text: "lbl_schulup".tr,
                    margin: EdgeInsets.only(left: 1.h, right: 2.h),
                  ),
                  SizedBox(height: 1.h),
                  AppbarSubtitleSeven(
                    text: "msg_best_school_partner".tr,
                    margin: EdgeInsets.only(left: 3.h, right: 6.h),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      title: AppbarSubtitle(
        text: "lbl_schulup_logo".tr,
        margin: EdgeInsets.only(left: 32.h),
      ),
      actions: [
        AppbarTitle(text: "lbl_svg".tr, margin: EdgeInsets.only(right: 110.h)),
      ],
    );
  }
}
