import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import '../../../core/app_export.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

  var controller = Get.find<AcademicsAssignmentStatusController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
              imagePath: ImageConstant.imgLessons,
              height: 20.h,
              width: 20.h,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            spacing: 10.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.h),
                child: Obx(
                  () => Text(
                    listlineItemModelObj.processesof!.value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  listlineItemModelObj.agricultural!.value,
                  style: CustomTextStyles.bodySmallSecondaryContainer10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
