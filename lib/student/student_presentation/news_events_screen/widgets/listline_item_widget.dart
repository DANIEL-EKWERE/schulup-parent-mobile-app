import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/news_events_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;
  var controller = Get.find<StudentNewsEventsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image/Icon on the left
          Container(
            padding: EdgeInsets.all(8),
            width: 40.h,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xffFFEED4),
              shape: BoxShape.circle,
            ),
            child: CustomImageView(imagePath: ImageConstant.imgEvents),
          ),

          SizedBox(width: 10.h),

          // Content column on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row with date and label
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        listlineItemModelObj.mondaynovthree!.value,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgClosePrimary,
                          height: 16.h,
                          width: 16.h,
                        ),
                        SizedBox(width: 4.h),
                        Obx(
                          () => Text(
                            listlineItemModelObj.label!.value,
                            style: CustomTextStyles.labelMediumPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Description text
                Obx(
                  () => Text(
                    listlineItemModelObj.secondterm!.value,
                    style: CustomTextStyles.bodyMediumSecondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
