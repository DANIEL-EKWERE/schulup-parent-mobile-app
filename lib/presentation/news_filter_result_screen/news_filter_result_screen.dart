// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../attendance_all_variants_page/attendance_all_variants_page.dart';
import '../news_all_variants_page/news_all_variants_page.dart';
import '../reports_report_card_all_variants_page/reports_report_card_all_variants_page.dart';
import 'controller/news_filter_result_controller.dart';
import 'models/listyellowhouse_item_model.dart';
import 'widgets/listyellowhouse_item_widget.dart'; // ignore_for_file: must_be_immutable

class NewsFilterResultScreen extends GetWidget<NewsFilterResultController> {
  const NewsFilterResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnnewsfour(),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [SizedBox(height: 14.h), _buildListyellowhouse()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottombar(),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnnewsfour() {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 4,
        children: [
          CustomAppBar(
            height: 38.h,
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_news".tr),
                AppbarSubtitleFive(
                  text: "lbl_ogechi".tr,
                  margin: EdgeInsets.symmetric(horizontal: 6.h),
                ),
              ],
            ),
            actions: [
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgIconsSmallEvents,
              ),
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgUserWhiteA700,
                margin: EdgeInsets.only(left: 11.h, right: 25.h),
              ),
            ],
          ),
          Container(
            decoration: AppDecoration.outline,
            width: double.maxFinite,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.h,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "msg_showing_news_starting".tr,
                        style: CustomTextStyles.bodySmallWhiteA700,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgIconsTinyRefresh,
                            height: 16.h,
                            width: 16.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              "lbl_reset".tr,
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                        ],
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
  Widget _buildListyellowhouse() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemCount:
              controller
                  .newsFilterResultModelObj
                  .value
                  .listyellowhouseItemList
                  .value
                  .length,
          itemBuilder: (context, index) {
            ListyellowhouseItemModel model =
                controller
                    .newsFilterResultModelObj
                    .value
                    .listyellowhouseItemList
                    .value[index];
            return ListyellowhouseItemWidget(model);
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottombar() {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.toNamed(getCurrentRoute(type), id: 1);
        },
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Academics:
        return AppRoutes.academicsAssignmentStatusInitialPage;
      case BottomBarEnum.Attendance:
        return AppRoutes.attendanceAllVariantsPage;
      case BottomBarEnum.Reports:
        return AppRoutes.reportsReportCardAllVariantsPage;
      case BottomBarEnum.News:
        return AppRoutes.newsAllVariantsPage;
      default:
        return "/";
    }
  }
}
