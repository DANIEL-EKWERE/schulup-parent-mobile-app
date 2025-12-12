// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/student/student_presentation/attendance_all_variants_page/models/attendance_model.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controller/attendance_all_variants_controller.dart';
import '../models/listdropoff_item_model.dart';

// ignore_for_file: must_be_immutable
class ListdropoffItemWidget extends StatelessWidget {
  ListdropoffItemWidget(this.listdropoffItemModelObj, {Key? key})
    : super(key: key);

  AttendanceLogs? listdropoffItemModelObj;

  var controller = Get.find<AttendanceAllVariantsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Obx(
        //   () =>
        Text(
          listdropoffItemModelObj!.eventType!,
          style: CustomTextStyles.bodySmallGray700,
          // ),
        ),
        _buildTime(),
      ],
    );
  }

  /// Section Widget
  Widget _buildTime() {
    // return CustomTextFormField(
    //   readOnly: true,
    //   width: 244.h,
    //   controller: TextEditingController(
    //     text: listdropoffItemModelObj!.formattedDateTime1,
    //   ),
    //   hintText: listdropoffItemModelObj!.formattedDateTime1,
    //   contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
    //   borderDecoration: TextFormFieldStyleHelper.fillGreen,
    //   fillColor: appTheme.green500,
    // );
    return Container(
      width: 244.h,
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:
            listdropoffItemModelObj!.eventType == 'DROPOFF'
                ? Color(0xffFF3B30)
                : listdropoffItemModelObj!.eventType == 'CHECKOUT' ||
                    listdropoffItemModelObj!.eventType == 'CHECKIN'
                ? Color(0xff757384)
                : listdropoffItemModelObj!.eventType == 'ABSENT'
                ? Color(0xffFF3B30)
                : listdropoffItemModelObj!.eventType == 'PUBLIC HOLIDAY'
                ? Color(0xff757384)
                : Color(0xff34C759),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            listdropoffItemModelObj!.formattedDateTime1,
            style: CustomTextStyles.bodyMediumOnPrimary.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
