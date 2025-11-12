import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controller/reports_ward_progress_subject_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

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
                  child: Obx(
                    () => Text(
                      listlineItemModelObj.primary5a!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
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
                Obx(
                  () => Text(
                    listlineItemModelObj.wardscore!.value,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                ),
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
                Obx(
                  () => Text(
                    listlineItemModelObj.classaverage!.value,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
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
      child: CustomTextFormField(
        width: 222.h,
        controller: listlineItemModelObj.frame427321469Controller,
        hintText: "lbl_91".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillGreen,
        fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321470() {
    return Padding(
      padding: EdgeInsets.only(right: 30.h),
      child: CustomTextFormField(
        width: 212.h,
        controller: listlineItemModelObj.frame427321470Controller,
        hintText: "lbl_87".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
    );
  }
}
