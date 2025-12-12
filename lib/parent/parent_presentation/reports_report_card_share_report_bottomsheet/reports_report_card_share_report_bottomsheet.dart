// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/reports_report_card_share_report_controller.dart';

// ignore_for_file: must_be_immutable
class ReportsReportCardShareReportBottomsheet extends StatelessWidget {
  ReportsReportCardShareReportBottomsheet(this.controller, {Key? key})
    : super(key: key);

  ReportsReportCardShareReportController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: 64.h,
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder28,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogoSecretpixels,
            height: 62.h,
            width: 62.h,
            radius: BorderRadius.circular(30.h),
          ),
        ],
      ),
    );
  }
}
