import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/news_events_screen/models/events_model.dart';
import '../../../core/app_export.dart';
import '../controller/news_events_controller.dart';
import 'package:intl/intl.dart';

// ignore_for_file: must_be_immutable
class EventWidget extends StatelessWidget {
  EventWidget(this.eventItem, {Key? key}) : super(key: key);

  EventItem eventItem;
  //var controller = Get.find<StudentNewsEventsController>();
  StudentNewsEventsController controller = Get.put(
    StudentNewsEventsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image/Icon on the left
          Container(
            padding: EdgeInsets.all(8),
            width: 40.h,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xffFFEED4),
              shape: BoxShape.circle,
            ),
            child: CustomImageView(imagePath: ImageConstant.imgEvents),
          ),

          SizedBox(width: 10.h),

          // Content column on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row with date and label
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Obx(
                    //   () =>
                    Text(
                      formatDate(eventItem.startDate!),
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 16.h,
                      ),
                      //   ),
                    ),
                    // Row(
                    //   children: [
                    //     CustomImageView(
                    //       imagePath: ImageConstant.imgClosePrimary,
                    //       height: 16.h,
                    //       width: 16.h,
                    //     ),
                    //     // SizedBox(width: 4.h),
                    //     // // Obx(
                    //     // //   () =>
                    //     // Text(
                    //     //   'Add to Calendar',
                    //     //   style: CustomTextStyles.labelMediumPrimary,
                    //     // ),
                    //     // //  ),
                    //   ],
                    // ),
                  ],
                ),

                SizedBox(height: 10),

                // Description text
                // Obx(
                //   () =>
                Text(
                  eventItem.title!,
                  style: CustomTextStyles.bodyMediumSecondaryContainer.copyWith(
                    fontSize: 16.h,
                  ),
                ),
                // ),
              ],
            ),
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
