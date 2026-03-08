import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

final class ResponsiveManager {
  const ResponsiveManager._();

  static double get _mobileStartWidth => 0;
  static double get _mobileEndWidth => 800;
  static double get _tabletStartWidth => 801;
  static double get _tabletEndWidth => 1024;
  static double get _desktopStartWidth => 1025;
  static double get _desktopEndWidth => double.infinity;

  static Widget builder(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    return ResponsiveBreakpoints.builder(
      child: child,
      breakpoints: _breakpoints,
    );
  }

  static List<Breakpoint> get _breakpoints => [
    Breakpoint(
      start: _mobileStartWidth,
      end: _mobileEndWidth,
      name: MOBILE,
    ),
    Breakpoint(
      start: _tabletStartWidth,
      end: _tabletEndWidth,
      name: TABLET,
    ),
    Breakpoint(
      start: _desktopStartWidth,
      end: _desktopEndWidth,
      name: DESKTOP,
    ),
  ];
}
