import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teska_boilerplate/feature/splash/cubit/splash_cubit.dart';
import 'package:teska_boilerplate/feature/splash/cubit/splash_state.dart';
import 'package:teska_boilerplate/feature/splash/mixin/splash_mixin.dart';
import 'package:teska_boilerplate/product/init/localization/locale_keys.g.dart';
import 'package:teska_boilerplate/product/utils/extensions/teska_widget_ext.dart';
import 'package:teska_boilerplate/product/widget/app_loading.dart';

final class SplashMobileLayout extends StatelessWidget with SplashMixin {
  const SplashMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(LocaleKeys.splash_welcome.tr()),
          BlocSelector<SplashCubit, SplashState, bool>(
            bloc: splashCubit,
            selector: (state) => state.isLoading,
            builder: (_, isLoading) {
              if (!isLoading) return const SizedBox.shrink();
              return const AppLoading();
            },
          ),
        ],
      ).teska.center,
    );
  }
}
