import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_buttomsheet/academics_assignment_modal_buttomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_buttomsheet/controller/academics_assignment_modal_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_one_bottomsheet/academics_assignment_modal_one_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_one_bottomsheet/controller/academics_assignment_modal_one_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/lesson_model.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/widgets/listline_item_widget_lesson.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_bottomsheet/controller/reports_report_card_modal_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_bottomsheet/reports_report_card_modal_bottomsheet.dart';
import 'package:schulupparent/presentation/signin_screen/shimmer_widget.dart';
import 'package:schulupparent/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:schulupparent/widgets/app_bar/custom_app_bar.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'controller/academics_lesson_all_lessons_controller.dart';
import 'models/academics_lesson_all_lessons_model.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class AcademicsLessonAllLessonsPage extends StatefulWidget {
  AcademicsLessonAllLessonsPage({Key? key}) : super(key: key);

  @override
  State<AcademicsLessonAllLessonsPage> createState() =>
      _AcademicsLessonAllLessonsPageState();
}

class _AcademicsLessonAllLessonsPageState
    extends State<AcademicsLessonAllLessonsPage> {
  AcademicsLessonAllLessonsController controller = Get.put(
    AcademicsLessonAllLessonsController(AcademicsLessonAllLessonsModel().obs),
  );

  AcademicsAssignmentStatusController controllerx = Get.put(
    AcademicsAssignmentStatusController(),
  );

  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.allLessons();
  }

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
          "All Lessons",
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
                    children: [_buildRowprimarycount(), _buildListline()],
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
      decoration: AppDecoration.primaryC7Main,
      width: double.maxFinite,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 54.h, vertical: 0.h),
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
                //             AcademicsLessonAllLessonsController lessonsController =
                // Get.find<AcademicsLessonAllLessonsController>();
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListline() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Obx(
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
                          child: ListlineItemLessonWidget(listlineItemModelObj),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
        ),
      ),
    );
  }
}
