import 'package:flutter/foundation.dart';

/// Available platforms for the application.
///
/// ```dart
/// AppPlatform.current.isWeb;
/// AppPlatform.current.isIOS;
/// ```
enum AppPlatform {
  other('Other'),
  web('Web'),
  ios('iOS'),
  android('Android'),
  ;

  const AppPlatform(this.displayName);

  final String displayName;

  static AppPlatform get current {
    if (kIsWeb) return web;
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => ios,
      TargetPlatform.android => android,
      TargetPlatform.fuchsia ||
      TargetPlatform.linux ||
      TargetPlatform.macOS ||
      TargetPlatform.windows => other,
    };
  }

  bool get isWeb => this == AppPlatform.web;
  bool get isIOS => this == AppPlatform.ios;
  bool get isAndroid => this == AppPlatform.android;
  bool get isOther => this == AppPlatform.other;
  bool get isMobile => isIOS || isAndroid;
}
