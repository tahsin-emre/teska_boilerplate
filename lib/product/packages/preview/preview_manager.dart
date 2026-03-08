import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:teska_boilerplate/product/init/env/app_environment.dart';

final class PreviewManager extends StatelessWidget {
  const PreviewManager({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: AppEnvironment.current.isDev,
      builder: (_) => child,
    );
  }
}
