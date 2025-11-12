import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/news_events_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

  var controller = Get.find<NewsEventsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 10,
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
                      listlineItemModelObj.mondaynovthree!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgClosePrimary,
                        height: 16.h,
                        width: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Obx(
                          () => Text(
                            listlineItemModelObj.label!.value,
                            style: CustomTextStyles.labelMediumPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              listlineItemModelObj.secondterm!.value,
              style: CustomTextStyles.bodyMediumSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
