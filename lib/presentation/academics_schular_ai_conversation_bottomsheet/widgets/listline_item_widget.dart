import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/academics_schular_ai_conversation_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

  var controller = Get.find<AcademicsSchularAiConversationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Container(
                  width: 250.h,
                  margin: EdgeInsets.only(left: 10.h),
                  child: Obx(
                    () => Text(
                      listlineItemModelObj.understanding!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium!.copyWith(height: 1.50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              listlineItemModelObj.nov102025!.value,
              style: CustomTextStyles.bodySmallSecondaryContainer10,
            ),
          ),
        ],
      ),
    );
  }
}
