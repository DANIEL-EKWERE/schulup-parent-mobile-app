import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/academics_assignment_status_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

  var controller = Get.find<AcademicsAssignmentStatusController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder12,
      ),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
                      listlineItemModelObj.heading!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              listlineItemModelObj.subheading!.value,
              style: CustomTextStyles.bodySmallSecondaryContainer10,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
            decoration: AppDecoration.grayC7.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Obx(
              () => Text(
                listlineItemModelObj.dueOnNov52025!.value,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodySmallWhiteA700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
