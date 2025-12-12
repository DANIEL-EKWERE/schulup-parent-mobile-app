import 'package:flutter/material.dart';
import 'package:schulupparent/parent/parent_presentation/reports_ward_progress_subject_page/models/subject_progress_model.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controller/reports_ward_progress_subject_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  SubjectProgressData listlineItemModelObj;

  var controller = Get.find<ReportsWardProgressSubjectController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child:
                  //  Obx(
                  //   () =>
                  Text(
                    listlineItemModelObj.className!,
                    style: theme.textTheme.bodyMedium,
                  ),
                  // ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Obx(
                //   () =>
                Text("Ward Score", style: CustomTextStyles.bodySmallGray700),
                // ),
                _buildFrame427321469(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Obx(
                //   () =>
                Text(
                  "Class Average",
                  style: CustomTextStyles.bodySmallGray700,
                  // ),
                ),
                _buildFrame427321470(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321469() {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: Container(
        width: 222.h,
        height: 30.h,
        decoration: BoxDecoration(
          color: appTheme.green500,
          borderRadius: BorderRadius.circular(12.h),
        ),
        // controller: listlineItemModelObj.studentScore.toString(),
        child: Text(
          listlineItemModelObj.studentScore.toString(),
          style: theme.textTheme.bodySmall,
        ),
        // hintText: "lbl_91".tr,
        // contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        // borderDecoration: TextFormFieldStyleHelper.fillGreen,
        // fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321470() {
    return Padding(
      padding: EdgeInsets.only(right: 30.h),
      child: Container(
        width: 222.h,
        height: 30.h,
        decoration: BoxDecoration(
          color: appTheme.green500,
          borderRadius: BorderRadius.circular(12.h),
        ),
        // controller: listlineItemModelObj.studentScore.toString(),
        child: Text(
          listlineItemModelObj.classAverage.toString(),
          style: theme.textTheme.bodySmall,
        ),
        // hintText: "lbl_91".tr,
        // contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        // borderDecoration: TextFormFieldStyleHelper.fillGreen,
        // fillColor: appTheme.green500,
      ),
    );
  }
}
