// Uygulama içerisinde kullanılacak olan dekorasyonlar burada tanımlanmıştır.
import 'package:flutter/material.dart';

class AppDecorations {
  // app border radius circle
  static const BorderRadius appBorderRadiusCircle = BorderRadius.all(
    Radius.circular(100),
  );

  // app margin (body)
  static const EdgeInsets appMargin = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 32,
  );

  // vertical space
  static const double verticalSpace = 16.0;
}
