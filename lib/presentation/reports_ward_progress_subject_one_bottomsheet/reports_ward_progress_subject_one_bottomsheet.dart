import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_page/controller/reports_ward_progress_subject_controller.dart';
import 'package:schulupparent/widgets/custom_elevated_button_sheet.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/reports_ward_progress_subject_one_controller.dart';
ReportsWardProgressSubjectController controllerx =
    Get.find<ReportsWardProgressSubjectController>();
DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();
// ignore_for_file: must_be_immutable
class ReportsWardProgressSubjectOneBottomsheet extends StatefulWidget {
  ReportsWardProgressSubjectOneBottomsheet(this.controller, {Key? key})
    : super(key: key);

  ReportsWardProgressSubjectOneController controller;

  @override
  State<ReportsWardProgressSubjectOneBottomsheet> createState() => _ReportsWardProgressSubjectOneBottomsheetState();
}

class _ReportsWardProgressSubjectOneBottomsheetState extends State<ReportsWardProgressSubjectOneBottomsheet> {
List<String> selectedType = [
    controllerx.selectedSubject?.name ?? '',
  ];

  List<int> selectedTypeID = [
    controllerx.selectedSubject?.subjectMasterID ?? 0,
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
                  "msg_select_a_subject".tr,
                  style: theme.textTheme.titleSmall,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  height: 24.h,
                  width: 24.h,
                  margin: EdgeInsets.only(left: 92.h),
                  onTap: () {
                    onTapImgCloseone();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          // Text(
          //   "lbl_civic_education".tr,
          //   style: CustomTextStyles.bodyMediumOnPrimary,
          // ),
          // SizedBox(height: 10.h),
          // CustomElevatedButton(
          //   text: "msg_christian_religious2".tr,
          //   margin: EdgeInsets.only(left: 20.h, right: 22.h),
          // ),
          // SizedBox(height: 10.h),
          // Text(
          //   "lbl_basic_science".tr,
          //   style: CustomTextStyles.bodyMediumOnPrimary,
          // ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controllerx.subjectDataList.length,
              itemBuilder: (context, index) {
                final subject = controllerx.subjectDataList[index];
                return GestureDetector(
                  onTap: () {
                    selectedType.clear();
selectedTypeID.clear();
                    
                    selectedTypeID.add(subject.subjectMasterID ?? 0);
                    selectedType.add(subject.name ?? '');

                    setState(() {});
                  },
                  child:
                      selectedType.contains(subject.name ?? '')
                          ? SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButtonSheet(
                              text: subject.name ?? '',
                              rightIcon: Icon(Icons.check),
                              //   margin: EdgeInsets.only(left: 62.h, right: 60.h),
                            ),
                          )
                          : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              subject.name ?? '',
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
              // controllerx.selectedSubject = controllerx.subjectDataList.firstWhere(
              //   (subject) => subject.subjectMasterID == selectedTypeID.first,
              //   orElse: () => controllerx.subjectDataList.first,
              // );
              controllerx.selectedSubjectId = selectedTypeID.first.toString();
              print(  controllerx.selectedSubjectId);
              Navigator.pop(context);
            },
            height: 64.h,
            text: "lbl_go_to_subject".tr,
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
