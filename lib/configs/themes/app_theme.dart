import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF6554C0);
  static const blueBg = Color(0xFFDDEEFF);
  static const blackBar = Color(0xFF191B27);
  static const star = Color(0xFFC9BAFF);
  static const background = Color(0xFFFAF9F6);
  static const ink = Color(0xFF20212B);
  static const muted = Color(0xFF656575);
  static const line = Color(0xFFE6E4EC);

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(seedColor: primary).copyWith(
      primary: primary,
      surface: background,
      onSurface: ink,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'PortfolioSans',
      scaffoldBackgroundColor: background,
      textTheme:
          const TextTheme(bodyMedium: TextStyle(height: 1.6, color: ink)),
      dividerColor: line,
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(
            fontFamily: 'PortfolioSans',
            fontWeight: FontWeight.w600,
            fontSize: 14),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        side: const BorderSide(color: line),
        foregroundColor: ink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )),
      appBarTheme: const AppBarTheme(backgroundColor: background, elevation: 0),
    );
  }
}
