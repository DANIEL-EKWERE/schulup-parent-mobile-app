import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/academics_schular_ai_ongoing_controller.dart'; // ignore_for_file: must_be_immutable

class AcademicsSchularAiOngoingScreen
    extends GetWidget<AcademicsSchularAiOngoingController> {
  const AcademicsSchularAiOngoingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [_buildChatmessagelist()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 59.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgArrowLeftWhiteA700,
        margin: EdgeInsets.only(left: 25.h, top: 22.h, bottom: 8.h),
        onTap: () {
          onTapArrowleftone();
        },
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "lbl_schular_ai".tr),
          AppbarSubtitleFive(
            text: "lbl_ogechi".tr,
            margin: EdgeInsets.only(left: 25.h, right: 26.h),
          ),
        ],
      ),
      actions: [
        AppbarTrailingIconbutton(imagePath: ImageConstant.imgIconsSmallNewChat),
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgIconsSmallHistory,
          margin: EdgeInsets.only(left: 11.h, right: 25.h),
        ),
      ],
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildChatmessagelist() {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Chat(
          showUserNames: false,
          disableImageGallery: false,
          dateHeaderThreshold: 86400000,
          messages: controller.messageList.value,
          user: controller.chatUser.value,
          bubbleBuilder: (
            child, {
            required message,
            required nextMessageInGroup,
          }) {
            return message.author.id == controller.chatUser.value.id
                ? Container(
                  decoration: BoxDecoration(
                    color: appTheme.amber100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.h),
                      bottomLeft: Radius.circular(10.h),
                      bottomRight: Radius.circular(10.h),
                    ),
                  ),
                  child: child,
                )
                : Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.h),
                      bottomLeft: Radius.circular(10.h),
                      bottomRight: Radius.circular(10.h),
                    ),
                  ),
                  child: child,
                );
          },
          textMessageBuilder: (
            textMessage, {
            required messageWidth,
            required showName,
          }) {
            return textMessage.author.id == controller.chatUser.value.id
                ? Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 8.h, right: 10.h, bottom: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 230.h,
                        child: Text(
                          textMessage.text.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallGray700_1.copyWith(
                            color: appTheme.gray700,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                : SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 252.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 8.h,
                        ),
                        decoration: AppDecoration.accentC4.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              textMessage.text.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodySmallGray700_1
                                  .copyWith(
                                    color: appTheme.gray700,
                                    height: 1.50,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_schular_ai".tr,
                              style: CustomTextStyles.bodySmall10_1,
                            ),
                            TextSpan(
                              text: "msg_01_07pm_nov".tr,
                              style: CustomTextStyles.bodySmall10_1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                );
          },
          onSendPressed: (types.PartialText text) {},
          customBottomWidget: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
            decoration: AppDecoration.grayC12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
                        controller: controller.vectoroneController,
                        hintText: "msg_type_your_answer".tr,
                        hintStyle:
                            CustomTextStyles.bodyMediumSecondaryContainer,
                        textInputAction: TextInputAction.done,
                        suffix: Container(
                          padding: EdgeInsets.fromLTRB(6.h, 4.h, 4.h, 4.h),
                          margin: EdgeInsets.fromLTRB(16.h, 18.h, 24.h, 18.h),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(12.h),
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 12.h,
                            width: 12.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        suffixConstraints: BoxConstraints(maxHeight: 130.h),
                        maxLines: 5,
                        contentPadding: EdgeInsets.fromLTRB(
                          20.h,
                          14.h,
                          24.h,
                          14.h,
                        ),
                        borderDecoration: TextFormFieldStyleHelper.outlineGray,
                        fillColor: appTheme.whiteA700,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          customStatusBuilder: (message, {required context}) {
            return Container();
          },
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
