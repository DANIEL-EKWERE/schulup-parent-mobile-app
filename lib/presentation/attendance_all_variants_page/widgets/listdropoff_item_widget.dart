// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controller/attendance_all_variants_controller.dart';
import '../models/listdropoff_item_model.dart';

// ignore_for_file: must_be_immutable
class ListdropoffItemWidget extends StatelessWidget {
  ListdropoffItemWidget(this.listdropoffItemModelObj, {Key? key})
    : super(key: key);

  ListdropoffItemModel listdropoffItemModelObj;

  var controller = Get.find<AttendanceAllVariantsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            listdropoffItemModelObj.dropoff!.value,
            style: CustomTextStyles.bodySmallGray700,
          ),
        ),
        _buildTime(),
      ],
    );
  }

  /// Section Widget
  Widget _buildTime() {
    return CustomTextFormField(
      readOnly: true,
      width: 244.h,
      controller: listdropoffItemModelObj.timeController,
      hintText: "lbl_8_00_am".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
      borderDecoration: TextFormFieldStyleHelper.fillGreen,
      fillColor: appTheme.green500,
    );
  }
}
