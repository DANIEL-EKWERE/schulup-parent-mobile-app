import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/reports_report_card_all_variants_one_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

  var controller = Get.find<ReportsReportCardAllVariantsOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      listlineItemModelObj.week6primary!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsTinyDownload,
                  height: 16.h,
                  width: 18.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsTinyShare,
                  height: 16.h,
                  width: 18.h,
                  margin: EdgeInsets.only(left: 14.h),
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              listlineItemModelObj.mondayoctsix!.value,
              style: CustomTextStyles.bodySmallSecondaryContainer10,
            ),
          ),
        ],
      ),
    );
  }
}
