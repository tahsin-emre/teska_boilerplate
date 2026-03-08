enum AppEnvironment {
  dev,
  prod,
  ;

  static AppEnvironment get current {
    const envText = String.fromEnvironment('ENV', defaultValue: 'dev');

    switch (envText) {
      case 'prod':
        return AppEnvironment.prod;
      case 'dev':
        return AppEnvironment.dev;
      default:
        return AppEnvironment.dev;
    }
  }
}

extension AppEnvironmentExt on AppEnvironment {
  bool get isDev => this == AppEnvironment.dev;
  bool get isProd => this == AppEnvironment.prod;
}
