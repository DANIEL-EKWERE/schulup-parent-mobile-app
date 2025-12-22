import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schulupparent/student/student_presentation/reports_report_card_all_variants_one_screen/controller/reports_report_card_all_variants_one_controller.dart';
import 'package:schulupparent/student/student_presentation/reports_report_card_all_variants_page/controller/reports_report_card_all_variants_controller.dart';
import 'package:schulupparent/student/student_presentation/reports_report_card_all_variants_page/models/report_model.dart';
import '../../../core/app_export.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWeeklyWidget extends StatefulWidget {
  ListlineItemWeeklyWidget(this.listlineItemModelObj, {Key? key})
    : super(key: key);

  ReportData listlineItemModelObj;

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
                  child:
                  //  Obx(
                  //   () =>
                  SizedBox(
                    width: 180.h,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      widget.listlineItemModelObj.className ?? '',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 16.h,
                      ),
                      //  ),
                    ),
                  ),
                ),
                Spacer(),
                Obx(() {
                  return controller.isDownloading.value
                      ? SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : CustomImageView(
                        onTap: () {
                          setState(() {
                            // isDowloading = !isDowloading;
                            controller.downloadAndOpen(
                              widget.listlineItemModelObj.reportCardTypeID
                                  .toString(),
                            );
                          });
                        },
                        imagePath:
                            controller.isDownloading.value
                                ? ImageConstant.imgIconsTinyDownloading
                                : ImageConstant.imgIconsTinyDownload,
                        height: 18.h,
                        width: 20.h,
                      );
                }),

                Obx(() {
                  return !controller.isSharing.value
                      ? CustomImageView(
                        onTap: () {
                          controller.sharePDF(
                            widget.listlineItemModelObj.reportCardTypeID
                                .toString(),
                          );
                        },
                        imagePath: ImageConstant.imgIconsTinyShare,
                        height: 18.h,
                        width: 20.h,
                        margin: EdgeInsets.only(left: 14.h),
                      )
                      : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                }),
              ],
            ),
          ),
          // Obx(
          //   () =>
          Text(
            widget.listlineItemModelObj.reportCardTypeName ?? '',
            style: CustomTextStyles.bodySmallSecondaryContainer10,
          ),
          //),
        ],
      ),
    );
  }

  String formatDate(String dateString) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format it to "Monday, Nov. 3, 2025"
    String formatted = DateFormat('EEEE, MMM. d, yyyy').format(dateTime);

    return formatted;
  }
}
