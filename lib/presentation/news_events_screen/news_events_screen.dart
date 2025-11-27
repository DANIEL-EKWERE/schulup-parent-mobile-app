// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/presentation/news_events_screen/models/events_model.dart';
import 'package:schulupparent/presentation/news_events_screen/widgets/event_widget.dart';
import 'package:schulupparent/presentation/signin_screen/shimmer_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/news_events_controller.dart';
import 'models/listjuncounter_item_model.dart';
import 'models/listline_item_model.dart';
import 'widgets/listjuncounter_item_widget.dart';
import 'widgets/listline_item_widget.dart'; // ignore_for_file: must_be_immutable
import 'package:intl/intl.dart';

class NewsEventsScreen extends GetWidget<NewsEventsController> {
  const NewsEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.onrefresh,
        child: SafeArea(
          top: false,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              spacing: 14,
              children: [_buildColumnarrowleft(), _buildListline()],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnarrowleft() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            height: 38.h,
            leadingWidth: 59.h,
            leading: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              margin: EdgeInsets.only(left: 25.h, top: 1.h, bottom: 2.h),
              onTap: () {
                onTapArrowleftone();
              },
            ),
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_events".tr),
                AppbarSubtitleFive(
                  text: "lbl_ogechi".tr,
                  margin: EdgeInsets.symmetric(horizontal: 12.h),
                ),
              ],
            ),
          ),
          Container(
            child:
            //  Obx(
            //   () =>
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 4.h,
                children: List.generate(getMonths().length, (index) {
                  String model = getMonths()[index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectedMonth.value = model;
                      controller.eventsByDateRange(model, '');
                      // print(model);
                    },
                    child: ListjuncounterItemWidget(model),
                  );
                }),
              ),
            ),
            // ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildListline() {
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
                    return ListlineShimmerWidget();
                    // }
                    // return ListlineItemWidget(newsItems[index]);
                  },
                )
                : ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: controller.eventItems?.length ?? 0,
                  itemBuilder: (context, index) {
                    EventItem model = controller.eventItems![index];
                    return EventWidget(model);
                  },
                ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(Get.context!);
    // controller.getEvents();
  }

  List<String> getMonths() {
    final currentYear = DateTime.now().year;

    return List.generate(12, (index) {
      final date = DateTime(currentYear, index + 1, 1);
      return DateFormat('MMMM yyyy').format(date);
    });
  }
}
