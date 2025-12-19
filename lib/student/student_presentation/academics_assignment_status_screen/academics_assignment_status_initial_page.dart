// // TODO Implement this library.import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// import '../../core/app_export.dart';
// import '../../widgets/app_bar/appbar_subtitle_five.dart';
// import '../../widgets/app_bar/appbar_subtitle_one.dart';
// import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import 'controller/academics_assignment_status_controller.dart';
// import 'models/academics_assignment_status_initial_model.dart';

// // ignore_for_file: must_be_immutable
// class AcademicsAssignmentStatusInitialPage extends StatelessWidget {
//   AcademicsAssignmentStatusInitialPage({Key? key}) : super(key: key);

//   AcademicsAssignmentStatusController controller = Get.put(
//     AcademicsAssignmentStatusController(),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       decoration: AppDecoration.grayC13,
//       child: Column(
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: 694.h,
//               width: double.maxFinite,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Container(
//                     child: TabBarView(
//                       controller: controller.tabviewController,
//                       children: [],
//                     ),
//                   ),
//                   _buildColumnacademics(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildColumnacademics() {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Container(
//         width: double.maxFinite,
//         padding: EdgeInsets.symmetric(vertical: 18.h),
//         decoration: AppDecoration.primaryC7Main,
//         child: Column(
//           spacing: 16,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomAppBar(
//               height: 38.h,
//               centerTitle: true,
//               title: Column(
//                 children: [
//                   AppbarSubtitleOne(text: "lbl_academics".tr),
//                   AppbarSubtitleFive(
//                     text: dashboardExtendedViewController.selectedStudent1!.firstName!,
//                     margin: EdgeInsets.only(left: 28.h, right: 29.h),
//                   ),
//                 ],
//               ),
//               actions: [
//                 AppbarTrailingIconbutton(
//                   imagePath: ImageConstant.imgIconsSmallSchularAi,
//                 ),
//                 AppbarTrailingIconbutton(
//                   imagePath: ImageConstant.imgSearch,
//                   margin: EdgeInsets.only(left: 11.h, right: 25.h),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: double.maxFinite,
//               child: Obx(
//                 () => Container(
//                   margin: EdgeInsets.symmetric(horizontal: 66.h),
//                   child: TabBar(
//                     controller: controller.tabviewController,
//                     isScrollable: true,
//                     tabAlignment: TabAlignment.start,
//                     labelColor: appTheme.whiteA700,
//                     labelStyle: TextStyle(
//                       fontSize: 12.fSize,
//                       fontFamily: 'Rubik',
//                       fontWeight: FontWeight.w500,
//                     ),
//                     unselectedLabelColor: theme.colorScheme.onPrimary,
//                     unselectedLabelStyle: TextStyle(
//                       fontSize: 12.fSize,
//                       fontFamily: 'Rubik',
//                       fontWeight: FontWeight.w400,
//                     ),
//                     tabs: [
//                       Tab(
//                         height: 38,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration:
//                               controller.tabIndex.value == 0
//                                   ? BoxDecoration(
//                                     color: theme.colorScheme.onPrimary,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   )
//                                   : BoxDecoration(
//                                     color: appTheme.whiteA700,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 14.h,
//                               vertical: 10.h,
//                             ),
//                             child: Text("lbl_assignment".tr),
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         height: 38,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration:
//                               controller.tabIndex.value == 1
//                                   ? BoxDecoration(
//                                     color: theme.colorScheme.onPrimary,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   )
//                                   : BoxDecoration(
//                                     color: appTheme.whiteA700,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 14.h,
//                               vertical: 10.h,
//                             ),
//                             child: Text("lbl_cbt_test".tr),
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         height: 38,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration:
//                               controller.tabIndex.value == 2
//                                   ? BoxDecoration(
//                                     color: theme.colorScheme.onPrimary,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   )
//                                   : BoxDecoration(
//                                     color: appTheme.whiteA700,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 14.h,
//                               vertical: 10.h,
//                             ),
//                             child: Text("lbl_lesson".tr),
//                           ),
//                         ),
//                       ),
//                     ],
//                     indicatorColor: Colors.transparent,
//                     onTap: (index) {
//                       controller.tabIndex.value = index;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 28.h),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';

import 'package:schulupparent/student/student_presentation/academics_assignment_modal_buttomsheet/academics_assignment_modal_buttomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_buttomsheet/controller/academics_assignment_modal_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_one_bottomsheet/academics_assignment_modal_one_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_one_bottomsheet/controller/academics_assignment_modal_one_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_two_bottomsheet/academics_assignment_modal_two_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_modal_two_bottomsheet/controller/academics_assignment_modal_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/assignment_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/cbt_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/lesson_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/listline_item_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/widgets/listline_item_widget_cbt.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/widgets/listline_item_widget_lesson.dart';
import 'package:schulupparent/student/student_presentation/academics_cbt_test_one_modal_bottomsheet/academics_cbt_test_modal_one_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/academics_cbt_test_one_modal_bottomsheet/controller/academics_cbt_test_modal_one_controller.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/signin_screen/shimmer_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/widgets/listline_item_widget.dart';

StudentDashboardExtendedViewController dashboardExtendedViewController =
    Get.find<StudentDashboardExtendedViewController>();

class AcademicsAssignmentStatusInitialPage extends StatefulWidget {
  AcademicsAssignmentStatusInitialPage({Key? key}) : super(key: key);

  @override
  State<AcademicsAssignmentStatusInitialPage> createState() =>
      _AcademicsAssignmentStatusInitialPageState();
}

class _AcademicsAssignmentStatusInitialPageState
    extends State<AcademicsAssignmentStatusInitialPage> {
  StudentAcademicsAssignmentStatusController controller = Get.put(
    StudentAcademicsAssignmentStatusController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getAssignment();
    controller.getCbt();
    controller.allLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.grayC13,
      child: Column(
        children: [
          _buildColumnacademics(),
          Expanded(
            child: TabBarView(
              controller: controller.tabviewController,
              children: [
                // Assignment Tab Content
                _buildAssignmentTab(),

                // CBT Test Tab Content
                _buildCBTTestTab(),

                // Lesson Tab Content
                _buildLessonTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget - Header with tabs
  Widget _buildColumnacademics() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 18.h),
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            height: 38.h,
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_academics".tr),
                AppbarSubtitleFive(
                  text:
                      dashboardExtendedViewController
                          .selectedStudent1!
                          .firstName!,
                  margin: EdgeInsets.only(left: 28.h, right: 29.h),
                ),
              ],
            ),
            actions: [
              AppbarTrailingIconbutton(
                onTap: () {
                  // controller.getAssignment();
                  Get.toNamed(AppRoutes.academicsSchularAiOngoingScreen);
                },
                imagePath: ImageConstant.imgIconsSmallSchularAi,
              ),
              AppbarTrailingIconbutton(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.academicsAssignmentSearchScreen,
                    arguments: {'value': controller.tabIndex},
                  );
                },
                imagePath: ImageConstant.imgSearch,
                margin: EdgeInsets.only(left: 11.h, right: 25.h),
              ),
            ],
          ),

          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => Container(
                margin: EdgeInsets.symmetric(horizontal: 46.h),
                child: TabBar(
                  controller: controller.tabviewController,
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 4),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.center,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: theme.colorScheme.onPrimary,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 0
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("lbl_assignment".tr),
                        ),
                      ),
                    ),
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 1
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("lbl_cbt_test".tr),
                        ),
                      ),
                    ),
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 2
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("lbl_lesson".tr),
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    controller.tabIndex.value = index;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          controller.tabIndex.value == 0
              ? Container(
                decoration: AppDecoration.outline,
                width: double.maxFinite,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
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
                                    controller.classType.value == 'N/A'
                                        ? dashboardExtendedViewController
                                            .selectedClass
                                            .value
                                        : controller.classType.value,
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
                                context: context,
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
                                    "${controller.termType.value} Term",
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
                                    controller.statusType.value,
                                    style: theme.textTheme.labelLarge,
                                  );
                                }),
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconsTinyDown,
                                  height: 16.h,
                                  width: 18.h,
                                  margin: EdgeInsets.only(
                                    left: 10.h,
                                    right: 14.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              : controller.tabIndex.value == 1
              ? Container(
                decoration: AppDecoration.outline,
                width: double.maxFinite,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
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
                                    // cbt tab
                                    controller.classType.value == 'N/A'
                                        ? dashboardExtendedViewController
                                            .selectedClass
                                            .value
                                        : controller.classType.value,
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
                                context: context,
                                builder: (context) {
                                  //cbt tab
                                  return AcademicsCbtTestModalOneBottomsheet(
                                    AcademicsCbtTestModalOneController(),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Obx(() {
                                  return Text(
                                    controller.cbtType.value,
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
                        ],
                      ),
                    ),
                  ),
                ),
              )
              : Container(
                decoration: AppDecoration.outline,
                width: double.maxFinite,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return AcademicsAssignmentModalBottomsheet(
                                    AcademicsAssignmentModalController(),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                // Obx(() {
                                //   return
                                Text(
                                  dashboardExtendedViewController
                                      .classDataList
                                      .first
                                      .name!,
                                  style: theme.textTheme.labelLarge,
                                ),
                                //}),
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
                                context: context,
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
                                    "${controller.termType.value} Term",
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        ],
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
                      height: 900.h,
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

  /// CBT Test Tab Content
  Widget _buildCBTTestTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          // Add your CBT test content here
          //AcademicsCbtTestStatusModel
          Obx(
            () =>
                controller.isLoading.value
                    ? SizedBox(
                      height: 900.h,
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
                    : controller.cbtData!.isEmpty
                    ? Center(
                      child: Column(
                        spacing: 30,
                        children: [
                          SizedBox(height: 150.h),
                          CustomImageView(imagePath: ImageConstant.imgObjects),
                          Text('No Lessons for the selected filter condition'),
                        ],
                      ),
                    )
                    : ListView.builder(
                      itemCount: controller.cbtData!.length,
                      itemBuilder: (context, index) {
                        CbtData listlineItemModelObj =
                            controller.cbtData![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              // Get.toNamed(AppRoutes.academicsCbtTestTestDetailsScreen);
                              controller.getCbtDetails(
                                listlineItemModelObj.quizScheduleID.toString(),
                              );
                            },
                            child: ListlineItemCbtWidget(listlineItemModelObj),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
          ),
        ],
      ),
    );
  }

  /// Lesson Tab Content
  Widget _buildLessonTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          //ListlineItemLessonWidget
          // Add your lesson content here
          Obx(
            () =>
                controller.isLoading.value
                    ? SizedBox(
                      height: 900.h,
                      child: ListView.separated(
                        shrinkWrap: true,
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
                    : controller.lessonList.isEmpty
                    ? Center(
                      child: Column(
                        spacing: 30,
                        children: [
                          SizedBox(height: 150.h),
                          CustomImageView(imagePath: ImageConstant.imgObjects),
                          Text('No cbt Test for the selected filter condition'),
                        ],
                      ),
                    )
                    : ListView.builder(
                      itemCount: controller.lessonList.length,
                      itemBuilder: (context, index) {
                        LessonData listlineItemModelObj =
                            controller.lessonList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.academicsLessonLessonDetailsScreen,
                                arguments: {'lessonData': listlineItemModelObj},
                              );
                            },
                            child: ListlineItemLessonWidget(
                              listlineItemModelObj,
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
          ),
        ],
      ),
    );
  }
}
