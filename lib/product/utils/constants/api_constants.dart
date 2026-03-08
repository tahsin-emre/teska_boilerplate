import 'package:teska_boilerplate/product/utils/enums/app_environment.dart';

final class ApiConstants {
  const ApiConstants._();

  static String get baseUrl {
    return switch (AppEnvironment.current) {
      AppEnvironment.prod => 'https://domain.com/api',
      AppEnvironment.dev => 'https://dev.domain.com/api',
    };
  }

  static const connectionTimeout = Duration(seconds: 15);
  static const receiveTimeout = Duration(seconds: 15);
  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
