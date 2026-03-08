import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class LocalizationManager extends StatelessWidget {
  const LocalizationManager({required this.child, super.key});
  final Widget child;

  static const _path = 'assets/localization';
  static const _fallbackLocale = Locale('en');
  static const _supportedLocales = [Locale('en')];
  static const _isOnlyLangCode = true;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: _path,
      supportedLocales: _supportedLocales,
      useOnlyLangCode: _isOnlyLangCode,
      fallbackLocale: _fallbackLocale,
      child: child,
    );
  }
}
