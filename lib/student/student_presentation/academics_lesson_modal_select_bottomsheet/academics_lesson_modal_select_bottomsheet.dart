import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/academics_lesson_modal_select_controller.dart';

// ignore_for_file: must_be_immutable
class AcademicsLessonModalSelectBottomsheet extends StatelessWidget {
  AcademicsLessonModalSelectBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsLessonModalSelectController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.grayC13.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 52.h, child: Divider(color: appTheme.gray20001)),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 124.h),
                    child: Text(
                      "lbl_select_a_class".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 26.h,
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          CustomElevatedButton(
            text: "lbl_primary_5".tr,
            margin: EdgeInsets.only(left: 62.h, right: 60.h),
          ),
          SizedBox(height: 10.h),
          Text("lbl_primary_4".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(height: 12.h),
          Text("lbl_primary_3".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(height: 30.h),
          CustomElevatedButton(
            height: 64.h,
            text: "lbl_confirm".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: theme.textTheme.titleMedium!,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgCloseone() {
    Get.back();
  }
}
