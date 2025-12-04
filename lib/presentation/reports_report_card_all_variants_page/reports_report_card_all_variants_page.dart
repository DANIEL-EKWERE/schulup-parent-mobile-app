// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/presentation/reports_report_card_all_variants_page/models/report_model.dart';
import 'package:schulupparent/presentation/reports_report_card_all_variants_page/widgets/listline_item_widget_weekly.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_bottomsheet/controller/reports_report_card_modal_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_bottomsheet/reports_report_card_modal_bottomsheet.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_one_bottomsheet/controller/reports_report_card_modal_one_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_one_bottomsheet/reports_report_card_modal_one_bottomsheet.dart';
import 'package:schulupparent/presentation/signin_screen/shimmer_widget.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/reports_report_card_all_variants_controller.dart';
import 'models/listline_item_model.dart';
import 'models/reports_report_card_all_variants_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class ReportsReportCardAllVariantsPage extends StatelessWidget {
  ReportsReportCardAllVariantsPage({Key? key}) : super(key: key);

  ReportsReportCardAllVariantsController controller = Get.put(
    ReportsReportCardAllVariantsController(
      ReportsReportCardAllVariantsModel().obs,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SafeArea(
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.onrefresh,
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.grayC13,
              child: Column(
                children: [
                  _buildColumnreportcar(),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [SizedBox(height: 14.h), _buildListline()],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnreportcar() {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            height: 36.h,
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_report_card".tr),
                AppbarSubtitleFive(
                  text:
                      dashboardExtendedViewController
                          .selectedStudent1!
                          .firstName!,
                  margin: EdgeInsets.symmetric(horizontal: 33.h),
                ),
              ],
            ),
            actions: [
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgIconsSmallWardProgress,
                margin: EdgeInsets.only(right: 25.h, bottom: 1.h),
              ),
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => Container(
                margin: EdgeInsets.symmetric(horizontal: 86.h),
                child: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  dividerColor: Colors.transparent,
                  controller: controller.tabviewController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: theme.colorScheme.onPrimary,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 0
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("Daily"),
                        ),
                      ),
                    ),
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 1
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("Weekly"),
                        ),
                      ),
                    ),
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 2
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("Termly"),
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    controller.tabIndex.value = index;
                  },
                ),
              ),
            ),
          ),
          // SizedBox(height: 28.h),
          Container(
            decoration: AppDecoration.outline,
            width: double.maxFinite,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 54.h,
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: Get.context!,
                            builder: (context) {
                              return ReportsReportCardModalBottomsheet(
                                ReportsReportCardModalController(),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Obx(() {
                              return Text(
                                // "lbl_first_term".tr,
                                controller.termType.value,
                                style: theme.textTheme.labelLarge,
                              );
                            }),
                            CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyDown,
                              height: 16.h,
                              width: 18.h,
                              margin: EdgeInsets.only(left: 10.h),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: Get.context!,
                            builder: (context) {
                              return ReportsReportCardModalOneBottomsheet(
                                ReportsReportCardModalOneController(),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Obx(() {
                              return Text(
                                controller.dayType.value,
                                style: theme.textTheme.labelLarge,
                              );
                            }),
                            CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyDown,
                              height: 16.h,
                              width: 18.h,
                              margin: EdgeInsets.only(left: 10.h, right: 14.h),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                : controller.dayType.value == 'Daily'
                ? ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount:
                      controller
                          .reportsReportCardAllVariantsModelObj
                          .value
                          .listlineItemList
                          .value
                          .length,
                  itemBuilder: (context, index) {
                    ListlineItemModel model =
                        controller
                            .reportsReportCardAllVariantsModelObj
                            .value
                            .listlineItemList
                            .value[index];
                    return ListlineItemWidget(model);
                  },
                )
                : controller.dayType.value == 'Weekly'
                ? ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: controller.reportDataList.length,
                  itemBuilder: (context, index) {
                    ReportData model = controller.reportDataList[index];
                    return ListlineItemWeeklyWidget(model);
                  },
                )
                : ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: controller.reportDataList.length,
                  itemBuilder: (context, index) {
                    ReportData model = controller.reportDataList[index];
                    return ListlineItemWeeklyWidget(model);
                  },
                ),
      ),
    );
  }
}
