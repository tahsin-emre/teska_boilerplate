import 'package:envied/envied.dart';
import 'package:teska_boilerplate/product/init/env/env_model.dart';

part 'prod_env.g.dart';

@Envied(path: '.env.prod', obfuscate: true)
final class ProdEnv implements EnvModel {
  ProdEnv();

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _ProdEnv.baseUrl;
}
