import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/base64.dart';
import 'package:schulupparent/presentation/direct_chat/controller/direct_chat_controller.dart';
import 'package:schulupparent/presentation/direct_chat/models/models.dart';
import 'package:schulupparent/presentation/direct_chat/models/ongoing_conversation_model.dart';
import 'package:schulupparent/presentation/direct_chat/widget/teacher_shimmer_widget.dart';
import 'package:schulupparent/widgets/custom_text_form_field.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

class DirectChatScreen extends GetWidget<DirectChatController> {
  const DirectChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppbar(),
        body: Column(
          children: [
            /// --- TAB BAR ---
            Container(
              color: appTheme.whiteA700,
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: Color(0xFFFF8D2A),
                labelColor: Color(0xFFFF8D2A),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Class Teachers"),
                  Tab(text: "Ongiong Conversations"),
                ],
              ),
            ),

            /// --- TAB CONTENT ---
            Expanded(
              child: TabBarView(
                children: [
                  /// ---------------- TAB 1 CONTENT (Your existing UI) ----------------
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        top: 20.h,
                        right: 24.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Select a member of the school to chat with them directly',
                            style: CustomTextStyles.bodyMediumGray700.copyWith(
                              fontSize: 12.h,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  separatorBuilder:
                                      (context, index) =>
                                          SizedBox(height: 12.h),
                                  itemBuilder: (context, index) {
                                    return TeacherShimmerWidget();
                                  },
                                );
                              } else {
                                return ListView.separated(
                                  itemCount:
                                      controller.teacherData?.length ?? 0,
                                  separatorBuilder:
                                      (context, index) =>
                                          SizedBox(height: 12.h),
                                  itemBuilder: (context, index) {
                                    TeacherData teacherData =
                                        controller.teacherData![index];
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Start New Conversation',
                                                style:
                                                    CustomTextStyles
                                                        .titleMediumOnPrimary,
                                              ),
                                              content: SizedBox(
                                                height: 40,
                                                child: Column(
                                                  children: [
                                                    CustomTextFormField(
                                                      controller:
                                                          controller
                                                              .subjectController,
                                                      fillColor:
                                                          appTheme.gray20001,
                                                      hintText:
                                                          'Enter Convsersation subject',
                                                      hintStyle:
                                                          CustomTextStyles
                                                              .bodyMediumGray700,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    controller
                                                        .startConversation(
                                                          teacherData
                                                              .teacherUserId
                                                              .toString(),
                                                        );
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: _buildTeacherCard(teacherData),
                                    );
                                  },
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// ---------------- TAB 2 CONTENT (EMPTY) ----------------
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24.h,
                        top: 20.h,
                        right: 24.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Select an ongoing conversation to continue from where you left!!!',
                            style: CustomTextStyles.bodyMediumGray700.copyWith(
                              fontSize: 12.h,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  separatorBuilder:
                                      (context, index) =>
                                          SizedBox(height: 12.h),
                                  itemBuilder: (context, index) {
                                    return TeacherShimmerWidget();
                                  },
                                );
                              } else {
                                return ListView.separated(
                                  itemCount: controller.conversations!.length,
                                  separatorBuilder:
                                      (context, index) =>
                                          SizedBox(height: 12.h),
                                  itemBuilder: (context, index) {
                                    Conversations conversation =
                                        controller.conversations![index];
                                    return _buildTeacherCard1(conversation);
                                  },
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Teacher Card Widget
  Widget _buildTeacherCard(TeacherData teacherData) {
    return Container(
      padding: EdgeInsets.all(12.h),
      height: 90.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFFEED4)),
        color: Color(0xFFFFF7ED),
        borderRadius: BorderRadiusStyle.circleBorder12,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Base64Image(
              base64String: teacherData.profilePicBase64,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              placeholder: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFFF8D2A).withOpacity(0.2),
                child: Text(
                  teacherData.initials,
                  style: TextStyle(
                    color: Color(0xFFFF8D2A),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: Text(
              teacherData.teacherName ?? 'Unknown',
              style: CustomTextStyles.bodySmallGray700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// ongoing conversation Card Widget
  Widget _buildTeacherCard1(Conversations conversation) {
    return Container(
      padding: EdgeInsets.all(12.h),
      height: 90.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFFEED4)),
        color: Color(0xFFFFF7ED),
        borderRadius: BorderRadiusStyle.circleBorder12,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            // child: Base64Image(
            //   base64String: conversation.,
            //   width: 50,
            //   height: 50,
            //   fit: BoxFit.cover,
            //   placeholder: CircleAvatar(
            //     radius: 20,
            //     backgroundColor: Color(0xFFFF8D2A).withOpacity(0.2),
            //     child: Text(
            //       teacherData.initials,
            //       style: TextStyle(
            //         color: Color(0xFFFF8D2A),
            //         fontWeight: FontWeight.bold,
            //         fontSize: 14,
            //       ),
            //     ),
            //   ),
            // ),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: Text(
              conversation.subject!,
              style: CustomTextStyles.bodySmallGray700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// App Bar
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 75.h,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEF5A07),
            border: Border.all(color: Color(0xFFFFBC71)),
          ),
          child: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            onTap: () {
              _onBackPressed();
            },
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "Direct Chat"),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  void _onBackPressed() {
    Navigator.pop(Get.context!);
  }
}
