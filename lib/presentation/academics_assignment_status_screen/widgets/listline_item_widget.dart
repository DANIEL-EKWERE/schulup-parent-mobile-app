import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/assignment_model.dart';
import '../../../core/app_export.dart';
import '../controller/academics_assignment_status_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  AssignmentData listlineItemModelObj;

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
                  imagePath: ImageConstant.imgAssignments,
                  height: 20.h,
                  width: 20.h,
                  fit: BoxFit.contain,
                ),
              ),

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
                      listlineItemModelObj.title!,
                      style: theme.textTheme.bodyMedium,
                    ),
                    //  ),
                  ),
                  // Obx(
                  //   () =>
                  Text(
                    "${listlineItemModelObj.subjectName!} • ${listlineItemModelObj.formattedDatePosted}",
                    style: CustomTextStyles.bodySmallSecondaryContainer10,
                    // ),
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
                    Text(
                      listlineItemModelObj.formattedDueDateWithDay,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallWhiteA700,
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
}
