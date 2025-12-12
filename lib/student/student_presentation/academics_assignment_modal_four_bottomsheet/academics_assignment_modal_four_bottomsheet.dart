import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/academics_assignment_modal_four_controller.dart';

// ignore_for_file: must_be_immutable
class AcademicsAssignmentModalFourBottomsheet extends StatelessWidget {
  AcademicsAssignmentModalFourBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsAssignmentModalFourController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.grayC13.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL14,
      ),
      child: Column(
        spacing: 22,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 52.h, child: Divider(color: appTheme.gray20001)),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 128.h),
                  child: Text(
                    "lbl_upload_a_file".tr,
                    style: theme.textTheme.titleSmall,
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
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 64.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomIconButton(
                      height: 70.h,
                      width: 70.h,
                      padding: EdgeInsets.all(14.h),
                      decoration: IconButtonStyleHelper.fillYellow,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconsMediumPhoto,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      "lbl_photos".tr,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                    Text(
                      "msg_jpg_jpeg_png".tr,
                      style: CustomTextStyles.bodySmallSecondaryContainer10,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomIconButton(
                      height: 70.h,
                      width: 70.h,
                      padding: EdgeInsets.all(14.h),
                      decoration: IconButtonStyleHelper.fillYellow,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconsMediumDocument,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      "lbl_document".tr,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                    Text(
                      "msg_pdf_docx_xls".tr,
                      style: CustomTextStyles.bodySmallSecondaryContainer10,
                    ),
                  ],
                ),
              ],
            ),
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
