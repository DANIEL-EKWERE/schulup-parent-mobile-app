import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/presentation/academics_lesson_cbt_test_page/controller/academics_lesson_cbt_test_controller.dart';
import 'package:schulupparent/widgets/custom_elevated_button_sheet.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/academics_cbt_test_modal_one_controller.dart';

// ignore_for_file: must_be_immutable

AcademicsAssignmentStatusController controller1 = Get.put(
  AcademicsAssignmentStatusController(),
);

AcademicsLessonCbtTestController controls =
    Get.find<AcademicsLessonCbtTestController>();

class AcademicsCbtTestModalOneBottomsheet extends StatefulWidget {
  AcademicsCbtTestModalOneBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsCbtTestModalOneController controller;

  @override
  State<AcademicsCbtTestModalOneBottomsheet> createState() =>
      _AcademicsCbtTestModalOneBottomsheetState();
}

class _AcademicsCbtTestModalOneBottomsheetState
    extends State<AcademicsCbtTestModalOneBottomsheet> {
  List<String> type = ["lbl_scheduled_test".tr, "lbl_test_result".tr];
  List<String> selectedType = [controller1.cbtType.value];

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "lbl_select_a_status".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 24.h,
                  margin: EdgeInsets.only(left: 96.h),
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),

          // CustomElevatedButton(
          //   text: "lbl_scheduled_test".tr,
          //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
          // ),
          // SizedBox(height: 10.h),
          // Text(
          //   "lbl_test_result".tr,
          //   style: CustomTextStyles.bodyMediumOnPrimary,
          // ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: type.length,
              itemBuilder: (context, index) {
                var text = type[index];
                return GestureDetector(
                  onTap: () {
                    selectedType.clear();
                    selectedType.add(text);

                    setState(() {});
                  },
                  child:
                      selectedType.contains(text)
                          ? SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButtonSheet(
                              text: text,
                              rightIcon: Icon(Icons.check),
                              //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
                            ),
                          )
                          : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              text,
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
              setState(() {
                controller1.cbtType.value = selectedType.first;
              });
              controller1.getCbt();
              if (controller1.cbtType.value == 'Test Result') {
                controller1.getCbtResult();
                controls.getCbtResult();
                return;
              }
              controls.getCbt();
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
    // Get.back();
    Navigator.pop(context);
  }
}
