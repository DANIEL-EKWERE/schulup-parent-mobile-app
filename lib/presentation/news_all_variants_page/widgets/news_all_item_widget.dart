// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:schulupparent/presentation/news_all_variants_page/models/news_model.dart';
import '../../../core/app_export.dart';
import '../controller/news_all_variants_controller.dart';
import '../models/news_all_item_model.dart';

// ignore_for_file: must_be_immutable
class NewsAllItemWidget extends StatelessWidget {
  NewsAllItemWidget(this.newsAllItemModelObj, {Key? key}) : super(key: key);

  // NewsAllItemModel newsAllItemModelObj;

  NewsItem newsAllItemModelObj;

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
          // CustomImageView(
          //   imagePath: ImageConstant.imgImage62,
          //   height: 170.h,
          //   width: double.maxFinite,
          //   radius: BorderRadius.circular(5.h),
          // ),
          SizedBox(
            width: double.infinity,
            child:
            //  Obx(
            //   () =>
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.h),
                  decoration: BoxDecoration(
                    color: Color(0xffFFEED4),

                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    imagePath: 'assets/images/img_icons_small_news.png',
                  ),
                  // CustomImageView(
                  //   imagePath:   dashboardItemModelObj.imagePath,
                  //   height: 40.h,
                  //   width: 40.h,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 250.h,
                    child: Text(
                      newsAllItemModelObj.title,
                      //gracelandhosts!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        height: 1.50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //   ),
          ),
          // Obx(
          //   () =>
          Text(
            removeHtmlTags(newsAllItemModelObj.content),
            //.students!.value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodySmallSecondaryContainer.copyWith(
              height: 1.50,
            ),
          ),
          // Html(
          //   data: newsAllItemModelObj.content,
          //   style: {
          //     "body": Style(
          //       maxLines: 2,
          //       textOverflow: TextOverflow.ellipsis,
          //       fontSize: FontSize(12.0),
          //       fontWeight: FontWeight.w400,
          //       lineHeight: LineHeight(1.5),
          //       color: theme.colorScheme.secondaryContainer,
          //     ),
          //   },
          // ),
          // ),
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
                  child:
                  //  Obx(
                  //   () =>
                  Text(
                    newsAllItemModelObj.attachments!.length.toString() +
                        ' ' +
                        'lbl_attachments'.tr,
                    style: CustomTextStyles.bodySmallSecondaryContainer10,
                  ),
                  //),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String removeHtmlTags(String htmlString) {
    final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return htmlString.replaceAll(regex, '').trim();
  }
}
