// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_buttomsheet/academics_assignment_modal_buttomsheet.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_buttomsheet/controller/academics_assignment_modal_controller.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_four_bottomsheet/academics_assignment_modal_four_bottomsheet.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_four_bottomsheet/controller/academics_assignment_modal_four_controller.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_one_bottomsheet/academics_assignment_modal_one_bottomsheet.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_one_bottomsheet/controller/academics_assignment_modal_one_controller.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_two_bottomsheet/academics_assignment_modal_two_bottomsheet.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_modal_two_bottomsheet/controller/academics_assignment_modal_two_controller.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/assignment_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/cbt_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/lesson_model.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/widgets/listline_item_widget_cbt.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/widgets/listline_item_widget_lesson.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_three_bottomsheet/academics_assignment_three_bottomsheet.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_three_bottomsheet/controller/academics_assignment_modal_three_controller.dart';
//import 'package:schulupparent/presentation/news_events_screen/widgets/listline_item_widget.dart';
import 'package:schulupparent/parent/parent_presentation/signin_screen/shimmer_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title_searchview.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import 'controller/academics_assignment_search_controller.dart'; // ignore_for_file: must_be_immutable
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/widgets/listline_item_widget.dart';

AcademicsAssignmentStatusController controller1 = Get.put(
  AcademicsAssignmentStatusController(),
);

class AcademicsAssignmentSearchScreen
    extends GetWidget<AcademicsAssignmentSearchController> {
  const AcademicsAssignmentSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Get.arguments['value'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnarrowleft(),
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    value == 0
                        ? _buildAssignmentTab()
                        : value == 1
                        ? _buildCBTTestTab()
                        : _buildLessonTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnarrowleft() {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 14,
        children: [
          CustomAppBar(
            height: 80.h,
            leadingWidth: 55.h,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
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
                    onTapArrowleftone();
                  },
                ),
              ),
            ),
            title: SizedBox(
              width: double.maxFinite,
              child: AppbarTitleSearchview(
                onChange: (value) {
                  return controller.onSearchSubmit();
                },
                margin: EdgeInsets.only(left: 16.h, right: 25.h),
                hintText: "msg_search_for_an_assignment".tr,
                controller: controller.searchController,
              ),
            ),
          ),
          Container(
            decoration: AppDecoration.outline,
            width: double.maxFinite,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.h,
                    vertical: 8.h,
                  ),
                  child: Row(
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
                                controller1.classType.value == 'N/A'
                                    ? dashboardExtendedViewController
                                        .selectedClass
                                        .value
                                    : controller1.classType.value,
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
                      Spacer(flex: 40),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: Get.context!,
                            builder: (context) {
                              // upload a file modal bottom sheet
                              // return AcademicsAssignmentModalFourBottomsheet(
                              //   AcademicsAssignmentModalFourController(),
                              // );
                              // select status modal bottom sheet with two options
                              // return AcademicsAssignmentModalTwoBottomsheet(
                              //   AcademicsAssignmentModalTwoController(),
                              // );

                              // still status with all options
                              // return AcademicsAssignmentModalThreeBottomsheet(
                              //   AcademicsAssignmentModalThreeController(),
                              // );
                              // primary school selection modal bottom sheet
                              // return AcademicsAssignmentModalBottomsheet(
                              //   AcademicsAssignmentModalController(),
                              // );

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
                                "${controller1.termType.value} Term",
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
                      Spacer(flex: 59),
                      GestureDetector(
                        onTap: () {
                          // status selection modal bottom sheet
                          showModalBottomSheet(
                            context: Get.context!,
                            builder: (context) {
                              return AcademicsAssignmentModalThreeBottomsheet(
                                AcademicsAssignmentModalThreeController(),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Obx(() {
                              return Text(
                                controller1.searchStatus.value,
                                style: theme.textTheme.labelLarge,
                              );
                            }),
                            CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyDown,
                              height: 16.h,
                              width: 18.h,
                              margin: EdgeInsets.only(left: 10.h, right: 20.h),
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
                    : controller.assignmentData.isEmpty
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
                      itemCount: controller.assignmentData.length,
                      itemBuilder: (context, index) {
                        AssignmentData listlineItemModelObj =
                            controller.assignmentData[index];
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
                    : controller.cbtData.isEmpty
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
                      itemCount: controller.cbtData.length,
                      itemBuilder: (context, index) {
                        CbtData listlineItemModelObj =
                            controller.cbtData[index];
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
                      height: 650.h,
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

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(Get.context!);
  }
}
