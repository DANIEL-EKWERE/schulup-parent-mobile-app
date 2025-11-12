// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/news_all_variants_controller.dart';
import '../models/news_all_item_model.dart';

// ignore_for_file: must_be_immutable
class NewsAllItemWidget extends StatelessWidget {
  NewsAllItemWidget(this.newsAllItemModelObj, {Key? key}) : super(key: key);

  NewsAllItemModel newsAllItemModelObj;

  var controller = Get.find<NewsAllVariantsController>();

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
          CustomImageView(
            imagePath: ImageConstant.imgImage62,
            height: 170.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(5.h),
          ),
          SizedBox(
            width: 252.h,
            child: Obx(
              () => Text(
                newsAllItemModelObj.gracelandhosts!.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.50),
              ),
            ),
          ),
          Obx(
            () => Text(
              newsAllItemModelObj.students!.value,
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
                      newsAllItemModelObj.attachments!.value,
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
