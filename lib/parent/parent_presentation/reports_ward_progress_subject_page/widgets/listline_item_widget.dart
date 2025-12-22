import 'package:flutter/material.dart';
import 'package:schulupparent/parent/parent_presentation/reports_ward_progress_class_page/models/class_overview_model.dart';
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
                Text(
                  "Ward Score",
                  style: CustomTextStyles.bodySmallGray700.copyWith(
                    fontSize: 16.h,
                  ),
                ),
                // ),
                _buildFrame427321469(listlineItemModelObj),
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
                  style: CustomTextStyles.bodySmallGray700.copyWith(
                    fontSize: 16.h,
                  ),
                  // ),
                ),
                _buildFrame427321470(listlineItemModelObj),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321469(SubjectProgressData model) {
    return Padding(
      padding: EdgeInsets.only(right: 10.h),
      child: Container(
        padding: EdgeInsets.only(top: 5.h, left: 10.h),
        width: model.studentScore != 0 ? model.classAverage! * 2 : 50.h,
        height: 30.h,
        decoration: BoxDecoration(
          color:
              model.classAverage! <= 50
                  ? appTheme.red500
                  : (model.classAverage! > 50 && model.classAverage! < 70)
                  ? appTheme.amber100
                  : appTheme.green500,
          borderRadius: BorderRadius.circular(12.h),
        ),
        // controller: listlineItemModelObj.studentScore.toString(),
        child: Text(
          listlineItemModelObj.studentScore.toString(),
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 16.h,
            color: Colors.white,
          ),
        ),
        // hintText: "lbl_91".tr,
        // contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        // borderDecoration: TextFormFieldStyleHelper.fillGreen,
        // fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321470(SubjectProgressData model) {
    return Padding(
      padding: EdgeInsets.only(right: 10.h),
      child: Container(
        padding: EdgeInsets.only(top: 5.h, left: 10.h),
        width: model.classAverage != 0 ? model.classAverage! * 2 : 50.h,
        height: 30.h,
        decoration: BoxDecoration(
          color:
              model.classAverage! <= 50
                  ? appTheme.red500
                  : (model.classAverage! > 50 && model.classAverage! < 70)
                  ? appTheme.amber100
                  : appTheme.green500,
          borderRadius: BorderRadius.circular(12.h),
        ),
        // controller: listlineItemModelObj.studentScore.toString(),
        child: Text(
          listlineItemModelObj.classAverage.toString(),
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 16.h,
            color: Colors.white,
          ),
        ),
        // hintText: "lbl_91".tr,
        // contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        // borderDecoration: TextFormFieldStyleHelper.fillGreen,
        // fillColor: appTheme.green500,
      ),
    );
  }
}
