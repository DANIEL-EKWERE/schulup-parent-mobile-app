import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_page/controller/academics_assignment_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_page/models/academics_assignment_model.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_cbt_test_page/controller/academics_lesson_cbt_test_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_cbt_test_page/models/academics_lesson_cbt_test_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/widgets/custom_elevated_button_sheet.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/academics_assignment_modal_controller.dart';

// ignore_for_file: must_be_immutable
AcademicsAssignmentStatusController controller1 = Get.put(
  AcademicsAssignmentStatusController(),
);
AcademicsLessonCbtTestController controls = Get.put(
  AcademicsLessonCbtTestController(AcademicsLessonCbtTestModel().obs),
);
DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();
AcademicsLessonAllLessonsController lessonsController =
    Get.find<AcademicsLessonAllLessonsController>();
AcademicsAssignmentController controllers =
    Get.put(AcademicsAssignmentController(AcademicsAssignmentModel().obs));

class AcademicsAssignmentModalBottomsheet extends StatefulWidget {
  AcademicsAssignmentModalBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsAssignmentModalController controller;

  @override
  State<AcademicsAssignmentModalBottomsheet> createState() =>
      _AcademicsAssignmentModalBottomsheetState();
}

class _AcademicsAssignmentModalBottomsheetState
    extends State<AcademicsAssignmentModalBottomsheet> {
  List<String> type = [
    "lbl_primary_5".tr,
    "lbl_primary_4".tr,
    "lbl_primary_3".tr,
  ];

  List<int> selectedTypeID = [
    dashboardExtendedViewController.selectedClassID ?? 0,
  ];

  List<String> selectedType = [controller1.classType!.value];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.grayC13.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 52.h,
            child: Divider(
              thickness: 5,
              radius: BorderRadius.circular(12),
              color: appTheme.gray20001,
            ),
          ),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 124.h),
                    child: Text(
                      "lbl_select_a_class".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 26.h,
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          SizedBox(
            height: 90,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: dashboardExtendedViewController.classDataList.length,
              itemBuilder: (context, index) {
                var text = dashboardExtendedViewController.classDataList[index];
                return GestureDetector(
                  onTap: () {
                    selectedType.clear();
                    selectedTypeID.clear();

                    selectedTypeID.add(text.classID!);
                    selectedType.add(text.name!);

                    setState(() {});
                  },
                  child:
                      selectedType.contains(text.name!)
                          ? SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButtonSheet(
                              text: text.name!,
                              rightIcon: Icon(Icons.check),
                              //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
                            ),
                          )
                          : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              text.name!,
                              style: CustomTextStyles.bodyMediumOnPrimary,
                            ),
                          ),
                );
              },
            ),
          ),

          // CustomElevatedButton(
          //   text: "lbl_primary_5".tr,
          //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
          // ),
          // SizedBox(height: 10.h),
          // Text("lbl_primary_4".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          // SizedBox(height: 12.h),
          // Text("lbl_primary_3".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(height: 30.h),
          CustomElevatedButton(
            onPressed: () {
              //Get.back();

              print('object');
              setState(() {
                controller1.classType.value = selectedType.first;
                dashboardExtendedViewController.selectedClassID =
                    selectedTypeID.first;
                controller1.getAssignment();
                controller1.allLessons();
                controller1.getCbt();
                lessonsController.allLessons();
                controls.getCbt();
              });
              // Get.back();
              controllers.getAssignment();
              Navigator.pop(context);
            },
            height: 64.h,
            text: "lbl_confirm".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: theme.textTheme.titleMedium!,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgCloseone() {
    Get.back();
  }
}
