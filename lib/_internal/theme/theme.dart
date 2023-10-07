import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor primarySwatch = _primarySwatch;
  static const MaterialColor secondarySwatch = _secondarySwatch;
  static const MaterialColor successSwatch = _successSwatch;
  static const MaterialColor infoSwatch = _infoSwatch;
  static const MaterialColor warningSwatch = _warningSwatch;
  static const MaterialColor dangerSwatch = _dangerSwatch;
  static const SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating;

  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: primarySwatch,
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primarySwatch,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: snackBarBehavior,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: primarySwatch,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: primarySwatch,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: snackBarBehavior,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return primarySwatch;
          }
          return null;
        }),
      ),
    );
  }
}

const MaterialColor _primarySwatch = MaterialColor(
  0xFF7E00FA,
  <int, Color>{
    50: Color(0xFFFDEAFE),
    100: Color(0xFFEFCBFE),
    200: Color(0xFFDB98FE),
    300: Color(0xFFC165FD),
    400: Color(0xFFA73EFB),
    500: Color(0xFF7E00FA),
    600: Color(0xFF6100D7),
    700: Color(0xFF4800B3),
    800: Color(0xFF330090),
    900: Color(0xFF240077),
  },
);

const MaterialColor _secondarySwatch = MaterialColor(
  0xFFA040FF,
  <int, Color>{
    50: Color(0xFFFDEFFF),
    100: Color(0xFFF3D8FF),
    200: Color(0xFFE4B2FF),
    300: Color(0xFFD18CFF),
    400: Color(0xFFBE6FFF),
    500: Color(0xFFA040FF),
    600: Color(0xFF7C2EDB),
    700: Color(0xFF5D20B7),
    800: Color(0xFF411493),
    900: Color(0xFF2D0C7A),
  },
);

const MaterialColor _successSwatch = MaterialColor(
  0xFF8FDD11,
  <int, Color>{
    50: Color(0xFFFBFEEB),
    100: Color(0xFFF2FDCE),
    200: Color(0xFFE2FB9E),
    300: Color(0xFFCBF46D),
    400: Color(0xFFB2EA48),
    500: Color(0xFF8FDD11),
    600: Color(0xFF73BE0C),
    700: Color(0xFF599F08),
    800: Color(0xFF428005),
    900: Color(0xFF326A03),
  },
);

const MaterialColor _infoSwatch = MaterialColor(
  0xFF00BFFF,
  <int, Color>{
    50: Color(0xFFEAFFF8),
    100: Color(0xFFCCFFFD),
    200: Color(0xFF99FBFF),
    300: Color(0xFF66EEFF),
    400: Color(0xFF3FDCFF),
    500: Color(0xFF00BFFF),
    600: Color(0xFF0094DB),
    700: Color(0xFF006FB7),
    800: Color(0xFF004F93),
    900: Color(0xFF00397A),
  },
);

const MaterialColor _warningSwatch = MaterialColor(
  0xFFFFE102,
  <int, Color>{
    50: Color(0xFFFFFDEA),
    100: Color(0xFFFFFBCC),
    200: Color(0xFFFFF699),
    300: Color(0xFFFFF067),
    400: Color(0xFFFFEA41),
    500: Color(0xFFFFE102),
    600: Color(0xFFDBBE01),
    700: Color(0xFFB79D01),
    800: Color(0xFF937C00),
    900: Color(0xFF7A6500),
  },
);

const MaterialColor _dangerSwatch = MaterialColor(
  0xFFFF6123,
  <int, Color>{
    50: Color(0xFFFFF9ED),
    100: Color(0xFFFFEBD3),
    200: Color(0xFFFFD1A6),
    300: Color(0xFFFFB27A),
    400: Color(0xFFFF9359),
    500: Color(0xFFFF6123),
    600: Color(0xFFDB4219),
    700: Color(0xFFB72911),
    800: Color(0xFF93150B),
    900: Color(0xFF7A0706),
  },
);
