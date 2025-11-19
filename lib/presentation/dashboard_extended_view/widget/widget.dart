import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/models/models.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class DashboardItemWidget extends StatelessWidget {
  DashboardItemWidget(this.dashboardItemModelObj, {Key? key}) : super(key: key);

  DashboardExtendedViewModel dashboardItemModelObj;

  var controller = Get.find<DashboardExtendedViewController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h),
      decoration: BoxDecoration(
        color: Color(0xffEF5A07),
        borderRadius: BorderRadiusStyle.circleBorder12,
        border: Border.all(color: Color(0xffFFBC71)),
      ),
      // AppDecoration.primaryC7Main.copyWith(

      // ),
      child: Column(
        // spacing: 10,
        //  mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
              color: Color(0xffFFEED4),

              shape: BoxShape.circle,
            ),
            child: Image.asset(
              dashboardItemModelObj.imagePath,
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
            // CustomImageView(
            //   imagePath:   dashboardItemModelObj.imagePath,
            //   height: 40.h,
            //   width: 40.h,
            // ),
          ),
          // Obx(
          //   () =>
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            dashboardItemModelObj.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.h,
              fontWeight: FontWeight.w500,
            ),
            //theme.textTheme.bodySmall
          ),

          // SizedBox(
          //   // width: double.maxFinite,
          //   child: Column(
          //     children: [

          //       //    ),
          //     ],
          //   ),
          //  ),
        ],
      ),
    );
  }
}
