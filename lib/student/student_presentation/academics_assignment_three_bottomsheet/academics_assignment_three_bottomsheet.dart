import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/widgets/custom_elevated_button_sheet.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/academics_assignment_modal_three_controller.dart';

// ignore_for_file: must_be_immutable
AcademicsAssignmentStatusController controller1 = Get.put(
  AcademicsAssignmentStatusController(),
);

class AcademicsAssignmentModalThreeBottomsheet extends StatefulWidget {
  AcademicsAssignmentModalThreeBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsAssignmentModalThreeController controller;

  @override
  State<AcademicsAssignmentModalThreeBottomsheet> createState() =>
      _AcademicsAssignmentModalThreeBottomsheetState();
}

class _AcademicsAssignmentModalThreeBottomsheetState
    extends State<AcademicsAssignmentModalThreeBottomsheet> {
  List<String> type = [
    "lbl_all".tr,
    "lbl_overdue".tr,
    "lbl_pending".tr,
    "lbl_submitted".tr,
  ];
  List<String> selectedType = [controller1.searchStatus.value];

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
          //   text: "lbl_all".tr,
          //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
          // ),
          // SizedBox(height: 10.h),
          // Text("lbl_overdue".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          // SizedBox(height: 12.h),
          // Text("lbl_pending".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          // SizedBox(height: 10.h),
          // Text("lbl_submitted".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(
            height: 120,
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
                controller1.searchStatus.value = selectedType.first;
              });
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
