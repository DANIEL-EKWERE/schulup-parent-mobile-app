import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension RadioStyleHelper on CustomRadioButton {
  static BoxDecoration get outlineGray => BoxDecoration(
    borderRadius: BorderRadius.circular(10.h),
    border: Border.all(color: appTheme.gray400, width: 1.h),
  );
  static BoxDecoration get outlinePrimary => BoxDecoration(
    color: appTheme.yellow50,
    borderRadius: BorderRadius.circular(10.h),
    border: Border.all(color: theme.colorScheme.primary, width: 1.h),
  );
  static BoxDecoration get outlineGreen => BoxDecoration(
    color: appTheme.green50,
    borderRadius: BorderRadius.circular(10.h),
    border: Border.all(color: appTheme.green500, width: 1.h),
  );
  static BoxDecoration get outlineRed => BoxDecoration(
    color: appTheme.deepOrange50,
    borderRadius: BorderRadius.circular(10.h),
    border: Border.all(color: appTheme.red500, width: 1.h),
  );
}

// ignore_for_file: must_be_immutable
class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.groupValue,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.overflow,
    this.textAlignment,
    this.gradient,
    this.backgroundColor,
    this.isExpandedText = false,
  }) : super(key: key);

  final BoxDecoration? decoration;

  final Alignment? alignment;

  final bool? isRightCheck;

  final double? iconSize;

  String? value;

  final String? groupValue;

  final Function(String) onChange;

  final String? text;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final TextOverflow? overflow;

  final TextAlign? textAlignment;

  final Gradient? gradient;

  final Color? backgroundColor;

  final bool isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
          alignment: alignment ?? Alignment.center,
          child: buildRadioButtonWidget,
        )
        : buildRadioButtonWidget;
  }

  bool get isGradient => gradient != null;
  BoxDecoration get gradientDecoration => BoxDecoration(gradient: gradient);
  Widget get buildRadioButtonWidget => GestureDetector(
    onTap: () {
      onChange(value!);
    },
    child: Container(
      decoration: decoration,
      width: width,
      padding: padding,
      child:
          (isRightCheck ?? false) ? rightSideRadioButton : leftSideRadioButton,
    ),
  );
  Widget get leftSideRadioButton => Row(
    children: [
      radioButtonWidget,
      SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
      isExpandedText ? Expanded(child: textWidget) : textWidget,
    ],
  );
  Widget get rightSideRadioButton => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      isExpandedText ? Expanded(child: textWidget) : textWidget,
      SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
      radioButtonWidget,
    ],
  );
  Widget get textWidget => Text(
    text ?? "",
    textAlign: textAlignment ?? TextAlign.start,
    overflow: overflow,
    style: textStyle ?? CustomTextStyles.bodyMediumGray700,
  );
  Widget get radioButtonWidget => SizedBox(
    height: iconSize,
    width: iconSize,
    child: Radio<String>(
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      value: value ?? "",
      groupValue: groupValue,
      onChanged: (value) {
        onChange(value!);
      },
    ),
  );
  BoxDecoration get radioButtonDecoration =>
      BoxDecoration(color: backgroundColor);
}
