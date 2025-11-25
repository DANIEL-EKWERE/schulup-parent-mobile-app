// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/news_events_controller.dart';
import '../models/listjuncounter_item_model.dart';

// ignore_for_file: must_be_immutable
class ListjuncounterItemWidget extends StatelessWidget {
  ListjuncounterItemWidget(this.listjuncounterItemModelObj, {Key? key})
    : super(key: key);

  String listjuncounterItemModelObj;

  var controller = Get.find<NewsEventsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.h),
        decoration:
            controller.selectedMonth.value == listjuncounterItemModelObj
                ? AppDecoration.onPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder18,
                )
                : AppDecoration.grayC13.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder18,
                ),
        child: Obx(
          () => Text(
            listjuncounterItemModelObj,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style:
                controller.selectedMonth.value == listjuncounterItemModelObj
                    ? CustomTextStyles.bodySmallOnPrimary_1.copyWith(
                      color: appTheme.whiteA700,
                    )
                    : CustomTextStyles.bodySmallOnPrimary_1,
          ),
        ),
      ),
    );
  }
}
