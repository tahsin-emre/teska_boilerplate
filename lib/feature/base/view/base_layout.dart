import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teska_boilerplate/product/utils/extensions/teska_context_ext.dart';

final class BaseLayout extends StatelessWidget {
  const BaseLayout({
    required this.mobileLayout,
    this.desktopLayout,
    this.tabletLayout,
    this.webMobileLayout,
    super.key,
  });

  final Widget mobileLayout;
  final Widget? desktopLayout;
  final Widget? tabletLayout;
  final Widget? webMobileLayout;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (context.teska.isDesktopLayout) {
        return desktopLayout ?? tabletLayout ?? mobileLayout;
      }
      if (context.teska.isTabletLayout) {
        return tabletLayout ?? desktopLayout ?? mobileLayout;
      }
      return webMobileLayout ?? mobileLayout;
    }
    if (context.teska.isDesktopLayout) {
      return desktopLayout ?? tabletLayout ?? mobileLayout;
    } else if (context.teska.isTabletLayout) {
      return tabletLayout ?? desktopLayout ?? mobileLayout;
    } else {
      return mobileLayout;
    }
  }
}
