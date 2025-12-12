// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/news_filter_result_controller.dart';
import '../models/listyellowhouse_item_model.dart';

// ignore_for_file: must_be_immutable
class ListyellowhouseItemWidget extends StatelessWidget {
  ListyellowhouseItemWidget(this.listyellowhouseItemModelObj, {Key? key})
    : super(key: key);

  ListyellowhouseItemModel listyellowhouseItemModelObj;

  var controller = Get.find<NewsFilterResultController>();

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
          Obx(
            () => CustomImageView(
              imagePath: listyellowhouseItemModelObj.image!.value,
              height: 170.h,
              width: double.maxFinite,
              radius: BorderRadius.circular(5.h),
            ),
          ),
          Obx(
            () => Text(
              listyellowhouseItemModelObj.yellowhouse!.value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.50),
            ),
          ),
          Obx(
            () => Text(
              listyellowhouseItemModelObj.itwas!.value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodySmallSecondaryContainer.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconsTinyAttachment,
                  height: 16.h,
                  width: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Obx(
                    () => Text(
                      listyellowhouseItemModelObj.attachments!.value,
                      style: CustomTextStyles.bodySmallSecondaryContainer10,
                    ),
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
