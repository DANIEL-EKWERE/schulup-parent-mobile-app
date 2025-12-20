import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:schulupparent/student/student_presentation/academics_schular_ai_ongoing_screen/controller/academics_schular_ai_ongoing_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_schular_ai_ongoing_screen/models/academics_schular_ai_ongoing_model.dart';
import '../../core/app_export.dart';
import 'controller/academics_schular_ai_conversation_controller.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart';

StudentAcademicsSchularAiOngoingController controller1 =
    Get.find<StudentAcademicsSchularAiOngoingController>();

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
          SizedBox(
            width: 52.h,
            child:
            //Divider(color: appTheme.gray20001)
            Container(
              width: 20,
              height: 5,
              decoration: BoxDecoration(
                color: appTheme.gray20001,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
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
      child:
          //  Obx(
          //   () =>
          controller1.chatData!.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    CustomImageView(imagePath: ImageConstant.imgObjects),
                  ],
                ),
              )
              : ListView.separated(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: controller1.chatData!.length,
                itemBuilder: (context, index) {
                  ChatData model = controller1.chatData![index];
                  return ListlineItemWidget(model);
                },
                //   ),
              ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgCloseone() {
    Get.back();
  }
}
