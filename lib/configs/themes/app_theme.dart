import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primary = Color(0xFF6C63FF);
  static const blueBg = Color(0xFF7CC6FF);
  static const blackBar = Color(0xFF0F0F0F);
  static const star = Color(0xFFFFD54F);

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(primary: primary),
      textTheme: GoogleFonts.montserratTextTheme(base.textTheme),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    );
  }
}
