import 'package:teska_boilerplate/product/init/network/query_parameter_model.dart';

final class QueryParameterHelper {
  const QueryParameterHelper._();

  static Map<String, String> getQueryParameters(
    List<QueryParameterModel> parameters,
  ) {
    final queryParameters = <String, String>{};
    for (final parameter in parameters) {
      queryParameters[parameter.key.data] = parameter.value;
    }
    return queryParameters;
  }
}
