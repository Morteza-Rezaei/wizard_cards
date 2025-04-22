import 'package:flutter/material.dart';
import 'package:wizard_cards/constants/app_color.dart';
import 'text_theme.dart';

class AppTheme {
  static const seedColor = AppColors.primaryColor;
  // Fondamento
  // EB Garamond body
  // Cinzel Decorative buttons
  static final textTheme = createTextTheme('Fondamento', 'Fondamento');

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    textTheme: textTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ),
    textTheme: textTheme,
  );
}
