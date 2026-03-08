/// Abstract base class for environment configuration.
///
/// All environment-specific classes (DevEnv, ProdEnv) must implement this.
/// New env variables should be added here first, then implemented
/// in each environment class.
abstract class EnvModel {
  String get baseUrl;
}
