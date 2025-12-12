// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/academics_assignment_the_child_controller.dart'; // ignore_for_file: must_be_immutable
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

class AcademicsAssignmentTheChildScreen
    extends GetWidget<AcademicsAssignmentTheChildController> {
  const AcademicsAssignmentTheChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 658.h,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 24.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 16.h,
                        ),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Column(
                          spacing: 20,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "lbl_your_submission".tr,
                                    style:
                                        CustomTextStyles.labelLargeBluegray700,
                                  ),
                                  Text(
                                    "lbl_submitted".tr,
                                    style:
                                        CustomTextStyles
                                            .bodySmallSecondaryContainer,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
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
                                    return message.author.id ==
                                            controller.chatUser.value.id
                                        ? Container(
                                          decoration: BoxDecoration(
                                            color: appTheme.amber100,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.h),
                                              bottomLeft: Radius.circular(10.h),
                                              bottomRight: Radius.circular(
                                                10.h,
                                              ),
                                            ),
                                          ),
                                          child: child,
                                        )
                                        : Container(
                                          decoration: BoxDecoration(
                                            color:
                                                theme
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.h),
                                              bottomLeft: Radius.circular(10.h),
                                              bottomRight: Radius.circular(
                                                10.h,
                                              ),
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
                                    return textMessage.author.id ==
                                            controller.chatUser.value.id
                                        ? Container(
                                          width: double.maxFinite,
                                          padding: EdgeInsets.only(
                                            top: 8.h,
                                            right: 14.h,
                                            bottom: 8.h,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 176.h,
                                                child: Text(
                                                  textMessage.text.toString(),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: CustomTextStyles
                                                      .bodySmallOnPrimary
                                                      .copyWith(
                                                        color:
                                                            theme
                                                                .colorScheme
                                                                .onPrimary,
                                                        height: 1.40,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 202.h,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h,
                                                  vertical: 8.h,
                                                ),
                                                decoration: AppDecoration
                                                    .accentC4
                                                    .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .customBorderBL10,
                                                    ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "msg_well_done_ogechi".tr,
                                                      maxLines: 8,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .bodySmallGray700
                                                          .copyWith(
                                                            height: 1.40,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "msg_mr_kayode_08_55pm"
                                                              .tr,
                                                      style:
                                                          CustomTextStyles
                                                              .bodySmall10_1,
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "lbl_nov_10_2025".tr,
                                                      style:
                                                          CustomTextStyles
                                                              .bodySmall10_1,
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24.h,
                                      vertical: 10.h,
                                    ),
                                    decoration: AppDecoration.grayC12,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextFormField(
                                          controller:
                                              controller.vectoroneController,
                                          hintText: "msg_type_your_reply".tr,
                                          hintStyle:
                                              CustomTextStyles
                                                  .bodyMediumSecondaryContainer,
                                          textInputAction: TextInputAction.done,
                                          suffix: Container(
                                            padding: EdgeInsets.fromLTRB(
                                              6.h,
                                              4.h,
                                              4.h,
                                              4.h,
                                            ),
                                            margin: EdgeInsets.fromLTRB(
                                              16.h,
                                              18.h,
                                              24.h,
                                              18.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme.primary,
                                              borderRadius:
                                                  BorderRadius.circular(12.h),
                                            ),
                                            child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgVector,
                                              height: 12.h,
                                              width: 12.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          suffixConstraints: BoxConstraints(
                                            maxHeight: 130.h,
                                          ),
                                          maxLines: 5,
                                          contentPadding: EdgeInsets.fromLTRB(
                                            20.h,
                                            14.h,
                                            24.h,
                                            14.h,
                                          ),
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .outlineGray,
                                          fillColor: appTheme.whiteA700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  customStatusBuilder: (
                                    message, {
                                    required context,
                                  }) {
                                    return Container();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                      _buildAppbar(),
                    ],
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
          AppbarSubtitleOne(text: "lbl_assignment".tr),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
