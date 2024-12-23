import 'package:flutter/material.dart';
import 'package:weather/application/theme_data/text_styles.dart';
import 'package:weather/application/theme_data/app_colors.dart';

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData get lightTheme {
    return _buildThemeData(_lightColorScheme, _lightFocusColor);
  }

  static ThemeData get darkTheme {
    return _buildThemeData(_darkColorScheme, _darkFocusColor);
  }

  static ThemeData _buildThemeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      outlinedButtonTheme: _outlinedButtonThemeData,
      elevatedButtonTheme: _elevatedButtonThemeData,
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      fontFamily: 'Poppins',
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: themeColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: white,
    error: crimson,
    onError: white,
    surface: surface,
    onSurface: black,
  );

  // TODO(musfique113) : Implement after project completion
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: themeColor,
    onPrimary: Colors.white,
    secondary: Color(0xFF7755E0),
    onSecondary: Color(0xFF332274),
    error: crimson,
    onError: white,
    surface: Color(0xFF171429),
    onSurface: Colors.white,
  );

  static DividerThemeData dividerThemeData(ColorScheme colorScheme) =>
      DividerThemeData(color: colorScheme.primary.withOpacity(0.24));

  static final OutlinedButtonThemeData _outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 11.5),
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: const BorderSide(color: themeColor),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: themeColor,
        fontFamily: 'Poppins',
      ),
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 11.5),
      minimumSize: const Size(double.infinity, 50),
      maximumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 0,
      foregroundColor: white,
      backgroundColor: themeColor,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: white,
        fontFamily: 'Poppins',
      ),
    ),
  );

  static InputDecorationTheme _inputDecorationTheme(ColorScheme scheme) =>
      InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        border: _inputBorder(),
        enabledBorder: _inputBorder(),
        disabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
        errorBorder: _inputBorder().copyWith(
          borderSide: BorderSide(
            color: scheme.error,
          ),
        ),
        hintStyle: TextStyles.regular16.copyWith(
          color: darkGray,
        ),
        labelStyle: TextStyles.regular16.copyWith(
          color: darkGray,
        ),
      );

  static OutlineInputBorder _inputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: themeColor),
      );
}
