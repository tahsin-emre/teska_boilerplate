import 'package:flutter/material.dart';
import 'package:teska_boilerplate/feature/base/view/base_layout.dart';
import 'package:teska_boilerplate/feature/home/view/home_desktop_layout.dart';
import 'package:teska_boilerplate/feature/home/view/home_mobile_layout.dart';
import 'package:teska_boilerplate/feature/home/view/home_tablet_layout.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      mobileLayout: HomeMobileLayout(),
      tabletLayout: HomeTabletLayout(),
      desktopLayout: HomeDesktopLayout(),
    );
  }
}
