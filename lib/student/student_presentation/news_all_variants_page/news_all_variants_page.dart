// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/student/student_presentation/news_all_variants_page/models/news_model.dart';
import 'package:schulupparent/student/student_presentation/news_events_screen/news_events_screen.dart';
import 'package:schulupparent/student/student_presentation/news_modal_jump_to_a_date_bottomsheet/controller/news_modal_jump_to_a_date_controller.dart';
import 'package:schulupparent/student/student_presentation/news_modal_jump_to_a_date_bottomsheet/news_modal_jump_to_a_date_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/news_news_content_contains_screen/widgets/shimmer_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/news_all_variants_controller.dart';
import 'models/news_all_item_model.dart';
import 'models/news_all_variants_model.dart';
import 'widgets/news_all_item_widget.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';

StudentDashboardExtendedViewController dashboardExtendedViewController =
    Get.find<StudentDashboardExtendedViewController>();

// ignore_for_file: must_be_immutable
class NewsAllVariantsPage extends StatelessWidget {
  NewsAllVariantsPage({Key? key}) : super(key: key);

  NewsAllVariantsController controller = Get.put(
    NewsAllVariantsController(NewsAllVariantsModel().obs),
  );
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  void _onrefresh() {
    controller.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: _onrefresh,
          enablePullDown: true,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 10.h, top: 14.h, right: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [_buildNewsall()],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
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
      actions: [
        AppbarTrailingIconbutton(
          onTap: () {
            //Get.toNamed(AppRoutes.newsEventsScreen);
            // controller.getNews();
            Get.to(() => StudentNewsEventsScreen());
          },
          imagePath: ImageConstant.imgIconsSmallEvents,
        ),
        SizedBox(width: 16),
        // AppbarTrailingIconbutton(
        //   onTap: () {
        //     showModalBottomSheet(
        //       context: Get.context!,
        //       builder: (context) {
        //         return NewsModalJumpToADateBottomsheet(
        //           NewsModalJumpToADateController(),
        //         );
        //       },
        //     );
        //   },
        //   imagePath: ImageConstant.imgUserWhiteA700,
        //   margin: EdgeInsets.only(left: 11.h, right: 25.h),
        // ),
      ],
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildNewsall() {
    return Expanded(
      child: Obx(
        () =>
            controller.isLoading.value
                ? ListView.separated(
                  itemCount: 5,
                  //isLoading ? 5 : newsItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    // if (isLoading) {
                    return NewsShimmerWidget();
                    // }
                    // return ListlineItemWidget(newsItems[index]);
                  },
                )
                : controller.newsItems!.isEmpty
                ? Center(
                  child: Column(
                    spacing: 30,
                    children: [
                      SizedBox(height: 150.h),
                      CustomImageView(imagePath: ImageConstant.imgObjects),
                      Text(
                        textAlign: TextAlign.center,
                        '🔍 No results found Try adjusting your search or filters',
                        style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
                          fontSize: 16.h,
                        ),
                      ),
                    ],
                  ),
                )
                : ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: controller.newsItems!.length,

                  // .newsAllVariantsModelObj
                  // .value
                  // .newsAllItemList
                  // .value
                  // .length,
                  itemBuilder: (context, index) {
                    NewsItem model = controller.newsItems![index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.newsNewsContentContainsScreen,
                          arguments: {'newsItem': model},
                        );
                      },
                      child: NewsAllItemWidget(model),
                    );
                  },
                ),
      ),
    );
  }
}
