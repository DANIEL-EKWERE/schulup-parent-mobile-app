// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:intl/intl.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_answer_screen/models/assignment_thread_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_four_bottomsheet/academics_assignment_modal_four_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_four_bottomsheet/controller/academics_assignment_modal_four_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/assignment_details.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/reports_report_card_all_variants_page/models/comments_model.dart';
import 'package:schulupparent/student/widgets/custom_text_form_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/academics_assignment_answer_controller.dart'; // ignore_for_file: must_be_immutable

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

class AcademicsAssignmentAnswerScreen
    extends GetWidget<AcademicsAssignmentAnswerController> {
  const AcademicsAssignmentAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssignmentDetails model = Get.arguments['model'];
    print('building');
    controller.studentThread(model.data!.assignmentID.toString());
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
                  padding: EdgeInsets.only(left: 16.h, top: 20.h, right: 16.h),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _buildColumntherespir(model),

                          SizedBox(height: 10),

                          Obx(
                            () =>
                                (controller.isLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : controller.replies.isNotEmpty
                                    ? Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffF7F7F8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: double.infinity,
                                      // padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Your Submission Section (First Reply)
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xffF7F7F8),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            width: double.infinity,
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Your Submission',
                                                      style: theme
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                              0xff27262B,
                                                            ),
                                                          ),
                                                    ),
                                                    Text(
                                                      'Submitted',
                                                      style: theme
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color:
                                                                Colors
                                                                    .grey[500],
                                                            fontStyle:
                                                                FontStyle
                                                                    .italic,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 16),
                                                Text(
                                                  controller
                                                          .replies
                                                          .first
                                                          .replyText ??
                                                      '',
                                                  style: theme
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        color: Color(
                                                          0xff27262B,
                                                        ),
                                                        height: 1.5,
                                                      ),
                                                ),
                                                // Show attachments if any
                                                if (controller
                                                    .replies
                                                    .first
                                                    .hasAttachments) ...[
                                                  SizedBox(height: 16),
                                                  ...controller.replies.first.attachments!.map((
                                                    attachment,
                                                  ) {
                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 12,
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 12,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                        border: Border.all(
                                                          color: Color(
                                                            0xffEFEEF0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            attachment.isPdf
                                                                ? Icons
                                                                    .picture_as_pdf
                                                                : attachment
                                                                    .isImage
                                                                ? Icons.image
                                                                : Icons
                                                                    .attach_file,
                                                            color:
                                                                Colors
                                                                    .grey[600],
                                                            size: 24,
                                                          ),
                                                          SizedBox(width: 12),
                                                          Expanded(
                                                            child: Text(
                                                              attachment.name ??
                                                                  'Attachment',
                                                              style:
                                                                  theme
                                                                      .textTheme
                                                                      .bodyMedium,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.download,
                                                            color: Color(
                                                              0xffFF8D2A,
                                                            ),
                                                            size: 24,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                ],
                                                SizedBox(height: 20),
                                                Divider(
                                                  thickness: 1,
                                                  color: Color(0xffB9B8C1),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Comments Section (Remaining Replies)
                                          if (controller.replies.length >
                                              1) ...[
                                            //SizedBox(height: 10),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xffF7F7F8),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              width: double.infinity,
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Comments',
                                                    style: theme
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  // Comments ListView
                                                  ListView.separated(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemBuilder: (
                                                      context,
                                                      index,
                                                    ) {
                                                      // Skip first reply (already shown in submission)
                                                      Replies reply =
                                                          controller
                                                              .replies[index +
                                                              1];

                                                      bool isLastMessage =
                                                          (index + 1) ==
                                                          controller
                                                                  .replies
                                                                  .length -
                                                              1;
                                                      bool isSending =
                                                          controller
                                                              .isCommentsSendLoading
                                                              .value &&
                                                          isLastMessage;

                                                      return Column(
                                                        crossAxisAlignment:
                                                            reply.isStudentReply
                                                                ? CrossAxisAlignment
                                                                    .end
                                                                : CrossAxisAlignment
                                                                    .start,
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                                  maxWidth: 280,
                                                                ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                  12,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  reply.isStudentReply
                                                                      ? Color(
                                                                        0xffF4EEA9,
                                                                      ) // Student
                                                                      : Color(
                                                                        0xffA8EFF9,
                                                                      ), // Teacher
                                                              borderRadius:
                                                                  reply.isStudentReply
                                                                      ? BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                      )
                                                                      : BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                      ),
                                                            ),
                                                            child: Text(
                                                              reply.replyText ??
                                                                  '',
                                                              style: TextStyle(
                                                                color:
                                                                    isSending
                                                                        ? Colors
                                                                            .grey[400]
                                                                        : Color(
                                                                          0xff27262B,
                                                                        ),
                                                                height: 1.4,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            '${reply.userName} • ${isSending ? 'Sending...' : reply.formattedTime}',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color:
                                                                  Colors
                                                                      .grey[600],
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                    separatorBuilder: (
                                                      context,
                                                      index,
                                                    ) {
                                                      return SizedBox(
                                                        height: 16,
                                                      );
                                                    },
                                                    itemCount:
                                                        controller
                                                            .replies
                                                            .length -
                                                        1, // Exclude first reply
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    )
                                    : SizedBox.shrink(),
                          ),

                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildColumniconssmal(model),
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

  /// Section Widget
  Widget _buildColumntherespir(AssignmentDetails model) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.data!.title!,
            style: CustomTextStyles.titleMediumOnPrimary,
          ),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
          ),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowpostedon(
              postedonOne: "lbl_subject".tr,
              oct272025One: model.data!.subjectName!,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowpostedon(
              postedonOne: "lbl_posted_on".tr,
              oct272025One: formatDate(model.data!.datePosted!),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
            decoration:
                (DateTime.now().isAfter(DateTime.parse(model.data!.dueDate!)))
                    ? AppDecoration.errorC1.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    )
                    : AppDecoration.green.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
            child: Text(
              formatDate1(model.data!.dueDate!),
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmallWhiteA700,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
          ),
          SizedBox(height: 20.h),
          Text("lbl_question".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(height: 6.h),
          // Text(
          //   "msg_in_your_own_words".tr,
          //   maxLines: 10,
          //   overflow: TextOverflow.ellipsis,
          //   style: theme.textTheme.bodySmall!.copyWith(height: 1.50),
          // ),
          html.Html(
            data: model.data!.content,
            onLinkTap: (url, attributes, element) {
              if (url != null) {
                // Open the link in a browser
                launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              }
            },
            // onlyRenderTheseTags: RxSet({'<p>'}),
          ),
        ],
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM. d, yyyy').format(dateTime);
  }

  String formatDate1(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('EEEE, MMM. d, yyyy').format(dateTime);
  }

  /// Section Widget
  Widget _buildColumniconssmal(AssignmentDetails model) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
      decoration: AppDecoration.grayC12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                CustomImageView(
                  onTap: () {
                    showModalBottomSheet(
                      context: Get.context!,
                      builder: (context) {
                        return AcademicsAssignmentModalFourBottomsheet(
                          AcademicsAssignmentModalFourController(),
                        );
                      },
                    );
                  },
                  imagePath: ImageConstant.imgIconsSmallAttachment,
                  height: 24.h,
                  width: 24.h,
                  alignment: Alignment.bottomCenter,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      //left: 18.h,
                      // top: 12.h,
                      bottom: 12.h,
                      right: 18.h,
                    ),
                    decoration: AppDecoration.grayC11.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder12,
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: controller.replyController,
                          style: CustomTextStyles.bodyMediumGray700,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,

                          decoration: InputDecoration(
                            hintText: 'Enter text here...',

                            hintStyle:
                                CustomTextStyles.bodySmallSecondaryContainer,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.none,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.none,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.none,
                              ),
                            ),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.only(
                              left: 12.h,
                              top: 12.h,
                              right:
                                  40.h, // Extra padding to avoid icon overlap
                              bottom: 12.h,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8.h,
                          right: 8.h,
                          child: Obx(
                            () =>
                                controller.isCommentsSendLoading.value
                                    ? Center(child: CircularProgressIndicator())
                                    : CustomIconButton(
                                      height: 24.h,
                                      width: 24.h,
                                      padding: EdgeInsets.all(4.h),
                                      decoration:
                                          IconButtonStyleHelper.fillPrimary,
                                      child: CustomImageView(
                                        onTap: () {
                                          controller.studentReplyCall(
                                            model.data!.assignmentID.toString(),
                                          );
                                        },
                                        imagePath: ImageConstant.imgVector,
                                      ),
                                    ),
                          ),
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
    );
  }

  /// Common widget
  Widget _buildRowpostedon({
    required String postedonOne,
    required String oct272025One,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          postedonOne,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
        Text(
          oct272025One,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(Get.context!);
  }
}
