import 'package:dio/dio.dart';
import 'package:teska_boilerplate/product/init/di/base_container.dart';

final class NetworkInterceptor extends Interceptor {
  static const String _authorizationKey = 'Authorization';
  static const String _bearerKey = 'Bearer';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await BC.tokenStorageManager.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers[_authorizationKey] = '$_bearerKey $token';
    }

    super.onRequest(options, handler);
  }
}
