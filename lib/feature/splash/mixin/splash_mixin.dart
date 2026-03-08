import 'package:flutter/material.dart';
import 'package:teska_boilerplate/feature/splash/cubit/splash_cubit.dart';
import 'package:teska_boilerplate/product/init/di/base_container.dart';
import 'package:teska_boilerplate/product/init/router/app_routes.dart';

mixin SplashMixin {
  SplashCubit get splashCubit => BC.splashCubit;

  Future<void> initialize(BuildContext context) async {
    await splashCubit.initialize();
    if (!context.mounted) return;
    navigateToHome(context);
  }

  void navigateToHome(BuildContext context) {
    const HomeRoute().go(context);
  }
}
