// // TODO Implement this library.
// import 'package:flutter/material.dart';
// import 'package:schulupparent/presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';
// import 'package:schulupparent/presentation/dashboard_extended_view/base64.dart';
// import 'package:schulupparent/presentation/direct_chat/controller/direct_chat_controller.dart';
// import 'package:schulupparent/presentation/direct_chat/models/models.dart';
// import 'package:schulupparent/presentation/direct_chat/widget/teacher_shimmer_widget.dart';
// import 'package:schulupparent/widgets/custom_text_form_field.dart';
// import '../../core/app_export.dart';
// import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
// import '../../widgets/app_bar/appbar_subtitle_five.dart';
// import '../../widgets/app_bar/appbar_subtitle_one.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_icon_button.dart';

// class DirectChatScreen extends GetWidget<DirectChatController> {
//   const DirectChatScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appTheme.whiteA700,
//       appBar: _buildAppbar(),
//       body: SafeArea(
//         top: false,
//         child: SizedBox(
//           width: double.maxFinite,
//           child: ListView(
//             //  mainAxisSize: MainAxisSize.max,
//             children: [
//               Container(
//                 // height: 1000.h,
//                 width: double.maxFinite,
//                 padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
//                 child: Expanded(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       //  _buildColumntherespir()
//                       //SizedBox(height: 5),
//                       Text(
//                         'Select a member of the school to chat with them directly',
//                         style: CustomTextStyles.bodyMediumGray700.copyWith(
//                           fontSize: 12.h,
//                         ),
//                       ),
//                       SizedBox(height: 20.h),

//                       Obx(() {
//                         if (controller.isLoading.value) {
//                           return ListView.separated(
//                             shrinkWrap: true,
//                             itemCount: 5,
//                             //isLoading ? 5 : newsItems.length,
//                             separatorBuilder:
//                                 (context, index) => SizedBox(height: 12.h),
//                             itemBuilder: (context, index) {
//                               // if (isLoading) {
//                               return TeacherShimmerWidget();
//                             },
//                           );
//                         } else {
//                           return SizedBox(
//                             height: 900.h,
//                             child: ListView.separated(
//                               shrinkWrap: true,
//                               itemCount: controller.teacherData?.length ?? 0,
//                               //isLoading ? 5 : newsItems.length,
//                               separatorBuilder:
//                                   (context, index) => SizedBox(height: 12.h),
//                               itemBuilder: (context, index) {
//                                 TeacherData teacherData =
//                                     controller.teacherData![index];
//                                 // if (isLoading) {
//                                 return Container(
//                                   padding: EdgeInsets.all(12),
//                                   height: 90.h,
//                                   width: double.maxFinite,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: Color(0xffffeed4),
//                                     ),
//                                     // color: Color(0xffffeed4),
//                                     color: Color(0xffFFF7ED),
//                                     //color: Color(0xffffeed4),
//                                     borderRadius:
//                                         BorderRadiusStyle.circleBorder12,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(25),
//                                         child: Base64Image(
//                                           base64String:
//                                               teacherData.profilePicBase64,
//                                           width: 30,
//                                           height: 30,
//                                           fit: BoxFit.cover,
//                                           placeholder: CircleAvatar(
//                                             backgroundColor: Color(
//                                               0xFFFF8D2A,
//                                             ).withOpacity(0.2),
//                                             child: Text(
//                                               teacherData.teacherName?[0]
//                                                       .toUpperCase() ??
//                                                   '?',
//                                               style: TextStyle(
//                                                 color: Color(0xFFFF8D2A),
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(width: 10),
//                                       Text(
//                                         teacherData.teacherName ?? 'Unknown',
//                                         style:
//                                             CustomTextStyles
//                                                 .titleMediumOnPrimary,
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                                 // }
//                                 // return ListlineItemWidget(newsItems[index]);
//                               },
//                             ),
//                           );
//                         }
//                       }),

//                       SizedBox(height: 30),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppbar() {
//     return CustomAppBar(
//       leadingWidth: 75.h,
//       leading: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Container(
//           height: 10,
//           width: 10,
//           //margin: EdgeInsets.only(left: 25.h),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xffEF5A07),
//             border: Border.all(color: Color(0xffFFBC71)),
//           ),
//           child: AppbarLeadingIconbutton(
//             imagePath: ImageConstant.imgArrowLeftWhiteA700,
//             //margin: EdgeInsets.only(left: 25.h),
//             onTap: () {
//               onTapArrowleftone();
//             },
//           ),
//         ),
//       ),
//       centerTitle: true,
//       title: Column(
//         children: [
//           AppbarSubtitleOne(text: "Direct Chat"),
//           AppbarSubtitleFive(
//             text: "lbl_ogechi".tr,
//             margin: EdgeInsets.symmetric(horizontal: 33.h),
//           ),
//         ],
//       ),
//       styleType: Style.bgFillPrimary,
//     );
//   }

//   /// Section Widget
//   Widget _buildColumntherespir() {
//     return SizedBox(
//       width: double.maxFinite,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "msg_the_respiratory".tr,
//             style: CustomTextStyles.titleMediumOnPrimary,
//           ),
//           SizedBox(height: 18.h),
//           SizedBox(
//             width: double.maxFinite,
//             child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
//           ),
//           SizedBox(height: 18.h),
//           SizedBox(
//             width: double.maxFinite,
//             child: _buildRowpostedon(
//               postedonOne: "lbl_subject".tr,
//               oct272025One: "lbl_basic_science".tr,
//             ),
//           ),
//           SizedBox(height: 8.h),
//           SizedBox(
//             width: double.maxFinite,
//             child: _buildRowpostedon(
//               postedonOne: "lbl_posted_on".tr,
//               oct272025One: "lbl_oct_27_2025".tr,
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
//             decoration: AppDecoration.errorC1.copyWith(
//               borderRadius: BorderRadiusStyle.roundedBorder8,
//             ),
//             child: Text(
//               "msg_due_on_oct_30".tr,
//               textAlign: TextAlign.center,
//               style: CustomTextStyles.bodySmallWhiteA700,
//             ),
//           ),
//           SizedBox(height: 20.h),
//           SizedBox(
//             width: double.maxFinite,
//             child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
//           ),
//           SizedBox(height: 20.h),
//           Text("lbl_question".tr, style: CustomTextStyles.bodyMediumOnPrimary),
//           SizedBox(height: 6.h),
//           Text(
//             "msg_in_your_own_words".tr,
//             maxLines: 10,
//             overflow: TextOverflow.ellipsis,
//             style: theme.textTheme.bodySmall!.copyWith(height: 1.50),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildColumniconssmal() {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
//       decoration: AppDecoration.grayC12,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             width: double.maxFinite,
//             child: Row(
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgIconsSmallAttachment,
//                   height: 24.h,
//                   width: 24.h,
//                   alignment: Alignment.bottomCenter,
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: double.maxFinite,
//                     padding: EdgeInsets.only(
//                       left: 18.h,
//                       top: 12.h,
//                       bottom: 12.h,
//                     ),
//                     decoration: AppDecoration.grayC11.copyWith(
//                       borderRadius: BorderRadiusStyle.circleBorder12,
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 228.h,
//                           child: Text(
//                             "msg_the_respiratory2".tr,
//                             maxLines: 4,
//                             overflow: TextOverflow.ellipsis,
//                             style: CustomTextStyles.bodyMediumGray700.copyWith(
//                               height: 1.50,
//                             ),
//                           ),
//                         ),
//                         CustomIconButton(
//                           height: 24.h,
//                           width: 24.h,
//                           padding: EdgeInsets.all(4.h),
//                           decoration: IconButtonStyleHelper.fillPrimary,
//                           alignment: Alignment.centerRight,
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgVector,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Common widget
//   Widget _buildRowpostedon({
//     required String postedonOne,
//     required String oct272025One,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           postedonOne,
//           style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
//         ),
//         Text(
//           oct272025One,
//           style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
//         ),
//       ],
//     );
//   }

//   /// Navigates to the previous screen.
//   onTapArrowleftone() {
//     //Get.back();
//     controller.getTeachers();
//   }
// }

import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/base64.dart';
import 'package:schulupparent/presentation/direct_chat/controller/direct_chat_controller.dart';
import 'package:schulupparent/presentation/direct_chat/models/models.dart';
import 'package:schulupparent/presentation/direct_chat/widget/teacher_shimmer_widget.dart';
import 'package:schulupparent/widgets/custom_text_form_field.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

class DirectChatScreen extends GetWidget<DirectChatController> {
  const DirectChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
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
                          (context, index) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        return TeacherShimmerWidget();
                      },
                    );
                  } else {
                    return ListView.separated(
                      itemCount: controller.teacherData?.length ?? 0,
                      separatorBuilder:
                          (context, index) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        TeacherData teacherData =
                            controller.teacherData![index];
                        return _buildTeacherCard(teacherData);
                      },
                    );
                  }
                }),
              ),
            ],
          ),
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
          // Icon(Icons.chevron_right, color: Color(0xFFFF8D2A)),
        ],
      ),
    );
  }

  /// Section Widget
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
              onTapArrowleftone();
            },
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "Direct Chat"),
          AppbarSubtitleFive(
            text: "lbl_ogechi".tr,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(Get.context!);
    // controller.getTeachers();
  }
}
