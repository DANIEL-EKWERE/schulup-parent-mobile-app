import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/academics_schular_ai_conversation_controller.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class AcademicsSchularAiConversationBottomsheet extends StatelessWidget {
  AcademicsSchularAiConversationBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsSchularAiConversationController controller;

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
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 52.h, child: Divider(color: appTheme.gray20001)),
          _buildRowhistory(),
          _buildListline(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowhistory() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 146.h),
            child: Text("lbl_history".tr, style: theme.textTheme.titleSmall),
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
    );
  }

  /// Section Widget
  Widget _buildListline() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemCount:
              controller
                  .academicsSchularAiConversationModelObj
                  .value
                  .listlineItemList
                  .value
                  .length,
          itemBuilder: (context, index) {
            ListlineItemModel model =
                controller
                    .academicsSchularAiConversationModelObj
                    .value
                    .listlineItemList
                    .value[index];
            return ListlineItemWidget(model);
          },
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgCloseone() {
    Get.back();
  }
}
