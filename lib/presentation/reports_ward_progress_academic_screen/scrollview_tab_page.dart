// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/reports_ward_progress_class_page/controller/reports_ward_progress_class_controller.dart';
import 'package:schulupparent/presentation/reports_ward_progress_class_page/models/reports_ward_progress_class_model.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/reports_ward_progress_academic_controller.dart';
import 'models/scrollview_tab_model.dart';

// ignore_for_file: must_be_immutable

ReportsWardProgressClassController controller1 = Get.put(
  ReportsWardProgressClassController(Rx(ReportsWardProgressClassModel())),
);

class ScrollviewTabPage extends StatefulWidget {
  ScrollviewTabPage({Key? key}) : super(key: key);

  @override
  State<ScrollviewTabPage> createState() => _ScrollviewTabPageState();
}

class _ScrollviewTabPageState extends State<ScrollviewTabPage> {
  ReportsWardProgressAcademicController controller = Get.put(
    ReportsWardProgressAcademicController(),
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
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 24.h),
        padding: EdgeInsets.only(left: 24.h, top: 20.h, right: 24.h),
        decoration: AppDecoration.primaryC11,
        child: Obx(
          () =>
              controller1.isLoading.value
                  ? Center(
                    child: CircularProgressIndicator(color: Color(0XFFFF8C42)),
                  )
                  : Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 5),
                    // height: 400.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller1.selectedPerformance!.length,
                      itemBuilder: (context, index) {
                        AcademicsPerformance model =
                            controller1.selectedPerformance![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: _buildRowprimary5a(model),
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
                  ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321469(AcademicsPerformance model) {
    return Padding(
      padding: EdgeInsets.only(right: 28.h),
      child: SizedBox(
        width: 150.h,
        child: CustomTextFormField(
          readOnly: true,
          width:
              MediaQuery.of(Get.context!).size.width /
              100 *
              model.studentAverage!,

          controller: controller.frame427321469Controller,
          hintText: "${model.studentAverage!.toStringAsFixed(2)} %",
          contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
          borderDecoration: TextFormFieldStyleHelper.fillGreen,
          fillColor: appTheme.green500,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary5a(AcademicsPerformance model) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(model.className!, style: CustomTextStyles.bodySmallGray700),
          _buildFrame427321469(model),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321470() {
    return Padding(
      padding: EdgeInsets.only(right: 38.h),
      child: CustomTextFormField(
        width: 110.h,
        controller: controller.frame427321470Controller,
        hintText: "lbl_73".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillGreen,
        fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary4a() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "msg_primary_4a_third".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321470(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321471() {
    return CustomTextFormField(
      width: 132.h,
      controller: controller.frame427321471Controller,
      hintText: "lbl_90".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }

  /// Section Widget
  Widget _buildRowprimary4a1() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_primary_4a_second".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321471(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary4a2() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_primary_4a_first".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          Spacer(),
          Container(
            height: 30.h,
            width: 36.h,
            decoration: BoxDecoration(
              color: appTheme.red500,
              borderRadius: BorderRadius.circular(5.h),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.h, right: 84.h),
            child: Text("lbl_25".tr, style: CustomTextStyles.labelMediumRed500),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321472() {
    return CustomTextFormField(
      width: 140.h,
      controller: controller.frame427321472Controller,
      hintText: "lbl_93".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }

  /// Section Widget
  Widget _buildRowprimary3a() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "msg_primary_3a_third".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321472(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary3a1() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_primary_3a_second".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.h),
            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 8.h),
            decoration: AppDecoration.errorC1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "lbl_43".tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321473() {
    return Padding(
      padding: EdgeInsets.only(left: 34.h),
      child: CustomTextFormField(
        width: 100.h,
        controller: controller.frame427321473Controller,
        hintText: "lbl_68".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillAmberA,
        fillColor: appTheme.amberA400,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary3a2() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_primary_3a_first".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321473(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321474() {
    return Padding(
      padding: EdgeInsets.only(left: 32.h),
      child: CustomTextFormField(
        width: 86.h,
        controller: controller.frame427321474Controller,
        hintText: "lbl_59".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillAmberA,
        fillColor: appTheme.amberA400,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary2a() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_primary_2a_third".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321474(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary2a1() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_primary_2a_second".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      color: appTheme.red500,
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "lbl_34".tr,
                      style: CustomTextStyles.labelMediumRed500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321475() {
    return CustomTextFormField(
      width: 144.h,
      controller: controller.frame427321475Controller,
      hintText: "lbl_96".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }

  /// Section Widget
  Widget _buildRowprimary2a2() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "msg_primary_2a_first".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321475(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary1a() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_primary_1a_third".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 36.h),
              child: Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 32.h,
                    decoration: BoxDecoration(
                      color: appTheme.red500,
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      "lbl_22".tr,
                      style: CustomTextStyles.labelMediumRed500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321476() {
    return Padding(
      padding: EdgeInsets.only(left: 24.h),
      child: CustomTextFormField(
        width: 114.h,
        controller: controller.frame427321476Controller,
        hintText: "lbl_78".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillGreen,
        fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimary1a1() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_primary_1a_second".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321476(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321477() {
    return Padding(
      padding: EdgeInsets.only(left: 38.h),
      child: CustomTextFormField(
        width: 92.h,
        controller: controller.frame427321477Controller,
        hintText: "lbl_62".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillAmberA,
        fillColor: appTheme.amberA400,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimarya2() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_primary_1a_first".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321477(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRownursery3a() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_nursery_3a_third".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.h),
            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 8.h),
            decoration: AppDecoration.errorC1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "lbl_45".tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRownursery3a1() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_nursery_3a_second".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          Container(
            height: 30.h,
            width: 40.h,
            margin: EdgeInsets.only(left: 22.h),
            decoration: BoxDecoration(
              color: appTheme.red500,
              borderRadius: BorderRadius.circular(5.h),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text("lbl_28".tr, style: CustomTextStyles.labelMediumRed500),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321478() {
    return Padding(
      padding: EdgeInsets.only(left: 36.h),
      child: CustomTextFormField(
        width: 76.h,
        controller: controller.frame427321478Controller,
        hintText: "lbl_51".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        borderDecoration: TextFormFieldStyleHelper.fillAmberA,
        fillColor: appTheme.amberA400,
      ),
    );
  }

  /// Section Widget
  Widget _buildRownursery3a2() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_nursery_3a_first".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321478(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321479() {
    return CustomTextFormField(
      width: 148.h,
      controller: controller.frame427321479Controller,
      hintText: "lbl_99".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }

  /// Section Widget
  Widget _buildRownursery2a() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "msg_nursery_2a_third".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321479(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321480() {
    return CustomTextFormField(
      width: 128.h,
      controller: controller.frame427321480Controller,
      hintText: "lbl_87".tr,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }

  /// Section Widget
  Widget _buildRownursery2a1() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "msg_nursery_2a_second".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          _buildFrame427321480(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRownursery2a2() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Text(
            "msg_nursery_2a_first".tr,
            style: CustomTextStyles.bodySmallGray700,
          ),
          Container(
            margin: EdgeInsets.only(left: 36.h),
            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 8.h),
            decoration: AppDecoration.errorC1.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "lbl_41".tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
