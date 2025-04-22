import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(String bodyFont, String displayFont) {
  final base = Typography.material2021().black;
  final body = GoogleFonts.getTextTheme(bodyFont, base);
  final display = GoogleFonts.getTextTheme(displayFont, base);
  return display.copyWith(
    bodyLarge: body.bodyLarge,
    bodyMedium: body.bodyMedium,
    bodySmall: body.bodySmall,
    labelLarge: body.labelLarge,
    labelMedium: body.labelMedium,
    labelSmall: body.labelSmall,
  );
}
