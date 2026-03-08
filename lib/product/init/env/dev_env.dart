import 'package:envied/envied.dart';
import 'package:teska_boilerplate/product/init/env/env_model.dart';

part 'dev_env.g.dart';

@Envied(path: '.env.dev', obfuscate: true)
final class DevEnv implements EnvModel {
  DevEnv();

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _DevEnv.baseUrl;
}
