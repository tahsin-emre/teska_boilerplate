import 'package:flutter/material.dart';
import 'package:teska_boilerplate/feature/splash/view/splash_view.dart';

mixin SplashViewMixin on State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.initialize(context);
    });
  }
}
