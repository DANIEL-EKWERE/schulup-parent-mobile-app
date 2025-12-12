

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class SubjectProgressShimmerWidget extends StatelessWidget {
  const SubjectProgressShimmerWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child:
                  //  Obx(
                  //   () =>
                  Container(
          width: 20,
          height: 2,
          color: Colors.white,
        )
                  // ),
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
                // Obx(
                //   () =>
                Text("Ward Score", style: CustomTextStyles.bodySmallGray700),
                // ),
                _buildFrame427321469(),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Obx(
                //   () =>
                Text(
                  "Class Average",
                  style: CustomTextStyles.bodySmallGray700,
                  // ),
                ),
                _buildFrame427321470(),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }


  /// Section Widget
  Widget _buildFrame427321469() {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: Container(
        width: 222.h,
        height: 30.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.h),
        ),
        // controller: listlineItemModelObj.studentScore.toString(),
        child: Container(
          width: 20,
          height: 2,
          color: Colors.white,
        ),
        // hintText: "lbl_91".tr,
        // contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        // borderDecoration: TextFormFieldStyleHelper.fillGreen,
        // fillColor: appTheme.green500,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame427321470() {
    return Padding(
      padding: EdgeInsets.only(right: 30.h),
      child: Container(
        width: 222.h,
        height: 30.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.h),
        ),
        // controller: listlineItemModelObj.studentScore.toString(),
        child: Container(
          width: 20,
          height: 2,
          color: Colors.white,
        )
        // hintText: "lbl_91".tr,
        // contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
        // borderDecoration: TextFormFieldStyleHelper.fillGreen,
        // fillColor: appTheme.green500,
      ),
    );
  }
}
