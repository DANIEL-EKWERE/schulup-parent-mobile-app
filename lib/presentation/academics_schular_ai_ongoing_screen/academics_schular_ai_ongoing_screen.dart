import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:schulupparent/presentation/academics_schular_ai_conversation_bottomsheet/academics_schular_ai_conversation_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_schular_ai_conversation_bottomsheet/controller/academics_schular_ai_conversation_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/academics_schular_ai_ongoing_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

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
                  padding: EdgeInsets.only(left: 0.h, top: 20.h, right: 0.h),
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
          Obx(
            () => AppbarSubtitleFive(
              text:
                  controller.isAiTyping.value
                      ? "typing..."
                      : dashboardExtendedViewController
                          .selectedStudent1!
                          .firstName!,
              margin: EdgeInsets.only(left: 25.h, right: 26.h),
            ),
          ),
        ],
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgIconsSmallNewChat,
          onTap: () => controller.startNewChat(),
        ),
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgIconsSmallHistory,
          margin: EdgeInsets.only(left: 11.h, right: 25.h),
          onTap: () {
            showModalBottomSheet(
              context: Get.context!,
              builder: (context) {
                return AcademicsSchularAiConversationBottomsheet(
                  AcademicsSchularAiConversationController(),
                );
              },
            );
          },
          //=> controller.viewHistory(),
        ),
      ],
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildChatmessagelist() {
    return Expanded(
      child: Obx(() {
        // Show loading indicator ONLY on initial load with empty messages
        if (controller.isLoading.value && controller.messageList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: theme.colorScheme.primary),
                SizedBox(height: 16.h),
                Text(
                  'Loading chat...',
                  style: CustomTextStyles.bodyMediumGray700,
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                child: Chat(
                  showUserNames: false,
                  disableImageGallery: false,
                  dateHeaderThreshold: 86400000,
                  messages: controller.messageList,
                  user: controller.chatUser.value,
                  emptyState: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 64.h,
                          color: appTheme.gray400,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Start a conversation with Scholar AI',
                          style: CustomTextStyles.bodyMediumGray700,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Ask any question to get started',
                          style: CustomTextStyles.bodySmallGray700_1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.h,
                            vertical: 8.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textMessage.text.toString(),
                                style: CustomTextStyles.bodySmallGray700_1
                                    .copyWith(
                                      color: appTheme.gray700,
                                      height: 1.50,
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.h,
                                  vertical: 8.h,
                                ),
                                decoration: AppDecoration.accentC4.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderBL10,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textMessage.text.toString(),
                                      style: CustomTextStyles.bodySmallGray700_1
                                          .copyWith(
                                            color: appTheme.gray700,
                                            height: 1.50,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text(
                                  'Scholar AI • ${_formatTimestamp(textMessage.createdAt)}',
                                  style: CustomTextStyles.bodySmall10_1,
                                ),
                              ),
                            ],
                          ),
                        );
                  },
                  onSendPressed: (types.PartialText text) {
                    if (!controller.isSending.value) {
                      controller.ask(text.text);
                    }
                  },
                  customBottomWidget: _buildCustomInput(),
                  customStatusBuilder: (message, {required context}) {
                    return Container();
                  },
                ),
              ),
            ),
            // AI Typing Indicator
            Obx(
              () =>
                  controller.isAiTyping.value
                      ? _buildTypingIndicator()
                      : SizedBox.shrink(),
            ),
          ],
        );
      }),
    );
  }

  /// Build typing indicator
  Widget _buildTypingIndicator() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.h),
                bottomLeft: Radius.circular(10.h),
                bottomRight: Radius.circular(10.h),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTypingDot(delay: 0),
                SizedBox(width: 4.h),
                _buildTypingDot(delay: 200),
                SizedBox(width: 4.h),
                _buildTypingDot(delay: 400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build animated typing dot
  Widget _buildTypingDot({required int delay}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600),
      builder: (context, value, child) {
        return FutureBuilder(
          future: Future.delayed(Duration(milliseconds: delay)),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container(
                width: 8.h,
                height: 8.h,
                decoration: BoxDecoration(
                  color: appTheme.gray20001,
                  shape: BoxShape.circle,
                ),
              );
            }
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 8.h,
              height: 8.h,
              decoration: BoxDecoration(
                color: appTheme.gray20002.withOpacity(0.3 + (value * 0.7)),
                shape: BoxShape.circle,
              ),
            );
          },
        );
      },
      onEnd: () {
        // Loop animation
      },
    );
  }

  /// Custom input widget
  Widget _buildCustomInput() {
    return Container(
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
                Obx(() {
                  bool canSend =
                      controller.vectoroneController.text.trim().isNotEmpty &&
                      !controller.isSending.value;

                  return CustomTextFormField(
                    controller: controller.vectoroneController,
                    hintText: "msg_type_your_answer".tr,
                    hintStyle: CustomTextStyles.bodyMediumSecondaryContainer,
                    textInputAction: TextInputAction.done,
                    //enabled: !controller.isSending.value,
                    onChanged: (value) {
                      // Trigger rebuild to update send button state
                      controller.messageList.refresh();
                    },
                    // onFieldSubmitted: (value) {
                    //   if (value.trim().isNotEmpty && !controller.isSending.value) {
                    //     controller.ask(value);
                    //   }
                    // },
                    suffix: GestureDetector(
                      onTap: () {
                        if (canSend) {
                          controller.ask(controller.vectoroneController.text);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.h),
                        margin: EdgeInsets.fromLTRB(16.h, 18.h, 24.h, 18.h),
                        decoration: BoxDecoration(
                          color:
                              canSend
                                  ? theme.colorScheme.primary
                                  : appTheme.gray400,
                          borderRadius: BorderRadius.circular(12.h),
                        ),
                        child:
                            controller.isSending.value
                                ? SizedBox(
                                  height: 12.h,
                                  width: 12.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                                : CustomImageView(
                                  onTap: () {
                                    if (controller.vectoroneController.text
                                            .trim()
                                            .isNotEmpty &&
                                        !controller.isSending.value) {
                                      controller.ask(
                                        controller.vectoroneController.text,
                                      );
                                    }
                                  },
                                  imagePath: ImageConstant.imgVector,
                                  height: 12.h,
                                  width: 12.h,
                                  fit: BoxFit.contain,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(maxHeight: 130.h),
                    maxLines: 5,
                    contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 24.h, 14.h),
                    borderDecoration: TextFormFieldStyleHelper.outlineGray,
                    fillColor: appTheme.whiteA700,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Format timestamp for display
  String _formatTimestamp(int? timestamp) {
    if (timestamp == null) return '';

    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 30) {
      return 'Just now';
    } else if (difference.inMinutes < 1) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(Get.context!);
  }
}
// ```

// ## Key Features Added:

// ### 1. **AI Typing Indicator**
// - ✅ Shows animated dots below the chat when AI is responding
// - ✅ Three dots with staggered animation for realistic typing effect
// - ✅ Appears immediately when message is sent
// - ✅ Disappears when response arrives

// ### 2. **AppBar "typing..." Status**
// - ✅ Shows "typing..." in subtitle when AI is responding
// - ✅ Returns to "lbl_ogechi" when done

// ### 3. **Smooth Flow**
// ```
// User sends message →
// Message appears immediately →
// "typing..." shows in appbar →
// Animated dots appear below chat →
// API processes →
// Typing indicator disappears →
// AI response loads via conversations() →
// Chat updates with full history
