// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/academics_assignment_status_one_controller.dart';
import '../models/chipviewdueonoc_item_model.dart';
import '../models/listline_item_model.dart';
import 'chipviewdueonoc_item_widget.dart';

// ignore_for_file: must_be_immutable
class ListlineItemWidget extends StatelessWidget {
  ListlineItemWidget(this.listlineItemModelObj, {Key? key}) : super(key: key);

  ListlineItemModel listlineItemModelObj;

  var controller = Get.find<AcademicsAssignmentStatusOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
      decoration: AppDecoration.primaryC11.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                VerticalDivider(width: 5.h, thickness: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Obx(
                    () => Text(
                      listlineItemModelObj.partsofspeech!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              listlineItemModelObj.english!.value,
              style: CustomTextStyles.bodySmallSecondaryContainer10,
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10.h,
                  spacing: 10.h,
                  children: List<Widget>.generate(
                    listlineItemModelObj
                            .chipviewdueonocItemList
                            ?.value
                            .length ??
                        0,
                    (index) {
                      ChipviewdueonocItemModel model =
                          listlineItemModelObj
                              .chipviewdueonocItemList
                              ?.value[index] ??
                          ChipviewdueonocItemModel();
                      return ChipviewdueonocItemWidget(model);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
