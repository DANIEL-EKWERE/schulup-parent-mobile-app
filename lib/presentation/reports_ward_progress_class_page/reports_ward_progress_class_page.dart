// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/presentation/reports_ward_progress_class_one_bottomsheet/controller/reports_ward_progress_class_one_controller.dart';
import 'package:schulupparent/presentation/reports_ward_progress_class_one_bottomsheet/reports_ward_progress_class_one_bottomsheet.dart';
import 'package:schulupparent/presentation/reports_ward_progress_class_page/models/class_overview_model.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_one_bottomsheet/controller/reports_ward_progress_subject_one_controller.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_one_bottomsheet/reports_ward_progress_subject_one_bottomsheet.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_page/reports_ward_progress_subject_page.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/reports_ward_progress_class_controller.dart';
import 'models/reports_ward_progress_class_model.dart';

// ignore_for_file: must_be_immutable
ReportsWardProgressClassController controller1 = Get.put(
  ReportsWardProgressClassController(Rx(ReportsWardProgressClassModel())),
);

class ReportsWardProgressClassPage extends StatefulWidget {
  ReportsWardProgressClassPage({Key? key}) : super(key: key);

  @override
  State<ReportsWardProgressClassPage> createState() => _ReportsWardProgressClassPageState();
}

class _ReportsWardProgressClassPageState extends State<ReportsWardProgressClassPage> {
  ReportsWardProgressClassController controller = Get.put(
    ReportsWardProgressClassController(ReportsWardProgressClassModel().obs),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1.academicPerformance();
    controller1.classOverview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.onrefresh,
        child: SizedBox(
          width: double.maxFinite,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child:
                // Column(
                //   mainAxisSize: MainAxisSize.max,
                //   children: [
                //     SizedBox(
                //       width: double.maxFinite,
                //       child: Column(
                //         children: [
                //           s
                //           //selectedSubjectPerformance
                //           // _buildColumnshowing(),
                //           // SizedBox(height: 16.h),
                //           // _buildColumnlinefour(),
                //           // SizedBox(height: 10.h),
                //           // _buildColumnlineone(),
                //           // SizedBox(height: 10.h),
                //           // _buildColumnlinetwo(),
                //           // SizedBox(height: 10.h),
                //           // _buildColumnline(),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                Obx(
                  () =>
                      controller1.isLoading.value
                          ? Center(
                            child: CircularProgressIndicator(
                              color: Color(0XFFFF8C42),
                            ),
                          )
                          : Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            // height: 400.h,
                            child: Column(
                              children: [
                                _buildColumnshowing(),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      controller1
                                          .selectedSubjectPerformance!
                                          .length,
                                  itemBuilder: (context, index) {
                                    SubjectData model =
                                        controller1
                                            .selectedSubjectPerformance![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: _buildColumnlinefour(model),
                                    );
                                    // Text(
                                    //   model.text!,
                                    //   style: CustomTextStyles.bodyMediumGray900,
                                    // );
                                  },
                                  // Column(
                                  //   spacing: 4,
                                  //   children: [
                                  //     _buildRowprimary5a(),
                                  //     _buildRowprimary4a(),
                                  //     _buildRowprimary4a1(),
                                  //     _buildRowprimary4a2(),
                                  //     _buildRowprimary3a(),
                                  //     _buildRowprimary3a1(),
                                  //     _buildRowprimary3a2(),
                                  //     _buildRowprimary2a(),
                                  //     _buildRowprimary2a1(),
                                  //     _buildRowprimary2a2(),
                                  //     _buildRowprimary1a(),
                                  //     _buildRowprimary1a1(),
                                  //     _buildRowprimarya2(),
                                  //     _buildRownursery3a(),
                                  //     _buildRownursery3a1(),
                                  //     _buildRownursery3a2(),
                                  //     _buildRownursery2a(),
                                  //     _buildRownursery2a1(),
                                  //     _buildRownursery2a2(),
                                  //   ],
                                ),
                              ],
                            ),
                          ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnshowing() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: Get.context!,
          builder: (context) {
            return ReportsWardProgressClassOneBottomsheet(
              ReportsWardProgressClassOneController(),
            );
          },
        );
      },
      child: SizedBox(
        width: double.maxFinite,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 24.h, top: 10.h, bottom: 10.h),
              decoration: AppDecoration.outline,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      controller.selectedBatch.value,
                      style: CustomTextStyles.bodySmallWhiteA700,
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
  Widget _buildFrame427321469(String wardScore) {
    return Padding(
      padding: EdgeInsets.only(left: 48.h),
      child: CustomTextFormField(
        width: 182.h,
        controller: controller.frame427321469Controller,
        hintText: wardScore,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillGreen,
        fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321470(String classAverage) {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 176.h,
        controller: controller.frame427321470Controller,
        hintText: classAverage,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlinefour(SubjectData model) {
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
                  padding: EdgeInsets.all(8),
                  width: 40.h,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Color(0xffFFEED4),
                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgWardprogress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    model.subjectName ?? "N/A",
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
              children: [
                Text(
                  "lbl_ward_score".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321469(model.studentScore!.toString()),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_class_average".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321470(model.classAverage!.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321471() {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: CustomTextFormField(
        width: 222.h,
        controller: controller.frame427321471Controller,
        hintText: "lbl_91".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillGreen,
        fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321472() {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 186.h,
        controller: controller.frame427321472Controller,
        hintText: "lbl_77".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
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
                  padding: EdgeInsets.all(8),
                  width: 40.h,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Color(0xffFFEED4),
                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgWardprogress,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "msg_christian_religious2".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
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
                  "lbl_ward_score".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321471(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_class_average".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321472(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321473() {
    return Padding(
      padding: EdgeInsets.only(left: 48.h),
      child: CustomTextFormField(
        width: 164.h,
        controller: controller.frame427321473Controller,
        hintText: "lbl_68".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillAmberA,
        fillColor: appTheme.amberA400,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321474() {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 132.h,
        controller: controller.frame427321474Controller,
        hintText: "lbl_55".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
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
                  padding: EdgeInsets.all(8),
                  width: 40.h,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Color(0xffFFEED4),
                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgWardprogress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_civic_education".tr,
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
              children: [
                Text(
                  "lbl_ward_score".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321473(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_class_average".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321474(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321475() {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 172.h,
        controller: controller.frame427321475Controller,
        hintText: "lbl_71".tr,
        textInputAction: TextInputAction.done,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnline() {
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
                  padding: EdgeInsets.all(8),
                  width: 40.h,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Color(0xffFFEED4),
                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgWardprogress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_composition".tr,
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
              children: [
                Text(
                  "lbl_ward_score".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                Container(
                  margin: EdgeInsets.only(left: 48.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 8.h,
                  ),
                  decoration: AppDecoration.errorC1.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "lbl_43".tr,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Text(
                  "lbl_class_average".tr,
                  style: CustomTextStyles.bodySmallGray700,
                ),
                _buildFrame427321475(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
