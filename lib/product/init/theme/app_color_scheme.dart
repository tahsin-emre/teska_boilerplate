import 'package:flutter/material.dart';
import 'package:teska_boilerplate/product/init/theme/app_colors.dart';

final class AppColorScheme {
  const AppColorScheme._();

  static ColorScheme get light {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    );
  }

  static ColorScheme get dark {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    );
  }
}
