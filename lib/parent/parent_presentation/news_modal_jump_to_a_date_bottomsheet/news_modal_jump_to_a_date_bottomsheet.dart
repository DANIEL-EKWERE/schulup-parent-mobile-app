// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/news_modal_jump_to_a_date_controller.dart';
import 'models/listyear_item_model.dart';
import 'widgets/listyear_item_widget.dart';

// ignore_for_file: must_be_immutable
class NewsModalJumpToADateBottomsheet extends StatelessWidget {
  NewsModalJumpToADateBottomsheet(this.controller, {Key? key})
    : super(key: key);

  NewsModalJumpToADateController controller;

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
                  "lbl_jump_to_a_date".tr,
                  style: theme.textTheme.titleSmall,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 24.h,
                  margin: EdgeInsets.only(left: 96.h),
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 28.h),
            width: double.maxFinite,
            child: Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 30.h,
                  children: List.generate(
                    controller
                        .newsModalJumpToADateModelObj
                        .value
                        .listyearItemList
                        .value
                        .length,
                    (index) {
                      ListyearItemModel model =
                          controller
                              .newsModalJumpToADateModelObj
                              .value
                              .listyearItemList
                              .value[index];
                      return ListyearItemWidget(model);
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          _buildJumptodate(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildJumptodate() {
    return CustomElevatedButton(
      onPressed: () {
        Get.toNamed(AppRoutes.newsFilterResultScreen);
      },
      height: 64.h,
      text: "lbl_jump_to_date".tr,
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }

  /// Navigates to the previous screen.
  onTapImgCloseone() {
    Get.back();
  }
}
