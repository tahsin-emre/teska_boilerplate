import 'package:flutter/material.dart';
import 'package:teska_boilerplate/feature/base/view/base_layout.dart';
import 'package:teska_boilerplate/feature/splash/mixin/splash_mixin.dart';
import 'package:teska_boilerplate/feature/splash/view/mixin/splash_view_mixin.dart';
import 'package:teska_boilerplate/feature/splash/view/splash_mobile_layout.dart';

final class SplashView extends StatefulWidget with SplashMixin {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      mobileLayout: SplashMobileLayout(),
    );
  }
}
