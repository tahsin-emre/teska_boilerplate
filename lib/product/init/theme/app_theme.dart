import 'package:flutter/material.dart';
import 'package:teska_boilerplate/product/init/theme/app_color_scheme.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    colorScheme: AppColorScheme.light,
  );

  static ThemeData get darkTheme => ThemeData(
    colorScheme: AppColorScheme.dark,
  );
}
