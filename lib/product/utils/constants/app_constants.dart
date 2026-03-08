final class AppConstants {
  AppConstants._();

  static const String appName = 'Teska';
  static const String supportEmail = 'telli@tahsinemre.com';
  static const String appVersion = String.fromEnvironment(
    'VERSION',
    defaultValue: '100',
  );
}
