import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/reports_report_card_all_variants_one_screen/controller/reports_report_card_all_variants_one_controller.dart';
import 'package:schulupparent/presentation/reports_report_card_all_variants_page/controller/reports_report_card_all_variants_controller.dart';
import '../../../core/app_export.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWeeklyWidget extends StatefulWidget {
  ListlineItemWeeklyWidget(this.listlineItemModelObj, {Key? key})
    : super(key: key);

  ListlineItemModel listlineItemModelObj;

  @override
  State<ListlineItemWeeklyWidget> createState() =>
      _ListlineItemWeeklyWidgetState();
}

class _ListlineItemWeeklyWidgetState extends State<ListlineItemWeeklyWidget> {
  var controller = Get.find<ReportsReportCardAllVariantsController>();

  bool isDowloading = false;

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
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5.h),
                  decoration: BoxDecoration(
                    color: Color(0xffFFEED4),

                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    imagePath: 'assets/images/img_icons_small_report_card.png',
                  ),
                  // CustomImageView(
                  //   imagePath:   dashboardItemModelObj.imagePath,
                  //   height: 40.h,
                  //   width: 40.h,
                  // ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Obx(
                    () => Text(
                      widget.listlineItemModelObj.duration!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                Spacer(),
                CustomImageView(
                  onTap: () {
                    setState(() {
                      isDowloading = !isDowloading;
                    });
                  },
                  imagePath:
                      isDowloading
                          ? ImageConstant.imgIconsTinyDownloading
                          : ImageConstant.imgIconsTinyDownload,
                  height: 18.h,
                  width: 20.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsTinyShare,
                  height: 18.h,
                  width: 20.h,
                  margin: EdgeInsets.only(left: 14.h),
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              widget.listlineItemModelObj.tuesdayseptthir!.value,
              style: CustomTextStyles.bodySmallSecondaryContainer10,
            ),
          ),
        ],
      ),
    );
  }
}
