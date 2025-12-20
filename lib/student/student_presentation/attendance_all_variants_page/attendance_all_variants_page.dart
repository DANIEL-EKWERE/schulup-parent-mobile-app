import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schulupparent/student/student_presentation/attendance_all_variants_page/models/attendance_model.dart';
import 'package:schulupparent/student/student_presentation/attendance_all_variants_page/widgets/attendance_shimmer_widget.dart';
import 'package:schulupparent/student/student_presentation/attendance_filter_start_date_bottomsheet/attendance_filter_start_date_bottomsheet.dart';
import 'package:schulupparent/student/student_presentation/attendance_filter_start_date_bottomsheet/controller/attendance_filter_start_date_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/date_time_utils.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/attendance_all_variants_controller.dart';
import 'models/attendance_all_variants_model.dart';
import 'models/listdropoff_item_model.dart';
import 'widgets/listdropoff_item_widget.dart';

// ignore_for_file: must_be_immutable
class AttendanceAllVariantsPage extends StatefulWidget {
  AttendanceAllVariantsPage({Key? key}) : super(key: key);

  @override
  State<AttendanceAllVariantsPage> createState() =>
      _AttendanceAllVariantsPageState();
}

class _AttendanceAllVariantsPageState extends State<AttendanceAllVariantsPage> {
  List<String> getMonths() {
    final currentYear = DateTime.now().year;

    return List.generate(12, (index) {
      final date = DateTime(currentYear, index + 1, 1);
      return DateFormat('MMMM yyyy').format(date);
    });
  }

  AttendanceAllVariantsController controller = Get.put(
    AttendanceAllVariantsController(AttendanceAllVariantsModel().obs),
  );


  final ScrollController _scrollController = ScrollController();

 

  void scrollToMonth(int index) {
    // Calculate the position to scroll to
    // itemWidth (120) + spacing (16)
    double position = index * 100.0;
    
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // AttendanceAllVariantsController controller = Get.put(
  //   AttendanceAllVariantsController(AttendanceAllVariantsModel().obs),
  // );

    @override
  void initState() {
    super.initState();
    // Scroll to current month after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToMonth(controller.selectedMonth!);
    });
  }

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
              _buildColumnattendanc(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 14.h),
                    child: Obx(
                      () =>
                          controller.isLoading.value
                              ? ListView.separated(
                                shrinkWrap: true,
                                itemCount: 5,
                                //isLoading ? 5 : newsItems.length,
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 12.h),
                                itemBuilder: (context, index) {
                                  // if (isLoading) {
                                  return AttendanceShimmerWidget();
                                  // }
                                  // return ListlineItemWidget(newsItems[index]);
                                },
                              )
                              : controller.attendanceData!.isEmpty
                              ? Center(
                                child: Column(
                                  spacing: 30,
                                  children: [
                                    SizedBox(height: 150.h),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgObjects,
                                    ),
                                    Text(
                                      'No Record for the selected date found',
                                    ),
                                  ],
                                ),
                              )
                              : ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.attendanceData!.length,
                                itemBuilder: (context, index) {
                                  AttendanceData model =
                                      controller.attendanceData![index];
                                  return _buildColumnlinesix(model);
                                },
                                separatorBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return Container(height: 10);
                                },
                              ),
                    ),
                    // Column(
                    //   spacing: 10,
                    //   children: [
                    //     _buildColumnlinesix(),
                    //     _buildColumnlineone(),
                    //     _buildColumnlinetwo(),
                    //     _buildColumnline(),
                    //     _buildColumnlinefour(),
                    //     _buildColumnlinefive(),
                    //   ],
                    // ),
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
  Widget _buildColumnattendanc() {
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
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_attendance".tr),
                AppbarSubtitleFive(
                  text:
                      dashboardExtendedViewController
                          .selectedStudent1!
                          .firstName!,
                  margin: EdgeInsets.symmetric(horizontal: 32.h),
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  // AttendanceFilterStartDateBottomsheet(
                  //   AttendanceFilterStartDateController(),
                  // );
                  print('object');
                },
                child: AppbarTrailingIconbutton(
                  onTap: () {
                    print('object');
                    // return AttendanceFilterStartDateBottomsheet(
                    //   AttendanceFilterStartDateController(),
                    // );
                    //controller.getStudentAttendance();
                    showModalBottomSheet(
                      context: Get.context!,
                      builder: (context) {
                        return AttendanceFilterStartDateBottomsheet(
                          AttendanceFilterStartDateController(),
                        );
                      },
                    );
                  },
                  imagePath: ImageConstant.imgUserWhiteA700,
                  margin: EdgeInsets.only(top: 1.h, right: 25.h, bottom: 2.h),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              child: 
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: List.generate(getMonths().length, (index) {
              //     var month = getMonths()[index];
              //     return
              //     // month
              //     GestureDetector(
              //       onTap: () {
              //         // print(month);
              //         // print(index);
              //         // print(selectedMonth);
              //         setState(() {
              //           controller.selectedMonth = index;
              //         });
              //         controller.getStudentAttendance();
              //       },
              //       child:
              //           controller.selectedMonth == index
              //               ? Container(
              //                 margin: EdgeInsets.only(left: 5.h, right: 5.h),
              //                 padding: EdgeInsets.symmetric(
              //                   horizontal: 14.h,
              //                   vertical: 10.h,
              //                 ),
              //                 decoration: AppDecoration.grayC2.copyWith(
              //                   borderRadius: BorderRadiusStyle.roundedBorder18,
              //                 ),
              //                 child: Text(
              //                   month,
              //                   textAlign: TextAlign.center,
              //                   style: theme.textTheme.labelLarge,
              //                 ),
              //               )
              //               : Container(
              //                 margin: EdgeInsets.only(left: 5.h, right: 5.h),
              //                 padding: EdgeInsets.symmetric(
              //                   horizontal: 14.h,
              //                   vertical: 10.h,
              //                 ),
              //                 decoration: AppDecoration.grayC13.copyWith(
              //                   borderRadius: BorderRadiusStyle.roundedBorder18,
              //                 ),
              //                 child: Text(
              //                   month,
              //                   textAlign: TextAlign.center,
              //                   style: CustomTextStyles.bodySmallOnPrimary_1,
              //                 ),
              //               ),
              //     );
              //   }),
              //   // [
              //   // Container(
              //   //   padding: EdgeInsets.symmetric(
              //   //     horizontal: 14.h,
              //   //     vertical: 10.h,
              //   //   ),
              //   //   decoration: AppDecoration.grayC13.copyWith(
              //   //     borderRadius: BorderRadiusStyle.roundedBorder18,
              //   //   ),
              //   //   child: Text(
              //   //     "lbl_jun_2025".tr,
              //   //     textAlign: TextAlign.center,
              //   //     style: CustomTextStyles.bodySmallOnPrimary_1,
              //   //   ),
              //   // ),
              //   // Container(
              //   //   margin: EdgeInsets.only(left: 4.h),
              //   //   padding: EdgeInsets.symmetric(
              //   //     horizontal: 14.h,
              //   //     vertical: 10.h,
              //   //   ),
              //   //   decoration: AppDecoration.grayC13.copyWith(
              //   //     borderRadius: BorderRadiusStyle.roundedBorder18,
              //   //   ),
              //   //   child: Text(
              //   //     "lbl_jul_2025".tr,
              //   //     textAlign: TextAlign.center,
              //   //     style: CustomTextStyles.bodySmallOnPrimary_1,
              //   //   ),
              //   // ),
              //   //   Container(
              //   //     margin: EdgeInsets.only(left: 4.h),
              //   //     padding: EdgeInsets.symmetric(
              //   //       horizontal: 14.h,
              //   //       vertical: 8.h,
              //   //     ),
              //   //     decoration: AppDecoration.grayC13.copyWith(
              //   //       borderRadius: BorderRadiusStyle.roundedBorder18,
              //   //     ),
              //   //     child: Text(
              //   //       "lbl_sept_2025".tr,
              //   //       textAlign: TextAlign.center,
              //   //       style: CustomTextStyles.bodySmallOnPrimary_1,
              //   //     ),
              //   //   ),
              //   //   Container(
              //   //     margin: EdgeInsets.only(left: 4.h),
              //   //     padding: EdgeInsets.symmetric(
              //   //       horizontal: 14.h,
              //   //       vertical: 10.h,
              //   //     ),
              //   //     decoration: AppDecoration.grayC13.copyWith(
              //   //       borderRadius: BorderRadiusStyle.roundedBorder18,
              //   //     ),
              //   //     child: Text(
              //   //       "lbl_oct_2025".tr,
              //   //       textAlign: TextAlign.center,
              //   //       style: CustomTextStyles.bodySmallOnPrimary_1,
              //   //     ),
              //   //   ),
              //   // Container(
              //   //   margin: EdgeInsets.only(left: 4.h),
              //   //   padding: EdgeInsets.symmetric(
              //   //     horizontal: 14.h,
              //   //     vertical: 10.h,
              //   //   ),
              //   //   decoration: AppDecoration.grayC2.copyWith(
              //   //     borderRadius: BorderRadiusStyle.roundedBorder18,
              //   //   ),
              //   //   child: Text(
              //   //     "lbl_nov_2025".tr,
              //   //     textAlign: TextAlign.center,
              //   //     style: theme.textTheme.labelLarge,
              //   //   ),
              //   // ),
              //   // ],
              // ),
              Container(
            height: 35,
            width: 400.h,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: getMonths().length,
              itemBuilder: (context, index) {
                var month = getMonths()[index];
                bool isSelected = index == controller.selectedMonth;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.selectedMonth = index;
                    });
                    scrollToMonth(index);
                    controller.getStudentAttendance();
                  },
                  child: isSelected
                            ? Container(
                              margin: EdgeInsets.only(left: 5.h, right: 5.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 10.h,
                              ),
                              decoration: AppDecoration.grayC2.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder18,
                              ),
                              child: Text(
                                month,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.labelLarge,
                              ),
                            )
                            : Container(
                              margin: EdgeInsets.only(left: 5.h, right: 5.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 10.h,
                              ),
                              decoration: AppDecoration.grayC13.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder18,
                              ),
                              child: Text(
                                month,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodySmallOnPrimary_1,
                              ),
                            ),
                );
              },
            ),
          ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlinesix(AttendanceData model) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 10,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
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
                    imagePath: 'assets/images/img_icons_small_attendance.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    model.formattedDate,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),

          // Obx(
          //   () =>
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 4.h);
            },
            itemCount: model.attendanceLogs!.length,
            itemBuilder: (context, index) {
              AttendanceLogs logs = model.attendanceLogs![index];
              return ListdropoffItemWidget(logs);
            },
          ),
          // ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTime() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.time1Controller,
      hintText: "lbl_8_00_am".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
      onTap: () {
        onTapTime();
      },
    );
  }

  /// Section Widget
  Widget _buildTimeone() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timeoneController,
      hintText: "lbl_9_27_am".tr,
      alignment: Alignment.center,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimeone();
      },
    );
  }

  /// Section Widget
  Widget _buildTimetwo() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timetwoController,
      hintText: "lbl_11_02_am".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimetwo();
      },
    );
  }

  /// Section Widget
  Widget _buildTimethree() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timethreeController,
      hintText: "lbl_11_30_am".tr,
      alignment: Alignment.center,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimethree();
      },
    );
  }

  /// Section Widget
  Widget _buildTimefour() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timefourController,
      hintText: "lbl_12_00_am".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimefour();
      },
    );
  }

  /// Section Widget
  Widget _buildTimefive() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timefiveController,
      hintText: "lbl_1_15_am".tr,
      alignment: Alignment.center,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimefive();
      },
    );
  }

  /// Section Widget
  Widget _buildTimesix() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timesixController,
      hintText: "lbl_1_40_am".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimesix();
      },
    );
  }

  /// Section Widget
  Widget _buildTimeseven() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timesevenController,
      hintText: "lbl_2_30_pm".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
      onTap: () {
        onTapTimeseven();
      },
    );
  }

  /// Section Widget
  Widget _buildColumnlineone() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
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
                    imagePath: 'assets/images/img_icons_small_attendance.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_tuesday_nov_11".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_drop_off".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildTime(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    "lbl_check_out".tr,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                ),
                _buildTimeone(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_check_in".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildTimetwo(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    "lbl_check_out".tr,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                ),
                _buildTimethree(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_check_in".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildTimefour(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    "lbl_check_out".tr,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                ),
                _buildTimefive(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_check_in".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildTimesix(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_pick_up".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildTimeseven(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTimenine() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timenineController,
      hintText: "lbl_12_33_pm".tr,
      alignment: Alignment.center,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimenine();
      },
    );
  }

  /// Section Widget
  Widget _buildTimeten() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timetenController,
      hintText: "lbl_1_01_pm".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      onTap: () {
        onTapTimeten();
      },
    );
  }

  /// Section Widget
  Widget _buildTimeeleven() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timeelevenController,
      hintText: "lbl_2_30_pm".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
      onTap: () {
        onTapTimeeleven();
      },
    );
  }

  /// Section Widget
  Widget _buildColumnlinetwo() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
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
                    imagePath: 'assets/images/img_icons_small_attendance.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_monday_nov_10".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_drop_off".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                Container(
                  width: 244.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 8.h,
                  ),
                  decoration: AppDecoration.errorC1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "lbl_10_20_am".tr,
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Text(
                    "lbl_check_out".tr,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                ),
                _buildTimenine(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_check_in".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildTimeten(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_pick_up".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildTimeeleven(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTimetwelve() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: controller.timetwelveController,
      hintText: "lbl_8_00_am".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
      onTap: () {
        onTapTimetwelve();
      },
    );
  }

  /// Section Widget
  Widget _buildColumnline() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 10,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
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
                    imagePath: 'assets/images/img_icons_small_attendance.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_friday_nov_7".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Column(
              spacing: 4,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_drop_off".tr,
                        style: CustomTextStyles.bodySmallGray700,
                      ),
                      _buildTimetwelve(),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          "lbl_check_out".tr,
                          style: CustomTextStyles.bodySmallGray700,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 8.h,
                          ),
                          decoration: AppDecoration.errorC1.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                          ),
                          child: Text(
                            "lbl_10_15_am".tr,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlinefour() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 10,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
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
                    imagePath: 'assets/images/img_icons_small_attendance.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_thursday_nov_6".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 8.h, right: 14.h, bottom: 8.h),
            decoration: AppDecoration.errorC1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("lbl_absent".tr, style: theme.textTheme.labelMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPublicholiday() {
    return CustomTextFormField(
      controller: controller.publicholidayController,
      hintText: "lbl_public_holiday".tr,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
    );
  }

  /// Section Widget
  Widget _buildColumnlinefive() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
      decoration: AppDecoration.primaryC11,
      child: Column(
        spacing: 10,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
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
                    imagePath: 'assets/images/img_icons_small_attendance.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "msg_wednesday_nov2".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          _buildPublicholiday(),
        ],
      ),
    );
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTime() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller.attendanceAllVariantsModelObj.value.selectedTime!.value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTime!.value = time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.time1Controller.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimeone() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller.attendanceAllVariantsModelObj.value.selectedTimeOne!.value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeOne!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timeoneController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimetwo() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller.attendanceAllVariantsModelObj.value.selectedTimeTwo!.value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeTwo!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timetwoController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimethree() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller
              .attendanceAllVariantsModelObj
              .value
              .selectedTimeThree!
              .value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeThree!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timethreeController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimefour() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller
              .attendanceAllVariantsModelObj
              .value
              .selectedTimeFour!
              .value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeFour!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timefourController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimefive() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller
              .attendanceAllVariantsModelObj
              .value
              .selectedTimeFive!
              .value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeFive!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timefiveController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimesix() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller.attendanceAllVariantsModelObj.value.selectedTimeSix!.value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeSix!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timesixController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimeseven() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller
              .attendanceAllVariantsModelObj
              .value
              .selectedTimeSeven!
              .value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeSeven!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timesevenController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimenine() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller
              .attendanceAllVariantsModelObj
              .value
              .selectedTimeNine!
              .value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeNine!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timenineController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimeten() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller.attendanceAllVariantsModelObj.value.selectedTimeTen!.value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeTen!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timetenController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimeeleven() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller
              .attendanceAllVariantsModelObj
              .value
              .selectedTimeEleven!
              .value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeEleven!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timeelevenController.text = parseDate.format(pattern: H_M);
    }
  }

  /// Displays a time picker dialog and updates the selected time in the
  /// [attendanceAllVariantsModelObj] object of the current [controller] if the user
  /// selects a valid time.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTimetwelve() async {
    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime:
          controller
              .attendanceAllVariantsModelObj
              .value
              .selectedTimeTwelve!
              .value,
    );
    if (time != null) {
      controller.attendanceAllVariantsModelObj.value.selectedTimeTwelve!.value =
          time;
      var parseDate = DateFormat.Hm().parse(time.format(Get.context!));
      controller.timetwelveController.text = parseDate.format(pattern: H_M);
    }
  }
}
