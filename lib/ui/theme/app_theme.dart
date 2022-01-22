import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/util/local_data_util.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

export 'package:studyflutter/ui/theme/app_text_theme.dart' show TextStyleExt;

final appThemeModeProvider =
    StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
  (ref) => StateController(
      getInt(Constants.appTheme) == 0 ? ThemeMode.light : ThemeMode.dark),
);

//
final appThemeProvider = Provider<AppTheme>(
  (ref) {
    final mode = ref.watch(appThemeModeProvider);
    switch (mode) {
      case ThemeMode.dark:
        return AppTheme.dark();
      case ThemeMode.light:
      default:
        return AppTheme.light();
    }
  },
);

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      scaffoldBackgroundColor: appColors.background,
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: appColors.background,
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  AppTheme copyWith({
    Color? btnTextColor,
    Color? btnBgColor,
  }) {
    return AppTheme(
      mode: mode,
      data: data,
      textTheme: textTheme,
      appColors: AppColors(
        btnTextColor: btnTextColor ?? appColors.btnTextColor,
        btnBgColor: btnBgColor ?? appColors.btnBgColor,
        background: appColors.background,
        accent: appColors.accent,
        disabled: appColors.disabled,
        error: appColors.error,
        divider: appColors.divider,
        signIn: appColors.signIn,
        signOut: appColors.signOut,
      ),
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}
