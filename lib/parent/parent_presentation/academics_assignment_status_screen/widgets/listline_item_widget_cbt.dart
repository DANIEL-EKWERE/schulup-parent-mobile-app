import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/models/cbt_model.dart';
import '../../../core/app_export.dart';
import '../controller/academics_assignment_status_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemCbtWidget extends StatelessWidget {
  ListlineItemCbtWidget(this.listlineItemModelObj, {Key? key})
    : super(key: key);

  CbtData listlineItemModelObj;

  var controller = Get.find<AcademicsAssignmentStatusController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder12,
      ),
      child: Row(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                padding: EdgeInsets.all(5.h),
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Color(0xffFFEED4),
                  shape: BoxShape.circle,
                ),
                child: CustomImageView(
                  //assets/images/img_cbttest.svg
                  imagePath: ImageConstant.imgCbttests,
                  height: 20.h,
                  width: 20.h,
                  fit: BoxFit.contain,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 10.h),
              //   child: Obx(
              //     () => Text(
              //       listlineItemModelObj.heading!.value,
              //       style: theme.textTheme.bodyMedium,
              //     ),
              //   ),
              // ),
              Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.h),
                    child:
                    //  Obx(
                    //   () =>
                    Text(
                      listlineItemModelObj.quizTitle!,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 16.h,
                      ),
                    ),
                    //),
                  ),
                  // Obx(
                  //   () =>
                  controller.cbtType.value == "Scheduled Test" ?   Text(
                    "${listlineItemModelObj.subjectName} • ${listlineItemModelObj.attemptsMade} of ${listlineItemModelObj.noOfQuestions}",
                    style: CustomTextStyles.bodySmallSecondaryContainer10
                        .copyWith(fontSize: 16.h),
                    //  ),
                  ) : Text(
                    "${listlineItemModelObj.subjectName} • ${listlineItemModelObj.percentageScore}% ${listlineItemModelObj.totalScore} / ${listlineItemModelObj.percentageScore}% ${listlineItemModelObj.maximumScore}",
                    style: CustomTextStyles.bodySmallSecondaryContainer10
                        .copyWith(fontSize: 16.h),
                    //  ),
                  ),
                  //${listlineItemModelObj.percentageScore}% ${listlineItemModelObj.totalScore} / ${listlineItemModelObj.percentageScore}% ${listlineItemModelObj.maximumScore}
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.h,
                      vertical: 2.h,
                    ),
                    decoration: AppDecoration.grayC7.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child:
                        //  Obx(
                        //   () =>
                        controller.cbtType.value == 'Scheduled Test'
                            ? Text(
                              "Open: ${formatDate(listlineItemModelObj.startDate.toString())}",
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodySmallWhiteA700
                                  .copyWith(fontSize: 12.h),
                              //  ),
                            )
                            : Text(
                              "Start Date: ${formatDate(listlineItemModelObj.dateStarted.toString())}",
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodySmallWhiteA700
                                  .copyWith(fontSize: 12.h),
                              //  ),
                            ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.h,
                      vertical: 2.h,
                    ),
                    decoration: AppDecoration.grayC7.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child:
                        //  Obx(
                        //   () =>
                        controller.cbtType.value == 'Scheduled Test'
                            ? Text(
                              "To: ${formatDate(listlineItemModelObj.endDate.toString())}",
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodySmallWhiteA700
                                  .copyWith(fontSize: 12.h),
                              //  ),
                            )
                            : Text(
                              "Submitted On: ${formatDate(listlineItemModelObj.dateSubmitted.toString())}",
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodySmallWhiteA700
                                  .copyWith(fontSize: 12.h),
                              //  ),
                            ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDate(String dateString) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format it to "Monday, Nov. 3, 2025"
    String formatted = DateFormat('MMM. EEE, d, yyyy h:m a').format(dateTime);

    return formatted;
  }
}
