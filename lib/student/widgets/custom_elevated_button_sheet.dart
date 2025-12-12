import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomElevatedButtonSheet extends BaseButton {
  CustomElevatedButtonSheet({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
         text: text,
         onPressed: onPressed,
         buttonStyle: buttonStyle,
         isDisabled: isDisabled,
         buttonTextStyle: buttonTextStyle,
         height: height,
         width: width,
         alignment: alignment,
         margin: margin,
       );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
          alignment: alignment ?? Alignment.center,
          child: buildElevatedButtonWidget,
        )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
    height: this.height ?? 34.h,
    width: this.width ?? double.maxFinite,
    margin: margin,
    decoration: decoration,
    child: ElevatedButton(
      style: buttonStyle,
      onPressed: isDisabled ?? false ? null : onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  leftIcon ?? const SizedBox.shrink(),
          SizedBox(width: 10),
          Text(
            text,
            style: buttonTextStyle ?? CustomTextStyles.bodyMediumOnPrimary,
          ),
          Spacer(),
          rightIcon ?? const SizedBox.shrink(),
          SizedBox(width: 10),
        ],
      ),
    ),
  );
}
