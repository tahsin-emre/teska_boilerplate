import 'package:teska_boilerplate/product/init/env/dev_env.dart';
import 'package:teska_boilerplate/product/init/env/env_model.dart';
import 'package:teska_boilerplate/product/init/env/prod_env.dart';

/// Available environments for the application.
///
/// Driven by `--dart-define=ENV=prod`.
///
/// ```dart
/// AppEnvironment.current.envModel.baseUrl;
/// AppEnvironment.current.isDev;
/// ```
enum AppEnvironment {
  dev('.env.dev', 'Development'),
  prod('.env.prod', 'Production'),
  ;

  const AppEnvironment(this.envFile, this.displayName);

  final String envFile;
  final String displayName;

  /// Resolves the current environment from `--dart-define=ENV=...`.
  static AppEnvironment get current {
    const envName = String.fromEnvironment('ENV', defaultValue: 'dev');
    return values.firstWhere(
      (e) => e.name == envName,
      orElse: () => dev,
    );
  }

  bool get isDev => this == AppEnvironment.dev;
  bool get isProd => this == AppEnvironment.prod;

  /// Returns the [EnvModel] instance for this environment.
  EnvModel get envModel {
    return switch (this) {
      AppEnvironment.dev => DevEnv(),
      AppEnvironment.prod => ProdEnv(),
    };
  }
}
