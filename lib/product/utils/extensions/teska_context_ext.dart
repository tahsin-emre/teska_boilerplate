import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension TeskaContextExt on BuildContext {
  _TeskaContextExt get teska => _TeskaContextExt(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

final class _TeskaContextExt {
  const _TeskaContextExt(this.value);

  final BuildContext value;

  ThemeData get theme => Theme.of(value);

  double get screenWidth => MediaQuery.sizeOf(value).width;
  double get screenHeight => MediaQuery.sizeOf(value).height;

  double w(double percent) => screenWidth * percent / 100;
  double h(double percent) => screenHeight * percent / 100;

  bool get isDarkMode => theme.brightness == Brightness.dark;
  bool get isLightMode => theme.brightness == Brightness.light;

  bool get isMobileLayout {
    return ResponsiveBreakpoints.of(value).isMobile;
  }

  bool get isTabletLayout {
    return ResponsiveBreakpoints.of(value).isTablet;
  }

  bool get isDesktopLayout {
    return ResponsiveBreakpoints.of(value).isDesktop;
  }
}
