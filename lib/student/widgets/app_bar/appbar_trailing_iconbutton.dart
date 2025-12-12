import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_icon_button.dart';

class AppbarTrailingIconbutton extends StatelessWidget {
  AppbarTrailingIconbutton({
    Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  }) : super(key: key);

  final double? height;

  final double? width;

  final String? imagePath;

  final Function? onTap;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFFFBC71)),
            shape: BoxShape.circle,
            color: Color(0xffEF5A07),
          ),
          child: CustomIconButton(
            height: height ?? 38.h,
            width: width ?? 34.h,
            padding: EdgeInsets.all(4.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(imagePath: imagePath),
          ),
        ),
      ),
    );
  }
}
