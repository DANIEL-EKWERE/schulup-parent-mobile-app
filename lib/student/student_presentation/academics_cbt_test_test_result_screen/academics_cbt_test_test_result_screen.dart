// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/academics_assignment_status_screen.dart';
import 'package:schulupparent/student/student_presentation/academics_cbt_test_test_result_screen/models/test_result_model.dart';
import 'package:schulupparent/student/theme/custom_button_style.dart';
import 'package:schulupparent/student/widgets/custom_elevated_button.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_radio_button.dart';
import 'controller/academics_cbt_test_test_result_controller.dart'; // ignore_for_file: must_be_immutable
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

StudentDashboardExtendedViewController dashboardExtendedViewController =
    Get.find<StudentDashboardExtendedViewController>();

StudentAcademicsCbtTestTestResultController controller = Get.put(
  StudentAcademicsCbtTestTestResultController(),
);

class StudentAcademicsCbtTestTestResultScreen extends StatefulWidget {
  const StudentAcademicsCbtTestTestResultScreen({Key? key}) : super(key: key);

  @override
  State<StudentAcademicsCbtTestTestResultScreen> createState() =>
      _StudentAcademicsCbtTestTestResultScreenState();
}

class _StudentAcademicsCbtTestTestResultScreenState
    extends State<StudentAcademicsCbtTestTestResultScreen> {
  @override
  void initState() {
    super.initState();
    getValue();
  }

  void getValue() {
    var id = Get.arguments['id'];
    controller.studentQuizResult(id);
  }

  /// Show exit confirmation dialog
  Future<bool?> _showExitDialog(BuildContext context) {
    return Get.dialog<bool>(
      AlertDialog(
        iconPadding: EdgeInsets.only(top: 40, bottom: 10),
        icon: Icon(
          Icons.info_outline_rounded,
          size: 60,
          weight: 2,
          fontWeight: FontWeight.w200,
        ),
        iconColor: Colors.red,
        title: Text(
          'Exit Test!',
          style: CustomTextStyles.bodyMediumOnPrimary.copyWith(fontSize: 18.h),
        ),
        //contentTextStyle: TextStyle(al),
        content: Text(
          textAlign: TextAlign.center,
          'Are you sure you want to exit? Your progress will be lost if you haven\'t submitted.',
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomElevatedButton(
                buttonTextStyle: CustomTextStyles.bodySmallWhiteA700_1,
                buttonStyle: CustomButtonStyles.fillPrimary,
                text: 'Exit',
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('Cancel'),
              ),

              // ElevatedButton(
              //   onPressed: () => Get.back(result: true),
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              //   child: Text('Exit'),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: _buildAppbar(),
        body: SafeArea(
          top: false,
          child: Obx(
            () =>
                controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                      child: Column(
                        spacing: 30,
                        children: [
                          _buildColumncurrentaf(),
                          Container(
                            // height: 200,
                            // padding: EdgeInsets.symmetric(vertical: 10),
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(horizontal: 24.h),
                            child: // _buildQuestionsList()
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   itemBuilder: (context, index) {
                            //     return Container();
                            //   },
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //  SizedBox(height: 18.h),
                                //  _buildWhowasthe(),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      controller.quizResult!.questions!.length,
                                  separatorBuilder:
                                      (context, index) =>
                                          SizedBox(height: 24.h),
                                  itemBuilder: (context, index) {
                                    final question =
                                        controller
                                            .quizResult!
                                            .questions![index];
                                    return Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Question ${index + 1}/${controller.questionsList.length}",
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          question.questionText!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodyMediumOnPrimary
                                              .copyWith(height: 1.50),
                                        ),
                                        // _buildQuestionCard(question, index),
                                        SizedBox(height: 18.h),
                                        _buildWhowasthe(question),
                                      ],
                                    );
                                  },
                                ),
                                // SizedBox(height: 30.h),
                                // Text(
                                //   "lbl_question_2_10".tr,
                                //   style: theme.textTheme.bodySmall,
                                // ),
                                // SizedBox(height: 10.h),
                                // Text(
                                //   "msg_in_what_year_did".tr,
                                //   maxLines: 2,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: CustomTextStyles.bodyMediumOnPrimary
                                //       .copyWith(height: 1.50),
                                // ),
                                // SizedBox(height: 18.h),
                                // _buildInwhatyear(),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
          ),
        ),
      ),
    );
  }

  // Replace your ListView.builder section with this:

  Widget _buildQuestionsList() {
    if (controller.quizResult!.showDetailedResults != true) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.orange),
            SizedBox(width: 12.h),
            Expanded(
              child: Text(
                "Detailed results are not available for this quiz",
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }

    if (controller.quizResult!.questions == null ||
        controller.quizResult!.questions!.isEmpty) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
        child: Center(child: Text("No questions available")),
      );
    }

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Questions & Answers", style: theme.textTheme.titleMedium),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.quizResult!.questions!.length,
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
            itemBuilder: (context, index) {
              final question = controller.quizResult!.questions![index];
              return _buildQuestionCard(question, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(Questions question, int index) {
    final questionNumber = (question.questionOrder ?? (index + 1));
    final totalQuestions = controller.quizResult!.questions!.length;

    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appTheme.gray400.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Question $questionNumber/$totalQuestions",
                style: theme.textTheme.bodySmall!.copyWith(
                  color: appTheme.amber100,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _getMarkColor(
                    question.markObtained,
                    question.mark,
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${question.markObtained ?? 0}/${question.mark ?? 0} marks",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: _getMarkColor(question.markObtained, question.mark),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Question Text
          Text(
            question.questionText ?? "No question text",
            style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 16.h),

          // Answer Options
          if (question.answers != null && question.answers!.isNotEmpty)
            ..._buildAnswerOptions(question),
        ],
      ),
    );
  }

  List<Widget> _buildAnswerOptions(Questions question) {
    return question.answers!.asMap().entries.map((entry) {
      final index = entry.key;
      final answer = entry.value;

      // Check if this answer was selected by student
      final isStudentAnswer =
          question.studentAnswers?.any(
            (sa) => sa.answerID == answer.answerID,
          ) ??
          false;

      final isCorrectAnswer = answer.isCorrect ?? false;

      return Padding(
        padding: EdgeInsets.only(top: index == 0 ? 0 : 10.h),
        child: Container(
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color:
                  isStudentAnswer && isCorrectAnswer
                      ? Colors.green
                      : isStudentAnswer && !isCorrectAnswer
                      ? Colors.red
                      : !isStudentAnswer && isCorrectAnswer
                      ? Colors.green.withOpacity(0.5)
                      : appTheme.gray400,
              width: isStudentAnswer || isCorrectAnswer ? 2 : 1,
            ),
            color:
                isStudentAnswer && isCorrectAnswer
                    ? Colors.green.withOpacity(0.1)
                    : isStudentAnswer && !isCorrectAnswer
                    ? Colors.red.withOpacity(0.1)
                    : !isStudentAnswer && isCorrectAnswer
                    ? Colors.green.withOpacity(0.05)
                    : Colors.transparent,
          ),
          child: Row(
            children: [
              // Icon indicator
              if (isStudentAnswer || isCorrectAnswer)
                Padding(
                  padding: EdgeInsets.only(right: 12.h),
                  child: Icon(
                    isStudentAnswer && isCorrectAnswer
                        ? Icons.check_circle
                        : isStudentAnswer && !isCorrectAnswer
                        ? Icons.cancel
                        : Icons.check_circle_outline,
                    color:
                        isStudentAnswer && isCorrectAnswer
                            ? Colors.green
                            : isStudentAnswer && !isCorrectAnswer
                            ? Colors.red
                            : Colors.green.withOpacity(0.5),
                    size: 20,
                  ),
                ),

              // Answer text
              Expanded(
                child: Text(
                  answer.answerText ?? "",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight:
                        isStudentAnswer || isCorrectAnswer
                            ? FontWeight.w600
                            : FontWeight.normal,
                  ),
                ),
              ),

              // Label
              if (isStudentAnswer)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: isCorrectAnswer ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Your Answer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else if (isCorrectAnswer)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Text(
                    "Correct",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Color _getMarkColor(dynamic obtained, dynamic total) {
    if (obtained == null || total == null) return appTheme.gray600;

    final percentage = (obtained / total) * 100;
    if (percentage >= 70) return Colors.green;
    if (percentage >= 50) return Colors.orange;
    return Colors.red;
  }

  // Replace the Container with ListView.builder in your build method with:
  //_buildQuestionsList(),

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 59.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgCloseWhiteA700,
        margin: EdgeInsets.only(left: 25.h, top: 22.h, bottom: 8.h),
        onTap: () {
          onTapCloseone();
        },
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "lbl_result".tr),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumncurrentaf() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
      decoration: AppDecoration.primaryC10,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.quizResult!.quizTitle!,
            style: CustomTextStyles.titleMediumOnPrimary,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray400.withValues(alpha: 0.5)),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              spacing: 10,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_subject".tr,
                    durationTwo: controller.quizResult!.subjectName!,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_duration".tr,
                    durationTwo: controller.quizResult!.duration!,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "msg_marks_obtainable".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        decoration: AppDecoration.grayC7.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Text(
                          controller.quizResult!.maximumMarksObtainable!
                              .toString(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmallWhiteA700_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_marks_obtained".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 22.h),
                        decoration: AppDecoration.errorC1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Text(
                          controller.quizResult!.marksObtained.toString(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmallWhiteA700_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_percentage".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.h),
                        decoration: AppDecoration.errorC1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Text(
                          controller.quizResult!.percentageScore.toString(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmallWhiteA700_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_started".tr,
                    durationTwo: formatDate(controller.quizResult!.started!),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowduration(
                    durationOne: "lbl_submitted2".tr,
                    durationTwo: formatDate(controller.quizResult!.submitted!),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(String dateString) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format it to "Monday, Nov. 3, 2025"
    String formatted = DateFormat('MMM. EEE, d, yyyy | h:m a').format(dateTime);

    return formatted;
  }

  // /// Section Widget
  // Widget _buildWhowasthe(Questions questions) {
  //   return SizedBox(
  //     width: double.maxFinite,
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           //   height: 140,
  //           child: ListView.separated(
  //             shrinkWrap: true,
  //             physics: NeverScrollableScrollPhysics(),
  //             separatorBuilder: (context, index) {
  //               return SizedBox(height: 10);
  //             },
  //             itemCount: questions.answers!.length,
  //             itemBuilder: (context, index) {
  //               Answers answers = questions.answers![index];
  //               StudentAnswers studentAnswers =
  //                   questions.studentAnswers![index] ;
  //               return CustomRadioButton(
  //                 text: answers.answerText,
  //                 value: answers.answerText,
  //                 groupValue: controller.whowasthe.value,
  //                 padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
  //                 decoration:
  //                     //studentAnswers.isCorrect!
  //                     // ?
  //                     answers.isCorrect!
  //                         ? RadioStyleHelper.outlineGreen
  //                         : RadioStyleHelper.outlineGray,
  //                 //: RadioStyleHelper.outlineRed,
  //                 onChange: (value) {
  //                   controller.whowasthe.value = value;
  //                 },
  //               );
  //             },
  //           ),
  //         ),
  //         // Padding(
  //         //   padding: EdgeInsets.only(top: 10.h),
  //         //   child: CustomRadioButton(
  //         //     text: "lbl_obafemi_awolowo".tr,
  //         //     value: "lbl_obafemi_awolowo".tr,
  //         //     groupValue: controller.whowasthe.value,
  //         //     padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
  //         //     decoration: RadioStyleHelper.outlineRed,
  //         //     onChange: (value) {
  //         //       controller.whowasthe.value = value;
  //         //     },
  //         //   ),
  //         // ),
  //         // Padding(
  //         //   padding: EdgeInsets.only(top: 10.h),
  //         //   child: CustomRadioButton(
  //         //     text: "lbl_tafawa_balewa".tr,
  //         //     value: "lbl_tafawa_balewa".tr,
  //         //     groupValue: controller.whowasthe.value,
  //         //     padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
  //         //     decoration: RadioStyleHelper.outlineGray,
  //         //     onChange: (value) {
  //         //       controller.whowasthe.value = value;
  //         //     },
  //         //   ),
  //         // ),
  //         // Padding(
  //         //   padding: EdgeInsets.only(top: 10.h),
  //         //   child: CustomRadioButton(
  //         //     text: "lbl_ahmadu_bello".tr,
  //         //     value: "lbl_ahmadu_bello".tr,
  //         //     groupValue: controller.whowasthe.value,
  //         //     padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
  //         //     decoration: RadioStyleHelper.outlineGray,
  //         //     onChange: (value) {
  //         //       controller.whowasthe.value = value;
  //         //     },
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  // ...existing code...

  /// Section Widget
  Widget _buildWhowasthe(Questions questions) {
    // Helper to get the student's selected answer text (if any)
    String? studentAnswerText;
    bool hasStudentAnswered =
        questions.studentAnswers != null &&
        questions.studentAnswers!.isNotEmpty;
    if (hasStudentAnswered) {
      // Find the answer text for the student's first selected answer (assuming single-choice; adjust for multi-choice)
      final studentAnswerID =
          questions
              .studentAnswers!
              .first
              .answerID; // Assuming StudentAnswers has answerID
      final studentAnswer = questions.answers?.firstWhere(
        (answer) => answer.answerID == studentAnswerID,
        orElse: () => Answers(),
      );
      studentAnswerText = studentAnswer?.answerText;
    }

    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: questions.answers!.length,
              itemBuilder: (context, index) {
                Answers answer = questions.answers![index];
                bool isStudentAnswer = answer.answerText == studentAnswerText;
                bool isCorrect = answer.isCorrect ?? false;

                // Determine decoration based on correctness and selection
                late dynamic decoration;
                if (isStudentAnswer && isCorrect) {
                  decoration =
                      RadioStyleHelper.outlineGreen; // Correct answer selected
                } else if (isStudentAnswer && !isCorrect) {
                  decoration =
                      RadioStyleHelper.outlineRed; // Wrong answer selected
                } else if (!isStudentAnswer && isCorrect) {
                  decoration =
                      RadioStyleHelper
                          .outlineGreen; // Correct answer not selected (subtle highlight)
                } else {
                  decoration = RadioStyleHelper.outlineGray; // Default
                }

                return CustomRadioButton(
                  text: answer.answerText,
                  value: answer.answerText,
                  groupValue:
                      studentAnswerText, // Pre-select student's answer (or null if none)
                  padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                  decoration: decoration,
                  // Remove onChange to make it non-interactive
                  onChange: (value) {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ...existing code...

  /// Section Widget
  Widget _buildInwhatyear() {
    return SizedBox(
      width: double.maxFinite,
      child: Obx(
        () => Column(
          children: [
            CustomRadioButton(
              text: "lbl_1956".tr,
              value: "lbl_1956".tr,
              groupValue: controller.inwhatyear.value,
              padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
              decoration: RadioStyleHelper.outlineGray,
              onChange: (value) {
                controller.inwhatyear.value = value;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_1963".tr,
                value: "lbl_1963".tr,
                groupValue: controller.inwhatyear.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGray,
                onChange: (value) {
                  controller.inwhatyear.value = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_1970".tr,
                value: "lbl_1970".tr,
                groupValue: controller.inwhatyear.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGray,
                onChange: (value) {
                  controller.inwhatyear.value = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomRadioButton(
                text: "lbl_1960".tr,
                value: "lbl_1960".tr,
                groupValue: controller.inwhatyear.value,
                padding: EdgeInsets.fromLTRB(14.h, 14.h, 30.h, 14.h),
                decoration: RadioStyleHelper.outlineGreen,
                onChange: (value) {
                  controller.inwhatyear.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildRowduration({
    required String durationOne,
    required String durationTwo,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          durationOne,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
        Text(
          durationTwo,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapCloseone() {
    print('object===================');
    // Get.back();s
    //Navigator.pop(Get.context!);
    // Get.offAllNamed(AppRoutes.studentAcademicsAssignmentStatusScreen);
    Get.offAll(() => StudentAcademicsAssignmentStatusScreen());
  }
}
