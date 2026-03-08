import 'package:teska_boilerplate/product/init/env/app_environment.dart';

final class ApiConstants {
  const ApiConstants._();

  static String get baseUrl => AppEnvironment.current.envModel.baseUrl;

  static const connectionTimeout = Duration(seconds: 15);
  static const receiveTimeout = Duration(seconds: 15);
  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
