import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:teska_boilerplate/product/init/router/router_manager.dart';
import 'package:teska_boilerplate/product/init/theme/app_theme.dart';
import 'package:teska_boilerplate/product/packages/responsive/responsive_manager.dart';
import 'package:teska_boilerplate/product/utils/constants/app_constants.dart';
import 'package:teska_boilerplate/product/utils/helpers/app_scroll_behavior.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: AppConstants.appName,
      routerConfig: RouterManager.config,
      builder: ResponsiveManager.builder,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const AppScrollBehavior(),
      theme: AppTheme.lightTheme,
    );
  }
}
