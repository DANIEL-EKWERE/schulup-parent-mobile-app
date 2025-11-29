import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:schulupparent/presentation/academics_schular_ai_ongoing_screen/models/academics_schular_ai_ongoing_model.dart';
import '../../../core/app_export.dart';
import '../controller/academics_schular_ai_conversation_controller.dart';
import '../models/listline_item_model.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ChatData listlineItemModelObj;

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
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffFFEED4),
                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    imagePath: 'assets/images/img_icons_small_history.png',
                  ),
                ),
                Container(
                  width: 200.h,
                  margin: EdgeInsets.only(left: 10.h),
                  child:
                  // Obx(
                  //   () =>
                  Text(
                    listlineItemModelObj.response!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(height: 1.50),
                    //  ),
                  ),
                ),
              ],
            ),
          ),
          // Obx(
          //   () =>
          Text(
            listlineItemModelObj.formattedTimestamp,
            style: CustomTextStyles.bodySmallSecondaryContainer10,
            //   ),
          ),
        ],
      ),
    );
  }
}
