import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/academics_schular_ai_conversation_one_controller.dart';

// ignore_for_file: must_be_immutable
class AcademicsSchularAiConversationOneBottomsheet extends StatelessWidget {
  AcademicsSchularAiConversationOneBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsSchularAiConversationOneController controller;

  @override
  Widget build(BuildContext context) {
    return _buildColumn();
  }

  /// Section Widget
  Widget _buildColumn() {
    return SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(width: 52.h, child: Divider(color: appTheme.gray20001)),
              SizedBox(height: 18.h),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 146.h),
                      child: Text(
                        "lbl_history".tr,
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
              SizedBox(height: 202.h),
              CustomImageView(
                imagePath: ImageConstant.imgGroup,
                height: 80.h,
                width: 104.h,
              ),
              SizedBox(height: 24.h),
              Text(
                "msg_no_conversations".tr,
                style: CustomTextStyles.bodyMediumSecondaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgCloseone() {
    Get.back();
  }
}
