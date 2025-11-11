import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/chipviewdueonoc_item_model.dart';

// ignore_for_file: must_be_immutable
class ChipviewdueonocItemWidget extends StatelessWidget {
  ChipviewdueonocItemWidget(this.chipviewdueonocItemModelObj, {Key? key})
    : super(key: key);

  ChipviewdueonocItemModel chipviewdueonocItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewdueonocItemModelObj.dueonoct302025!.value,
          style: TextStyle(
            color: appTheme.whiteA700,
            fontSize: 10.fSize,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (chipviewdueonocItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.green500,
        selectedColor: theme.colorScheme.primary,
        side: BorderSide.none,
        shape:
            (chipviewdueonocItemModelObj.isSelected?.value ?? false)
                ? RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.h),
                )
                : RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.h),
                ),
        onSelected: (value) {
          chipviewdueonocItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
