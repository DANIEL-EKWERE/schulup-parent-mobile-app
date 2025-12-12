// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/comments_model.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/daily_report_model.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/report_model.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/widgets/custom_date_picker_model.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/widgets/listline_item_widget_weekly.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_modal_bottomsheet/controller/reports_report_card_modal_controller.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_modal_bottomsheet/reports_report_card_modal_bottomsheet.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_modal_one_bottomsheet/controller/reports_report_card_modal_one_controller.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_modal_one_bottomsheet/reports_report_card_modal_one_bottomsheet.dart';
import 'package:schulupparent/parent/parent_presentation/session_model_sheet/controller/session_modal_controller.dart';
import 'package:schulupparent/parent/parent_presentation/session_model_sheet/session_modal_bottom_sheet.dart';
import 'package:schulupparent/parent/parent_presentation/signin_screen/shimmer_widget.dart';
import 'package:schulupparent/parent/widgets/custom_text_form_field.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/reports_report_card_all_variants_controller.dart';
import 'models/listline_item_model.dart';
import 'models/reports_report_card_all_variants_model.dart';
import 'widgets/listline_item_widget.dart';

DashboardExtendedViewController dashboardExtendedViewController =
    Get.find<DashboardExtendedViewController>();

// ignore_for_file: must_be_immutable
class ReportsReportCardAllVariantsPage extends StatefulWidget {
  ReportsReportCardAllVariantsPage({Key? key}) : super(key: key);

  @override
  State<ReportsReportCardAllVariantsPage> createState() =>
      _ReportsReportCardAllVariantsPageState();
}

class _ReportsReportCardAllVariantsPageState
    extends State<ReportsReportCardAllVariantsPage> {
  ReportsReportCardAllVariantsController controller = Get.put(
    ReportsReportCardAllVariantsController(
      ReportsReportCardAllVariantsModel().obs,
    ),
  );

  DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    child: Container(
                      child: TabBarView(
                        controller: controller.tabviewController,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(height: 14.h),
                              _buildListline(),
                            ],
                          ),
                          _buildListline1(),
                          _buildListline2(),
                        ],
                      ),
                    ),
                    // Column(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [SizedBox(height: 14.h), _buildListline()],
                    // ),
                  ),
                ),
              ],
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
                  child: Obx(
                    () =>
                        controller.tabIndex.value == 0
                            ?
                            //SizedBox.shrink()
                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xffEF5A07),
                                    border: Border.all(
                                      color: Color(0xffFFBC71),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CustomImageView(
                                    onTap: () {
                                      setState(() {
                                        controller.datex = controller.datex!
                                            .subtract(Duration(days: 1));
                                      });
                                      controller.getDailyReports();
                                    },
                                    imagePath:
                                        "assets/images/img_icons_tiny_left.svg",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showCustomDatePicker(
                                      context,
                                      controller.datex!,
                                      (newDate) {
                                        setState(() {
                                          controller.datex = newDate;
                                        });
                                        controller.getDailyReports();
                                      },
                                    );
                                  },
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      Text(
                                        formatDate(controller.datex.toString()),
                                        style: CustomTextStyles
                                            .bodySmallWhiteA700_1
                                            .copyWith(fontSize: 12),
                                      ),
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgIconsTinyDown,
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xffEF5A07),
                                    border: Border.all(
                                      color: Color(0xffFFBC71),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: CustomImageView(
                                    onTap: () {
                                      setState(() {
                                        controller.datex = controller.datex!
                                            .add(Duration(days: 1));
                                      });
                                      controller.getDailyReports();
                                    },
                                    imagePath:
                                        "assets/images/img_icons_tiny_right.svg",
                                  ),
                                ),
                              ],
                            )
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: Get.context!,
                                      builder: (context) {
                                        return SessionModalBottomSheet(
                                          SessionModalController(),
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Obx(() {
                                        return Text(
                                          // "lbl_first_term".tr,
                                          controller.session.value,
                                          style: theme.textTheme.labelLarge,
                                        );
                                      }),
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgIconsTinyDown,
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
                                          "${controller.termType.value} Term",
                                          style: theme.textTheme.labelLarge,
                                        );
                                      }),
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgIconsTinyDown,
                                        height: 16.h,
                                        width: 18.h,
                                        margin: EdgeInsets.only(left: 10.h),
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
          ),
        ],
      ),
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM. d, yyyy').format(dateTime);
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
                : controller.dailyReportDataList.isEmpty
                ? Center(
                  child: Column(
                    spacing: 30,
                    children: [
                      SizedBox(height: 150.h),
                      CustomImageView(imagePath: ImageConstant.imgObjects),
                      Text('No Report for the selected filter condition'),
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
                  itemCount: controller.dailyReportDataList.length + 1,
                  itemBuilder: (context, index) {
                    // Check if it's the last item FIRST before accessing the list
                    if (index == controller.dailyReportDataList.length) {
                      // Only show comments section if there are messages OR if loading
                      return Obx(
                        () =>
                            (controller.tempMessageList.isNotEmpty ||
                                    controller.isCommentsLoading.value)
                                ? Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF7F7F8),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Comments',
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        height: 200,
                                        child:
                                            controller.isCommentsLoading.value
                                                ? Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                        color: Color(
                                                          0xffFF8D2A,
                                                        ),
                                                      ),
                                                )
                                                : ListView.separated(
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  reverse: true,
                                                  itemBuilder: (
                                                    context,
                                                    index,
                                                  ) {
                                                    Messages message =
                                                        controller
                                                            .tempMessageList[index];

                                                    bool isLastMessage =
                                                        index ==
                                                        controller
                                                                .tempMessageList
                                                                .length -
                                                            1;
                                                    bool isSending =
                                                        controller
                                                            .isCommentsSendLoading
                                                            .value &&
                                                        isLastMessage;

                                                    return Align(
                                                      alignment:
                                                          message.senderType ==
                                                                  2
                                                              ? Alignment
                                                                  .centerLeft
                                                              : Alignment
                                                                  .centerRight,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            message.senderType ==
                                                                    2
                                                                ? CrossAxisAlignment
                                                                    .start
                                                                : CrossAxisAlignment
                                                                    .end,
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                                  maxWidth: 250,
                                                                ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                  12,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  message.senderType ==
                                                                          2
                                                                      ? Color(
                                                                        0xffA8EFF9,
                                                                      )
                                                                      : Color(
                                                                        0xffF4EEA9,
                                                                      ),
                                                              borderRadius:
                                                                  message.senderType ==
                                                                          2
                                                                      ? BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                      )
                                                                      : BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                              10,
                                                                            ),
                                                                      ),
                                                            ),
                                                            child: Text(
                                                              message.messageText ??
                                                                  '',
                                                              style: TextStyle(
                                                                color:
                                                                    isSending
                                                                        ? Colors
                                                                            .grey[400]
                                                                        : Color(
                                                                          0xff27262B,
                                                                        ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            isSending
                                                                ? 'Sending...'
                                                                : message
                                                                        .formattedTime ??
                                                                    '',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color:
                                                                  Colors
                                                                      .grey[600],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder: (
                                                    context,
                                                    index,
                                                  ) {
                                                    return SizedBox(height: 10);
                                                  },
                                                  itemCount:
                                                      controller
                                                          .tempMessageList
                                                          .length,
                                                ),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        controller:
                                            controller.messageController,
                                        decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                controller
                                                        .isCommentsSendLoading
                                                        .value
                                                    ? SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child:
                                                          CircularProgressIndicator(
                                                            strokeWidth: 2,
                                                            color: Color(
                                                              0xffFF8D2A,
                                                            ),
                                                          ),
                                                    )
                                                    : CustomImageView(
                                                      onTap: () {
                                                        controller
                                                            .makeComment();
                                                      },
                                                      imagePath:
                                                          'assets/images/img_icons_small_send.svg',
                                                    ),
                                          ),

                                          filled: true,
                                          hintText: "Leave a comment...",
                                          hintStyle: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                color: Color(0xff646769),
                                              ),
                                          fillColor: Colors.white,
                                          focusColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            borderSide: BorderSide(
                                              color: Color(0xffEFEEF0),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            borderSide: BorderSide(
                                              color: Color(0xffEFEEF0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : SizedBox.shrink(), // Return empty widget when no messages
                      );
                    }

                    // Now safe to access the list
                    DailyReportDate model =
                        controller.dailyReportDataList[index];
                    return ListlineItemWidget(model);
                  },
                ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListline1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () =>
                controller.isLoading.value
                    ? SizedBox(
                      height: 900,
                      child: ListView.separated(
                        itemCount: 5,
                        //isLoading ? 5 : newsItems.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          // if (isLoading) {
                          return ListlineShimmerWidget();
                          // }
                          // return ListlineItemWidget(newsItems[index]);
                        },
                      ),
                    )
                    : controller.reportDataWeeklyList.isEmpty
                    ? Center(
                      child: Column(
                        spacing: 30,
                        children: [
                          SizedBox(height: 150.h),
                          CustomImageView(imagePath: ImageConstant.imgObjects),
                          Text('No Report for the selected filter condition'),
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
                      itemCount: controller.reportDataWeeklyList.length,
                      itemBuilder: (context, index) {
                        ReportData model =
                            controller.reportDataWeeklyList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListlineItemWeeklyWidget(model),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildListline2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () =>
                controller.isLoading.value
                    ? SizedBox(
                      height: 900,
                      child: ListView.separated(
                        itemCount: 5,
                        //isLoading ? 5 : newsItems.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          // if (isLoading) {
                          return ListlineShimmerWidget();
                          // }
                          // return ListlineItemWidget(newsItems[index]);
                        },
                      ),
                    )
                    : controller.reportDataTermlyList.isEmpty
                    ? Center(
                      child: Column(
                        spacing: 30,
                        children: [
                          SizedBox(height: 150.h),
                          CustomImageView(imagePath: ImageConstant.imgObjects),
                          Text('No report for the selected filter condition'),
                        ],
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10.h);
                        },
                        itemCount: controller.reportDataTermlyList.length,
                        itemBuilder: (context, index) {
                          ReportData model =
                              controller.reportDataTermlyList[index];
                          return ListlineItemWeeklyWidget(model);
                        },
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
