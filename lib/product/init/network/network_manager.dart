import 'package:dio/dio.dart';
import 'package:teska_boilerplate/product/init/network/base_response_model.dart';
import 'package:teska_boilerplate/product/init/network/network_interceptor.dart';
import 'package:teska_boilerplate/product/init/network/network_model.dart';
import 'package:teska_boilerplate/product/packages/logger/custom_logger.dart';
import 'package:teska_boilerplate/product/utils/constants/api_constants.dart';

typedef DioMap = Map<String, dynamic>;

final class NetworkManager {
  NetworkManager._init() {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectionTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: ApiConstants.headers,
    );
    final dio = Dio(options);

    dio.interceptors.add(NetworkInterceptor());
    _dio = dio;
  }

  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;
  late final Dio _dio;

  /// [RES] : Response Model Type (Ex: NetworkResponseModel)
  /// [REQ] : Request Body Model Type (Ex: NetworkRequestModel)
  /// [path] : Endpoint Path
  /// [parser] : Instance of the Response Model (to call fromJson)
  /// [queryParameters] : Optional Query Parameters
  /// [requestModel] : Optional Request Body Model
  Future<RES?>
  get<REQ extends INetworkModel<REQ>, RES extends INetworkModel<RES>>({
    required String path,
    required RES parser,
    REQ? requestModel,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<DioMap>(
        path,
        queryParameters: queryParameters,
        data: requestModel?.toJson(),
      );
      final pathMessage = 'path: $path';
      final paramMessage = 'query params: $queryParameters';
      final bodyMessage = 'req body: ${requestModel?.toJson()}';
      final responseMessage = 'response: $response';
      final reqMessage = '$pathMessage \n $paramMessage \n $bodyMessage';
      LOG.info(reqMessage);
      LOG.info(responseMessage);
      final rdata = response.data;
      if (rdata == null) return null;
      final result = BaseResponseModel.fromJson(rdata);
      if (result.hasError || result.data == null) return null;
      if (result.data is! Map<String, dynamic>) return null;
      return parser.fromJson(result.data as Map<String, dynamic>);
    } on DioException catch (e) {
      LOG.error('NetworkManager GET Error: ${e.message}');
      rethrow;
    }
  }

  /// [RES] : Response Model Type (Ex: NetworkResponseModel)
  /// [REQ] : Request Body Model Type (Ex: NetworkRequestModel)
  /// [path] : Endpoint Path
  /// [parser] : Instance of the Response Model (to call fromJson)
  /// [queryParameters] : Optional Query Parameters
  /// [requestModel] : Optional Request Body Model
  Future<RES?>
  post<REQ extends INetworkModel<REQ>, RES extends INetworkModel<RES>>({
    required String path,
    required RES parser,
    REQ? requestModel,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post<DioMap>(
        path,
        queryParameters: queryParameters,
        data: requestModel?.toJson(),
      );
      final pathMessage = 'path: $path';
      final paramMessage = 'query params: $queryParameters';
      final bodyMessage = 'req body: ${requestModel?.toJson()}';
      final responseMessage = 'response: $response';
      final reqMessage = '$pathMessage \n $paramMessage \n $bodyMessage';
      LOG.info(reqMessage);
      LOG.info(responseMessage);
      final rdata = response.data;
      if (rdata == null) return null;
      final result = BaseResponseModel.fromJson(rdata);
      if (result.hasError || result.data == null) return null;
      if (result.data is! Map<String, dynamic>) return null;
      return parser.fromJson(result.data as Map<String, dynamic>);
    } on DioException catch (e) {
      LOG.error('NetworkManager POST Error: ${e.message}');
      rethrow;
    }
  }

  /// [RES] : Response Model Type (Ex: NetworkResponseModel)
  /// [REQ] : Request Body Model Type (Ex: NetworkRequestModel)
  /// [path] : Endpoint Path
  /// [parser] : Instance of the Response Model (to call fromJson)
  /// [queryParameters] : Optional Query Parameters
  /// [requestModel] : Optional Request Body Model
  Future<RES?>
  patch<REQ extends INetworkModel<REQ>, RES extends INetworkModel<RES>>({
    required String path,
    required RES parser,
    Map<String, dynamic>? queryParameters,
    REQ? requestModel,
  }) async {
    try {
      final response = await _dio.patch<DioMap>(
        path,
        queryParameters: queryParameters,
        data: requestModel?.toJson(),
      );
      final pathMessage = 'path: $path';
      final paramMessage = 'query params: $queryParameters';
      final bodyMessage = 'req body: ${requestModel?.toJson()}';
      final responseMessage = 'response: $response';
      final reqMessage = '$pathMessage \n $paramMessage \n $bodyMessage';
      LOG.info(reqMessage);
      LOG.info(responseMessage);
      final rdata = response.data;
      if (rdata == null) return null;
      final result = BaseResponseModel.fromJson(rdata);
      if (result.hasError || result.data == null) return null;
      if (result.data is! Map<String, dynamic>) return null;
      return parser.fromJson(result.data as Map<String, dynamic>);
    } on DioException catch (e) {
      LOG.error('NetworkManager PATCH Error: ${e.message}');
      rethrow;
    }
  }
}
