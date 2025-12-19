// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/reports_ward_progress_class_page/controller/reports_ward_progress_class_controller.dart';
import 'package:schulupparent/student/widgets/custom_elevated_button_sheet.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/reports_ward_progress_class_one_controller.dart';

// ignore_for_file: must_be_immutable
ReportsWardProgressClassController controller =
    Get.find<ReportsWardProgressClassController>();
StudentDashboardExtendedViewController dashboardExtendedViewController =
    Get.find<StudentDashboardExtendedViewController>();

class ReportsWardProgressClassOneBottomsheet extends StatefulWidget {
  ReportsWardProgressClassOneBottomsheet(this.controller, {Key? key})
    : super(key: key);

  ReportsWardProgressClassOneController controller;

  @override
  State<ReportsWardProgressClassOneBottomsheet> createState() =>
      _ReportsWardProgressClassOneBottomsheetState();
}

class _ReportsWardProgressClassOneBottomsheetState
    extends State<ReportsWardProgressClassOneBottomsheet> {
  List<String> type = [
    "msg_primary_5a_first".tr,
    "msg_primary_4a_third",
    "msg_primary_4a_second".tr,
  ];

  List<String> selectedType = [
    dashboardExtendedViewController.batchDataList.first.name!,
  ];
  List<int> selectedTypeId = [
    dashboardExtendedViewController.batchDataList.first.batchID!,
  ];

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
          SizedBox(width: 52.h, child: Divider(color: appTheme.gray20001)),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "msg_jump_to_a_period".tr,
                  style: theme.textTheme.titleSmall,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 24.h,
                  margin: EdgeInsets.only(left: 90.h),
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),

          // Text(
          //   "msg_primary_5a_first".tr,
          //   style: CustomTextStyles.bodyMediumOnPrimary,
          // ),
          // SizedBox(height: 10.h),
          // CustomElevatedButton(
          //   text: "msg_primary_4a_third".tr,
          //   margin: EdgeInsets.only(left: 20.h, right: 22.h),
          // ),
          // SizedBox(height: 10.h),
          // Text(
          //   "msg_primary_4a_second".tr,
          //   style: CustomTextStyles.bodyMediumOnPrimary,
          // ),
          // SizedBox(height: 30.h),
          // CustomElevatedButton(
          //   height: 64.h,
          //   text: "lbl_jump_to_period".tr,
          //   buttonStyle: CustomButtonStyles.fillPrimary,
          //   buttonTextStyle: theme.textTheme.titleMedium!,
          // ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: dashboardExtendedViewController.batchDataList.length,
              itemBuilder: (context, index) {
                var text = dashboardExtendedViewController.batchDataList[index];
                return GestureDetector(
                  onTap: () {
                    selectedType.clear();
                    selectedTypeId.clear();
                    selectedTypeId.add(text.batchID!);
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
          SizedBox(height: 30.h),
          CustomElevatedButton(
            onPressed: () {
              print(selectedType.first);
              controller.selectedBatch.value = selectedType.first;
              controller.selectedBatchId.value = selectedTypeId.first;
              print(controller.selectedBatchId.value);
              controller.classOverview();
              // Get.back();
              Navigator.of(context); //
            },
            height: 64.h,
            text: "lbl_jump_to_period".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: theme.textTheme.titleMedium!,
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgCloseone() {
    Get.back();
  }
}
