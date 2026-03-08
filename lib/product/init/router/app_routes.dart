import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teska_boilerplate/feature/home/view/home_view.dart';
import 'package:teska_boilerplate/feature/splash/view/splash_view.dart';
import 'package:teska_boilerplate/product/init/router/router_manager.dart';

part 'app_routes.g.dart';

final class AppPage extends NoTransitionPage<void> {
  const AppPage({required super.child}) : super();
}

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
final class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();
  static const path = '/';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      RouterManager.rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashView();
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
final class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  static const path = '/home';
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      RouterManager.rootNavigatorKey;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeView();
  }
}
