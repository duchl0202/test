import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  ThemeData get theme {
    return Theme.of(this);
  }

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }
}
