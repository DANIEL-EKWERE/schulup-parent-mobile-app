// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:intl/intl.dart';
import 'package:schulupparent/student/student_presentation/news_all_variants_page/models/news_model.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/news_news_content_contains_controller.dart';
import 'models/listweburl_item_model.dart';
import 'widgets/listweburl_item_widget.dart'; // ignore_for_file: must_be_immutable
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();
NewsNewsContentContainsController controller = Get.put(
  NewsNewsContentContainsController(),
);

class NewsNewsContentContainsScreen extends StatefulWidget {
  const NewsNewsContentContainsScreen({Key? key}) : super(key: key);

  @override
  State<NewsNewsContentContainsScreen> createState() =>
      _NewsNewsContentContainsScreenState();
}

class _NewsNewsContentContainsScreenState
    extends State<NewsNewsContentContainsScreen> {
  @override
  void initState() {
    final newsItem = Get.arguments['newsItem'] as NewsItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsItem = Get.arguments['newsItem'] as NewsItem;
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CustomImageView(
                        //   imagePath: ImageConstant.imgImage63192x342,
                        //   height: 192.h,
                        //   width: double.maxFinite,
                        //   radius: BorderRadius.circular(4.h),
                        // ),
                        // SizedBox(height: 20.h),
                        Text(
                          newsItem.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleMediumOnPrimary.copyWith(
                            height: 1.47,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          formatDate(newsItem.createdAt),
                          style: CustomTextStyles.bodySmall10,
                        ),
                        SizedBox(height: 14.h),
                        // Text(
                        //   removeHtmlTags(newsItem.content),
                        //   maxLines: 10,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: theme.textTheme.bodySmall!.copyWith(
                        //     height: 1.50,
                        //   ),
                        // ),
                        html.Html(data: newsItem.content),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          newsItem.attachments.isNotEmpty ? _buildColumn(newsItem) : null,
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 59.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgArrowLeftWhiteA700,
        margin: EdgeInsets.only(left: 25.h, top: 22.h, bottom: 8.h),
        onTap: () {
          onTapArrowleftone();
        },
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "lbl_news".tr),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 6.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumn(NewsItem newsItem) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsets.all(20.h),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_attachments".tr,
                  style: CustomTextStyles.labelLargeBluegray700,
                ),
                // Obx(
                //   () =>
                ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 14.h);
                  },
                  itemCount: newsItem.attachments.length,
                  itemBuilder: (context, index) {
                    Attachment model = newsItem.attachments[index];
                    return ListweburlItemWidget(model);
                  },
                ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(Get.context!);
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('EEEE, MMM. d, yyyy').format(dateTime);
  }

  String removeHtmlTags(String htmlString) {
    final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return htmlString.replaceAll(regex, '').trim();
  }
}
