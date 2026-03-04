import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xFFF5F5F7);
  static const Color primaryText = Color(0xFF2D2D2D);
  static const Color cardColor = Colors.white;
  static const Color hatchedCardColor = Color(0xFFD1D1D6);
  static const Color scribbleDark = Color(0xFF424242);
  static const Color scribbleLight = Color(0xFF9E9E9E);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      useMaterial3: true,
      iconTheme: const IconThemeData(color: primaryText),
    );
  }
}
