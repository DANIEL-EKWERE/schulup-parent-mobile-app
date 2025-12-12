// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/reports_report_card_all_variants_page/controller/reports_report_card_all_variants_controller.dart';
import 'package:schulupparent/student/widgets/custom_elevated_button_sheet.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/reports_report_card_modal_one_controller.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

// ignore_for_file: must_be_immutable
class ReportsReportCardModalOneBottomsheet extends StatefulWidget {
  ReportsReportCardModalOneBottomsheet(this.controller, {Key? key})
    : super(key: key);

  ReportsReportCardModalOneController controller;

  @override
  State<ReportsReportCardModalOneBottomsheet> createState() =>
      _ReportsReportCardModalOneBottomsheetState();
}

class _ReportsReportCardModalOneBottomsheetState
    extends State<ReportsReportCardModalOneBottomsheet> {
  List<String> type = ["lbl_daily".tr, "lbl_weekly".tr, "lbl_termly".tr];
  List<String> selectedType = ['Daily'];
  ReportsReportCardAllVariantsController controller1 =
      Get.find<ReportsReportCardAllVariantsController>();

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
            child: SizedBox(
              width: 52.h,
              child: Divider(
                thickness: 5,
                radius: BorderRadius.circular(12),
                color: appTheme.gray20001,
              ),
            ),
          ),
          SizedBox(height: 18.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "msg_select_a_report".tr,
                  style: theme.textTheme.titleSmall,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 24.h,
                  margin: EdgeInsets.only(left: 78.h),
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),

          // Text("lbl_daily".tr, style: CustomTextStyles.bodyMediumOnPrimary),
          // SizedBox(height: 10.h),
          // CustomElevatedButton(
          //   text: "lbl_weekly".tr,
          //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
          // ),
          // SizedBox(height: 10.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     CustomImageView(
          //       imagePath: ImageConstant.imgIconsTinyLock,
          //       height: 16.h,
          //       width: 16.h,
          //     ),
          // Text(
          //   "lbl_termly".tr,
          //   style: CustomTextStyles.bodyMediumOnPrimary,
          // ),
          //   ],
          // ),
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
              setState(() {
                controller1.dayType.value = selectedType.first;
              });

              if (controller1.dayType.value.contains('Daily')) {
                controller1.getDailyReports();
              } else if (controller1.dayType.value.contains('Weekly')) {
                controller1.getWeeklyReports();
              } else if (controller1.dayType.value.contains('Termly')) {
                controller1.getTermlyReports();
              }

              // Get.back();
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
