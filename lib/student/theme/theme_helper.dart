import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.orange50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return appTheme.red500;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      ),
      dividerTheme: DividerThemeData(
        thickness: 20,
        space: 20,
        color: appTheme.blueGray700,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyMedium: TextStyle(
      color: appTheme.blueGray700,
      fontSize: 14.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.gray600,
      fontSize: 12.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 63.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 40.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w200,
    ),
    labelLarge: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 12.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 10.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 20.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 17.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 14.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFFF8D2A),
    primaryContainer: Color(0XFF242456),
    secondaryContainer: Color(0XFF92919F),
    onError: Color(0XFFD9D9E8),
    onPrimary: Color(0XFF27262B),
    onPrimaryContainer: Color(0XFFA8EFF9),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Amber
  Color get amber100 => Color(0XFFF4EEA9);
  Color get amberA400 => Color(0XFFFFCC00);
  // Black
  Color get black900 => Color(0XFF000000);
  // BlueGray
  Color get blueGray100 => Color(0XFFD7D7D7);
  Color get blueGray200 => Color(0XFFB2B2CC);
  Color get blueGray700 => Color(0XFF4E4C58);
  // Cyan
  Color get cyan400 => Color(0XFF20C6E6);
  // DeepOrange
  Color get deepOrange50 => Color(0XFFFFE1DF);
  // Gray
  Color get gray100 => Color(0XFFF7F7F8);
  Color get gray200 => Color(0XFFEBEBEB);
  Color get gray20001 => Color(0XFFEFEEF0);
  Color get gray20002 => Color(0XFFE8E8E8);
  Color get gray300 => Color(0XFFDAD9DE);
  Color get gray400 => Color(0XFFB9B8C1);
  Color get gray600 => Color(0XFF757384);
  Color get gray700 => Color(0XFF5F5D6C);
  // Green
  Color get green50 => Color(0XFFDFF9E5);
  Color get green500 => Color(0XFF34C759);
  // LightBlue
  Color get lightBlue100 => Color(0XFFA4D9F7);
  // Orange
  Color get orange200 => Color(0XFFFFBC71);
  Color get orange50 => Color(0XFFFFEED4);
  Color get orange9007f => Color(0X7FEF5A07);
  // Red
  Color get red500 => Color(0XFFFF3B30);
  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
  // Yellow
  Color get yellow50 => Color(0XFFFFF7ED);
}
