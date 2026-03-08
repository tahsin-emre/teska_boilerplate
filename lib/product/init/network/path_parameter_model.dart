import 'package:equatable/equatable.dart';

final class PathParameterModel extends Equatable {
  const PathParameterModel({required this.key, required this.value});

  final PathParameterKey key;
  final String value;

  @override
  List<Object?> get props => [key, value];
}

enum PathParameterKey {
  id,
}
