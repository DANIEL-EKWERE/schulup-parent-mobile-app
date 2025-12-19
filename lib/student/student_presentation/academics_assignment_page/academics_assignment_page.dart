import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_buttomsheet/academics_assignment_modal_buttomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_buttomsheet/controller/academics_assignment_modal_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_one_bottomsheet/academics_assignment_modal_one_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_one_bottomsheet/controller/academics_assignment_modal_one_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_two_bottomsheet/academics_assignment_modal_two_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_two_bottomsheet/controller/academics_assignment_modal_two_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
// import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/cbt_model.dart';
// import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/lesson_model.dart';
// import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/widgets/listline_item_widget_cbt.dart';
// import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/widgets/listline_item_widget_lesson.dart';
// import 'package:schulupparent/student/student_presentation/academics_cbt_test_one_modal_bottomsheet/academics_cbt_test_modal_one_bottomsheet.dart';
// import 'package:schulupparent/student/student_presentation/academics_cbt_test_one_modal_bottomsheet/controller/academics_cbt_test_modal_one_controller.dart';
// import 'package:schulupparent/student/student_presentation/reports_report_card_modal_bottomsheet/controller/reports_report_card_modal_controller.dart';
// import 'package:schulupparent/student/student_presentation/reports_report_card_modal_bottomsheet/reports_report_card_modal_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/signin_screen/shimmer_widget.dart';
import 'package:schulupparent/student/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:schulupparent/student/widgets/app_bar/custom_app_bar.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import '../academics_assignment_status_screen/models/assignment_model.dart';
import 'controller/academics_assignment_controller.dart';
import 'models/academics_assignment_model.dart';
import 'models/listline_item_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class AcademicsAssignmentPage extends StatelessWidget {
  AcademicsAssignmentPage({Key? key}) : super(key: key);

  AcademicsAssignmentController controller = Get.put(
    AcademicsAssignmentController(AcademicsAssignmentModel().obs),
  );

  StudentAcademicsAssignmentStatusController controllerx = Get.put(
    StudentAcademicsAssignmentStatusController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        height: 56.h,
        leadingWidth: 75.h,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 10,
            width: 10,
            //margin: EdgeInsets.only(left: 25.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffEF5A07),
              border: Border.all(color: Color(0xffFFBC71)),
            ),
            child: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              //margin: EdgeInsets.only(left: 25.h),
              onTap: () {
                //Get.back();
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Assignment",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontSize: 20.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // SizedBox(height: 10.h),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    spacing: 14,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _buildRowprimarycount(),
                      //_buildListline()
                      //_buildCBTTestTab(),l
                      _buildAssignmentTab(),
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
  Widget _buildRowprimarycount() {
    return Container(
      decoration: AppDecoration.outline,
      width: double.maxFinite,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: Get.context!,
                      builder: (context) {
                        return AcademicsAssignmentModalBottomsheet(
                          AcademicsAssignmentModalController(),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(
                          controllerx.classType.value == 'N/A'
                              ? dashboardExtendedViewController
                                  .selectedClass
                                  .value
                              : controllerx.classType.value,
                          style: theme.textTheme.labelLarge,
                        );
                      }),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsTinyDown,
                        height: 16.h,
                        width: 18.h,
                        margin: EdgeInsets.only(left: 10.h),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: Get.context!,
                      builder: (context) {
                        return AcademicsAssignmentModalOneBottomsheet(
                          AcademicsAssignmentModalOneController(),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(
                          "${controllerx.termType.value} Term",
                          style: theme.textTheme.labelLarge,
                        );
                      }),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsTinyDown,
                        height: 16.h,
                        width: 18.h,
                        margin: EdgeInsets.only(left: 10.h),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // status selection modal bottom sheet
                    showModalBottomSheet(
                      context: Get.context!,
                      builder: (context) {
                        return AcademicsAssignmentModalTwoBottomsheet(
                          AcademicsAssignmentModalTwoController(),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(
                          controllerx.statusType.value,
                          style: theme.textTheme.labelLarge,
                        );
                      }),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsTinyDown,
                        height: 16.h,
                        width: 18.h,
                        margin: EdgeInsets.only(left: 10.h, right: 14.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Assignment Tab Content
  Widget _buildAssignmentTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          // Add your assignment content here
          // Center(
          //   child: Text(
          //     "Assignment Content",
          //     style: theme.textTheme.titleLarge,
          //   ),
          // ),
          Obx(
            () =>
                controller.isLoading.value
                    ? SizedBox(
                      height: 650.h,
                      child: ListView.separated(
                        itemCount: 5,
                        //isLoading ? 5 : newsItems.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          // if (isLoading) {
                          return ListlineShimmerWidget();
                          // }
                          // return ListlineItemWidget(newsItems[index]);
                        },
                      ),
                    )
                    : controller.assignmentData!.isEmpty
                    ? Center(
                      child: Column(
                        spacing: 30,
                        children: [
                          SizedBox(height: 150.h),
                          CustomImageView(imagePath: ImageConstant.imgObjects),
                          Text(
                            'No Assignment for the selected filter condition',
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      itemCount: controller.assignmentData!.length,
                      itemBuilder: (context, index) {
                        AssignmentData listlineItemModelObj =
                            controller.assignmentData![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              // Get.toNamed(
                              //   AppRoutes.academicsAssignmentAnswerScreen, arguments: listlineItemModelObj.assignmentID
                              // );
                              controller.getAssignmentDetail(
                                listlineItemModelObj.assignmentID.toString(),
                              );
                            },
                            child: ListlineItemWidget(listlineItemModelObj),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
          ),

          // Example: Add assignment list or empty state
        ],
      ),
    );
  }

  // /// CBT Test Tab Content
  // Widget _buildCBTTestTab() {
  //   return SingleChildScrollView(
  //     padding: EdgeInsets.all(20.h),
  //     child: Column(
  //       children: [
  //         // Add your CBT test content here
  //         //AcademicsCbtTestStatusModel
  //         Obx(
  //           () =>
  //               controller.isLoading.value
  //                   ? SizedBox(
  //                     height: 650.h,
  //                     child: ListView.separated(
  //                       itemCount: 5,
  //                       //isLoading ? 5 : newsItems.length,
  //                       separatorBuilder:
  //                           (context, index) => SizedBox(height: 12.h),
  //                       itemBuilder: (context, index) {
  //                         // if (isLoading) {
  //                         return ListlineShimmerWidget();
  //                         // }
  //                         // return ListlineItemWidget(newsItems[index]);
  //                       },
  //                     ),
  //                   )
  //                   : controller.cbtData!.isEmpty
  //                   ? Center(
  //                     child: Column(
  //                       spacing: 30,
  //                       children: [
  //                         SizedBox(height: 150.h),
  //                         CustomImageView(imagePath: ImageConstant.imgObjects),
  //                         Text('No cbt test for the selected filter condition'),
  //                       ],
  //                     ),
  //                   )
  //                   : ListView.builder(
  //                     itemCount: controller.cbtData!.length,
  //                     itemBuilder: (context, index) {
  //                       CbtData listlineItemModelObj =
  //                           controller.cbtData![index];
  //                       return Padding(
  //                         padding: const EdgeInsets.symmetric(vertical: 8),
  //                         child: GestureDetector(
  //                           onTap: () {
  //                             // Get.toNamed(AppRoutes.academicsCbtTestTestDetailsScreen);
  //                             controller.getCbtDetails(
  //                               listlineItemModelObj.quizScheduleID.toString(),
  //                             );
  //                           },
  //                           child: ListlineItemCbtWidget(listlineItemModelObj),
  //                         ),
  //                       );
  //                     },
  //                     shrinkWrap: true,
  //                     physics: NeverScrollableScrollPhysics(),
  //                   ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
