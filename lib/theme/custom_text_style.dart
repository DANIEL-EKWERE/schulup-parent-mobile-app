import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get rubik {
    return copyWith(fontFamily: 'Rubik');
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyMediumGray700 =>
      theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray700);
  static TextStyle get bodyMediumOnPrimary =>
      theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onPrimary);
  static TextStyle get bodyMediumSecondaryContainer => theme
      .textTheme
      .bodyMedium!
      .copyWith(color: theme.colorScheme.secondaryContainer);
  static TextStyle get bodySmall10 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 12.fSize);
  static TextStyle get bodySmall10_1 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 12.fSize);
  static TextStyle get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray700,
    fontSize: 12.fSize,
  );
  static TextStyle get bodySmallGray700_1 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray700);
  static TextStyle get bodySmallOnPrimary => theme.textTheme.bodySmall!
      .copyWith(color: theme.colorScheme.onPrimary, fontSize: 12.fSize);
  static TextStyle get bodySmallOnPrimary_1 =>
      theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.onPrimary);
  static TextStyle get bodySmallSecondaryContainer => theme.textTheme.bodySmall!
      .copyWith(color: theme.colorScheme.secondaryContainer);
  static TextStyle get bodySmallSecondaryContainer10 =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 12.fSize,
      );
  static TextStyle get bodySmallWhiteA700 => theme.textTheme.bodySmall!
      .copyWith(color: appTheme.whiteA700, fontSize: 12.fSize);
  static TextStyle get bodySmallWhiteA700_1 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.whiteA700);
  // Display text style
  static TextStyle get displayMediumBlack =>
      theme.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w900);
  // Label text style
  static TextStyle get labelLargeBluegray700 =>
      theme.textTheme.labelLarge!.copyWith(color: appTheme.blueGray700);
  static TextStyle get labelLargePrimary =>
      theme.textTheme.labelLarge!.copyWith(color: theme.colorScheme.primary);
  static TextStyle get labelMediumPrimary =>
      theme.textTheme.labelMedium!.copyWith(color: theme.colorScheme.primary);
  static TextStyle get labelMediumRed500 =>
      theme.textTheme.labelMedium!.copyWith(color: appTheme.red500);
  static TextStyle get labelMediumSecondaryContainer => theme
      .textTheme
      .labelMedium!
      .copyWith(color: theme.colorScheme.secondaryContainer);
  // Rubik text style
  static TextStyle get rubikWhiteA700 =>
      TextStyle(
        color: appTheme.whiteA700,
        fontSize: 1.fSize,
        fontWeight: FontWeight.w500,
      ).rubik;
  static TextStyle get rubikWhiteA700Bold =>
      TextStyle(
        color: appTheme.whiteA700,
        fontSize: 5.fSize,
        fontWeight: FontWeight.w700,
      ).rubik;
  // Title text style
  static TextStyle get titleMediumOnPrimary =>
      theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onPrimary);
  static TextStyle get titleSmallWhiteA700 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.whiteA700);
}
