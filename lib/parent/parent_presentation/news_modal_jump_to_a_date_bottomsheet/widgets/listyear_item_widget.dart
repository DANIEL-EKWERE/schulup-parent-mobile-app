// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../controller/news_modal_jump_to_a_date_controller.dart';
import '../models/listyear_item_model.dart';

// ignore_for_file: must_be_immutable
class ListyearItemWidget extends StatelessWidget {
  ListyearItemWidget(this.listyearItemModelObj, {Key? key}) : super(key: key);

  ListyearItemModel listyearItemModelObj;

  var controller = Get.find<NewsModalJumpToADateController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74.h,
      child: Column(
        spacing: 10,
        children: [
          Obx(
            () => Text(
              listyearItemModelObj.year!.value,
              style: CustomTextStyles.bodySmallSecondaryContainer10,
            ),
          ),
          _buildTwothousandtwen(),
          Obx(
            () => Text(
              listyearItemModelObj.zipcode!.value,
              style: CustomTextStyles.bodyMediumOnPrimary,
            ),
          ),
          Obx(
            () => Text(
              listyearItemModelObj.zipcodeOne!.value,
              style: CustomTextStyles.bodyMediumOnPrimary,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTwothousandtwen() {
    return CustomElevatedButton(text: "lbl_20252".tr);
  }
}
