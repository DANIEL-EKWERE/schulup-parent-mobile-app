// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_buttomsheet/academics_assignment_modal_buttomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_buttomsheet/controller/academics_assignment_modal_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_three_bottomsheet/academics_assignment_three_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_three_bottomsheet/controller/academics_assignment_modal_three_controller.dart';
import 'package:schulupparent/presentation/academics_cbt_test_one_modal_bottomsheet/academics_cbt_test_modal_one_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_cbt_test_one_modal_bottomsheet/controller/academics_cbt_test_modal_one_controller.dart';
import '../../core/app_export.dart';
import '../academics_assignment_modal_bottomsheet/academics_assignment_modal_bottomsheet.dart';
import '../academics_assignment_modal_bottomsheet/controller/academics_assignment_modal_controller.dart';
import '../academics_assignment_modal_four_bottomsheet/academics_assignment_modal_four_bottomsheet.dart';
import '../academics_assignment_modal_four_bottomsheet/controller/academics_assignment_modal_four_controller.dart';
import '../academics_assignment_modal_one_bottomsheet/academics_assignment_modal_one_bottomsheet.dart';
import '../academics_assignment_modal_one_bottomsheet/controller/academics_assignment_modal_one_controller.dart';
import '../academics_assignment_modal_three_bottomsheet/academics_assignment_modal_three_bottomsheet.dart';
import '../academics_assignment_modal_three_bottomsheet/controller/academics_assignment_modal_three_controller.dart';
import '../academics_assignment_modal_two_bottomsheet/academics_assignment_modal_two_bottomsheet.dart';
import '../academics_assignment_modal_two_bottomsheet/controller/academics_assignment_modal_two_controller.dart';
import '../academics_cbt_test_modal_bottomsheet/academics_cbt_test_modal_bottomsheet.dart';
import '../academics_cbt_test_modal_bottomsheet/controller/academics_cbt_test_modal_controller.dart';
import '../academics_cbt_test_modal_one_bottomsheet/academics_cbt_test_modal_one_bottomsheet.dart';
import '../academics_cbt_test_modal_one_bottomsheet/controller/academics_cbt_test_modal_one_controller.dart';
import '../academics_cbt_test_modal_two_bottomsheet/academics_cbt_test_modal_two_bottomsheet.dart';
import '../academics_cbt_test_modal_two_bottomsheet/controller/academics_cbt_test_modal_two_controller.dart';
import '../academics_lesson_modal_select_bottomsheet/academics_lesson_modal_select_bottomsheet.dart';
import '../academics_lesson_modal_select_bottomsheet/controller/academics_lesson_modal_select_controller.dart';
import '../academics_lesson_modal_select_one_bottomsheet/academics_lesson_modal_select_one_bottomsheet.dart';
import '../academics_lesson_modal_select_one_bottomsheet/controller/academics_lesson_modal_select_one_controller.dart';
import '../academics_schular_ai_conversation_bottomsheet/academics_schular_ai_conversation_bottomsheet.dart';
import '../academics_schular_ai_conversation_bottomsheet/controller/academics_schular_ai_conversation_controller.dart';
import '../academics_schular_ai_conversation_one_bottomsheet/academics_schular_ai_conversation_one_bottomsheet.dart';
import '../academics_schular_ai_conversation_one_bottomsheet/controller/academics_schular_ai_conversation_one_controller.dart';
import '../attendance_filter_start_date_bottomsheet/attendance_filter_start_date_bottomsheet.dart';
import '../attendance_filter_start_date_bottomsheet/controller/attendance_filter_start_date_controller.dart';
import '../news_modal_jump_to_a_date_bottomsheet/controller/news_modal_jump_to_a_date_controller.dart';
import '../news_modal_jump_to_a_date_bottomsheet/news_modal_jump_to_a_date_bottomsheet.dart';
import '../reports_report_card_modal_bottomsheet/controller/reports_report_card_modal_controller.dart';
import '../reports_report_card_modal_bottomsheet/reports_report_card_modal_bottomsheet.dart';
import '../reports_report_card_modal_one_bottomsheet/controller/reports_report_card_modal_one_controller.dart';
import '../reports_report_card_modal_one_bottomsheet/reports_report_card_modal_one_bottomsheet.dart';
import '../reports_report_card_share_report_bottomsheet/controller/reports_report_card_share_report_controller.dart';
import '../reports_report_card_share_report_bottomsheet/reports_report_card_share_report_bottomsheet.dart';
import '../reports_ward_progress_class_one_bottomsheet/controller/reports_ward_progress_class_one_controller.dart';
import '../reports_ward_progress_class_one_bottomsheet/reports_ward_progress_class_one_bottomsheet.dart';
import '../reports_ward_progress_subject_one_bottomsheet/controller/reports_ward_progress_subject_one_controller.dart';
import '../reports_ward_progress_subject_one_bottomsheet/reports_ward_progress_subject_one_bottomsheet.dart';
import 'controller/app_navigation_controller.dart'; // ignore_for_file: must_be_immutable

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SafeArea(
        child: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Text(
                        "App Navigation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 20.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "Check your app's UI from the below demo screens of your app.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF888888),
                          fontSize: 16.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Divider(
                      height: 1.h,
                      thickness: 1.h,
                      color: Color(0XFF000000),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Schulup Logo - SVG",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.schulupLogoSvgScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Status",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentStatusScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Status One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentStatusOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Assignment - Modal - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsAssignmentModalBottomsheet(
                                  Get.put(AcademicsAssignmentModalController()),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Assignment - Modal One - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsAssignmentModalOneBottomsheet(
                                  Get.put(
                                    AcademicsAssignmentModalOneController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Assignment - Modal Two - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsAssignmentModalTwoBottomsheet(
                                  Get.put(
                                    AcademicsAssignmentModalTwoController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Search",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentSearchScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Search One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentSearchOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Assignment - Modal Three - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsAssignmentModalThreeBottomsheet(
                                  Get.put(
                                    AcademicsAssignmentModalThreeController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Search Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentSearchTwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Assignment",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentAssignmentScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Answer",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentAnswerScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Assignment - Modal Four - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsAssignmentModalFourBottomsheet(
                                  Get.put(
                                    AcademicsAssignmentModalFourController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Not Submitted",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentNotSubmittedScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - Submitted",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentSubmittedScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - A teacher",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentATeacherScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Assignment - The child",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsAssignmentTheChildScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - CBT test - Modal - - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsCbtTestModalBottomsheet(
                                  Get.put(AcademicsCbtTestModalController()),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - CBT test - Modal - One - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsCbtTestModalOneBottomsheet(
                                  Get.put(AcademicsCbtTestModalOneController()),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Search for",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestSearchForScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Search for One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestSearchForOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - CBT test - Modal - Two - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsCbtTestModalTwoBottomsheet(
                                  Get.put(AcademicsCbtTestModalTwoController()),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Search for Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestSearchForTwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Test details",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestTestDetailsScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Ongoing",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestOngoingScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Ongoing One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestOngoingOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Ongoing Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestOngoingTwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Test Result",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestTestResultScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Test Result One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestTestResultOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - CBT test - Test Result Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsCbtTestTestResultTwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Lesson - Modal Select - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsLessonModalSelectBottomsheet(
                                  Get.put(
                                    AcademicsLessonModalSelectController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Lesson - Modal - Select One - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsLessonModalSelectOneBottomsheet(
                                  Get.put(
                                    AcademicsLessonModalSelectOneController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Lesson - Search for",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsLessonSearchForScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Lesson - Search for One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsLessonSearchForOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Lesson - Search for Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsLessonSearchForTwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Lesson - Lesson details",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsLessonLessonDetailsScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Academics - Schular AI - Ongoing",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.academicsSchularAiOngoingScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Schular AI - Conversation - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsSchularAiConversationBottomsheet(
                                  Get.put(
                                    AcademicsSchularAiConversationController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Academics - Schular AI - Conversation One - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AcademicsSchularAiConversationOneBottomsheet(
                                  Get.put(
                                    AcademicsSchularAiConversationOneController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Attendance - Filter start date - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                AttendanceFilterStartDateBottomsheet(
                                  Get.put(
                                    AttendanceFilterStartDateController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Attendance - Filter start date One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.attendanceFilterStartDateOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Reports - Report card - All variants One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.reportsReportCardAllVariantsOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Reports - Report card - All variants Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.reportsReportCardAllVariantsTwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Reports - Report card - Modal - - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                ReportsReportCardModalBottomsheet(
                                  Get.put(ReportsReportCardModalController()),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Reports - Report card - Modal - One - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                ReportsReportCardModalOneBottomsheet(
                                  Get.put(
                                    ReportsReportCardModalOneController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Reports - Report card - Downloading",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.reportsReportCardDownloadingScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Reports - Report card - Share report - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                ReportsReportCardShareReportBottomsheet(
                                  Get.put(
                                    ReportsReportCardShareReportController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Reports - Report card - Preview",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.reportsReportCardPreviewScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Reports - Report card - Preview One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.reportsReportCardPreviewOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Reports - Ward Progress - Academic",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.reportsWardProgressAcademicScreen,
                              ),
                        ),
                        // _buildScreenTitle(
                        //   screenTitle:
                        //       "Reports - Ward progress - Subject One - BottomSheet",
                        //   onTapScreenTitle:
                        //       () => onTapBottomSheetTitle(
                        //         context,
                        //         ReportsWardProgressSubjectOneBottomsheet(
                        //           Get.put(
                        //             ReportsWardProgressSubjectOneController(),
                        //           ),
                        //         ),
                        //       ),
                        // ),
                        _buildScreenTitle(
                          screenTitle: "Reports - Ward progress - Subject Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.reportsWardProgressSubjectTwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Reports - Ward progress - Class One - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                ReportsWardProgressClassOneBottomsheet(
                                  Get.put(
                                    ReportsWardProgressClassOneController(),
                                  ),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "News - Modal - Jump to a date - BottomSheet",
                          onTapScreenTitle:
                              () => onTapBottomSheetTitle(
                                context,
                                NewsModalJumpToADateBottomsheet(
                                  Get.put(NewsModalJumpToADateController()),
                                ),
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News - Filter result",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.newsFilterResultScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News - News content - No image",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.newsNewsContentNoImageScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News - News content - Contains",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.newsNewsContentContainsScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News - News content - Downloading",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.newsNewsContentDownloadingScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News - Events",
                          onTapScreenTitle:
                              () =>
                                  onTapScreenTitle(AppRoutes.newsEventsScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Common click event for bottomsheet
  void onTapBottomSheetTitle(BuildContext context, Widget className) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return className;
      },
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 5.h),
            Divider(height: 1.h, thickness: 1.h, color: Color(0XFF888888)),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
