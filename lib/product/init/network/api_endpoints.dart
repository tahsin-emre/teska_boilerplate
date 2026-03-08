// ignore_for_file: sort_constructors_first

import 'package:teska_boilerplate/product/init/network/path_parameter_model.dart';

enum ApiEndpoints {
  base('/'),
  ;

  final String path;
  const ApiEndpoints(this.path);

  String pathWithArgs(List<PathParameterModel> args) {
    var pathReplaced = path;
    for (final arg in args) {
      pathReplaced = pathReplaced.replaceAll(':${arg.key.name}', arg.value);
    }
    return pathReplaced;
  }
}
