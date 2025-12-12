// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/daily_report_model.dart';
import '../../../core/app_export.dart';
import '../controller/reports_report_card_all_variants_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  DailyReportDate listlineItemModelObj;

  var controller = Get.find<ReportsReportCardAllVariantsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                // Container(
                //   height: 40,
                //   width: 40,
                //   padding: EdgeInsets.all(5.h),
                //   decoration: BoxDecoration(
                //     color: Color.fromRGBO(255, 238, 212, 1),

                //     shape: BoxShape.circle,
                //   ),
                //   child: CustomImageView(
                //     imagePath: 'assets/images/img_icons_small_report_card.png',
                //   ),
                //   // CustomImageView(
                //   //   imagePath:   dashboardItemModelObj.imagePath,
                //   //   height: 40.h,
                //   //   width: 40.h,
                //   // ),
                // ),
                Text(
                  listlineItemModelObj.reportTopic,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  // ),
                ),
              ],
            ),
          ),
          // Obx(
          //   () =>
          Text(
            listlineItemModelObj.reportComment,
            style: CustomTextStyles.bodySmallSecondaryContainer10,
          ),
          //   ),
        ],
      ),
    );
  }
}
