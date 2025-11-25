import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Accent decorations
  static BoxDecoration get accentC4 =>
      BoxDecoration(color: theme.colorScheme.onPrimaryContainer);
  // Error decorations
  static BoxDecoration get errorC1 => BoxDecoration(color: appTheme.red500);
  // Fill decorations
  static BoxDecoration get fillBlack =>
      BoxDecoration(color: appTheme.black900.withValues(alpha: 0.5));
  static BoxDecoration get fillBlueGray =>
      BoxDecoration(color: appTheme.blueGray100);
  static BoxDecoration get fillGray => BoxDecoration(color: appTheme.gray100);
  static BoxDecoration get fillGray20001 =>
      BoxDecoration(color: appTheme.gray20001);
  // Gray decorations
  static BoxDecoration get grayC1 => BoxDecoration(color: appTheme.black900);
  static BoxDecoration get grayC11 => BoxDecoration(
    color: appTheme.whiteA700,
    border: Border.all(color: appTheme.gray20001, width: 1.h),
  );
  static BoxDecoration get grayC12 => BoxDecoration(
    color: appTheme.orange50,
    border: Border(top: BorderSide(color: appTheme.gray100, width: 1.h)),
  );
  static BoxDecoration get grayC13 => BoxDecoration(color: appTheme.whiteA700);
  static BoxDecoration get grayC2 =>
      BoxDecoration(color: theme.colorScheme.onPrimary);
  static BoxDecoration get grayC7 => BoxDecoration(color: appTheme.gray600);
  // Outline decorations
  static BoxDecoration get outline =>
      BoxDecoration(color: appTheme.orange9007f);
  static BoxDecoration get outlineGray =>
      BoxDecoration(border: Border.all(color: appTheme.gray200, width: 1.h));
  // Primary decorations
  static BoxDecoration get primaryC10 =>
      BoxDecoration(color: appTheme.orange50);
  static BoxDecoration get primaryC11 =>
      BoxDecoration(color: appTheme.yellow50);

  static BoxDecoration get onPrimary =>
      BoxDecoration(color: appTheme.black900);
  static BoxDecoration get primaryC7Main => BoxDecoration(
    color: Color(0xffFF8D2A), //theme.colorScheme.primary,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(12.h),
      bottomRight: Radius.circular(12.h),
    ),
  );
  // Success decorations
  static BoxDecoration get successC1 => BoxDecoration(color: appTheme.green500);
  // Warning decorations
  static BoxDecoration get warningC2 =>
      BoxDecoration(color: appTheme.amberA400);
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder12 => BorderRadius.circular(12.h);
  static BorderRadius get circleBorder150 => BorderRadius.circular(150.h);
  static BorderRadius get circleBorder28 => BorderRadius.circular(28.h);
  // Custom borders
  static BorderRadius get customBorderBL10 => BorderRadius.only(
    topRight: Radius.circular(10.h),
    bottomLeft: Radius.circular(10.h),
    bottomRight: Radius.circular(10.h),
  );
  static BorderRadius get customBorderTL14 =>
      BorderRadius.vertical(top: Radius.circular(14.h));
  // Rounded borders
  static BorderRadius get roundedBorder18 => BorderRadius.circular(18.h);
  static BorderRadius get roundedBorder5 => BorderRadius.circular(5.h);
  static BorderRadius get roundedBorder8 => BorderRadius.circular(8.h);
}
