import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/widgets/custom_elevated_button_sheet.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/academics_assignment_modal_two_controller.dart';

// ignore_for_file: must_be_immutable

AcademicsAssignmentStatusController controller1 = Get.put(
  AcademicsAssignmentStatusController(),
);

class AcademicsAssignmentModalTwoBottomsheet extends StatefulWidget {
  AcademicsAssignmentModalTwoBottomsheet(this.controller, {Key? key})
    : super(key: key);

  AcademicsAssignmentModalTwoController controller;

  @override
  State<AcademicsAssignmentModalTwoBottomsheet> createState() =>
      _AcademicsAssignmentModalTwoBottomsheetState();
}

class _AcademicsAssignmentModalTwoBottomsheetState
    extends State<AcademicsAssignmentModalTwoBottomsheet> {
  List<String> type = ["lbl_pending".tr, "lbl_submitted".tr];
  List<String> selectedType = [controller1.statusType.value];

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
          //   text: "lbl_pending".tr,
          //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
          // ),
          // SizedBox(height: 10.h),
          // Text("lbl_submitted".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          SizedBox(
            height: 90,
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
              controller1.statusType.value = selectedType.first;
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
