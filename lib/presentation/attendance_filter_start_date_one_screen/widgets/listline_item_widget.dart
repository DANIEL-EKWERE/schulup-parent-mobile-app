// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controller/attendance_filter_start_date_one_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

  var controller = Get.find<AttendanceFilterStartDateOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 8,
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
                      listlineItemModelObj.thursdayaugtwen!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              spacing: 4,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          listlineItemModelObj.dropoff!.value,
                          style: CustomTextStyles.bodySmallOnPrimary,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.h,
                          vertical: 8.h,
                        ),
                        decoration: AppDecoration.errorC1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Obx(
                          () => Text(
                            listlineItemModelObj.time!.value,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          listlineItemModelObj.pickup!.value,
                          style: CustomTextStyles.bodySmallOnPrimary,
                        ),
                      ),
                      _buildTimeone(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTimeone() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: listlineItemModelObj.timeoneController,
      hintText: "lbl_2_30_pm".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }
}
