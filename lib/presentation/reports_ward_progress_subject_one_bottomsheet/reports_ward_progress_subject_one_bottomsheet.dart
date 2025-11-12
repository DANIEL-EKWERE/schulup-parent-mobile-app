import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/reports_ward_progress_subject_one_controller.dart';

// ignore_for_file: must_be_immutable
class ReportsWardProgressSubjectOneBottomsheet extends StatelessWidget {
  ReportsWardProgressSubjectOneBottomsheet(this.controller, {Key? key})
    : super(key: key);

  ReportsWardProgressSubjectOneController controller;

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "msg_select_a_subject".tr,
                  style: theme.textTheme.titleSmall,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 24.h,
                  margin: EdgeInsets.only(left: 92.h),
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          Text(
            "lbl_civic_education".tr,
            style: CustomTextStyles.bodyMediumOnPrimary,
          ),
          SizedBox(height: 10.h),
          CustomElevatedButton(
            text: "msg_christian_religious2".tr,
            margin: EdgeInsets.only(left: 20.h, right: 22.h),
          ),
          SizedBox(height: 10.h),
          Text(
            "lbl_basic_science".tr,
            style: CustomTextStyles.bodyMediumOnPrimary,
          ),
          SizedBox(height: 30.h),
          CustomElevatedButton(
            height: 64.h,
            text: "lbl_go_to_subject".tr,
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
