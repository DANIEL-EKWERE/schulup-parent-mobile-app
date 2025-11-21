// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/reports_report_card_all_variants_page/widgets/listline_item_widget_weekly.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_bottomsheet/controller/reports_report_card_modal_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_bottomsheet/reports_report_card_modal_bottomsheet.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_one_bottomsheet/controller/reports_report_card_modal_one_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_modal_one_bottomsheet/reports_report_card_modal_one_bottomsheet.dart';
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
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
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
                  text: "lbl_ogechi".tr,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC13.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2022_2023".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC13.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2023_2024".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC13.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2024_2025".tr,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 10.h,
                    ),
                    decoration: AppDecoration.grayC2.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder18,
                    ),
                    child: Text(
                      "lbl_2025_2026".tr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            controller.dayType.value == 'Daily'
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
                : ListView.separated(
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
                          .listlineItemWeeklyList
                          .value
                          .length,
                  itemBuilder: (context, index) {
                    ListlineItemModel model =
                        controller
                            .reportsReportCardAllVariantsModelObj
                            .value
                            .listlineItemWeeklyList
                            .value[index];
                    return ListlineItemWeeklyWidget(model);
                  },
                ),
      ),
    );
  }
}
