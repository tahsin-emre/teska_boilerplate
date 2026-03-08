import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teska_boilerplate/product/init/guard/app_initialization_guard.dart';
import 'package:teska_boilerplate/product/init/router/app_routes.dart';

final class RouterManager {
  const RouterManager._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final mainShellKey = GlobalKey<NavigatorState>();

  static GoRouter config = GoRouter(
    initialLocation: SplashRoute.path,
    navigatorKey: rootNavigatorKey,
    routes: $appRoutes,
    refreshListenable: AppInitializationGuard.instance,
    redirect: (context, state) {
      if (!AppInitializationGuard.instance.isInitialized &&
          state.matchedLocation != SplashRoute.path) {
        return SplashRoute.path;
      }
      return null;
    },
  );
}
