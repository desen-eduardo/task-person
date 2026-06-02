import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkGreen = Color(0xFF1A2E05);
  static const Color lightGray = Color(0xFFF0F0F0);
  static const Color cardWhite = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color editBlue = Color(0xFF1976D2);
  static const Color deleteRed = Color(0xFFD32F2F);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: lightGray,
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkGreen,
        primary: darkGreen,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkGreen,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: darkGreen,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
    );
  }
}
