import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/lesson_model.dart';
import '../../../core/app_export.dart';
// import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemLessonWidget extends StatelessWidget {
  ListlineItemLessonWidget(this.listlineItemModelObj, {Key? key})
    : super(key: key);

  LessonData listlineItemModelObj;

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
                child:
                // Obx(
                //   () =>
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  listlineItemModelObj.title!.length > 30
                      ? '${listlineItemModelObj.title!.substring(0, 30)}...'
                      : listlineItemModelObj.title!,
                  style: theme.textTheme.bodyMedium,
                ),
                //  ),
              ),
              // Obx(
              //   () =>
              SizedBox(
                width: 200,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  "${listlineItemModelObj.subjectMasterName!} • ${formatDate(listlineItemModelObj.lastUpdated!)}",

                  style: CustomTextStyles.bodySmallSecondaryContainer10,
                ),
              ),
              // ),
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
    String formatted = DateFormat('EEEE, MMM. d, yyyy').format(dateTime);

    return formatted;
  }
}
