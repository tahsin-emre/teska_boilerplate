// ignore_for_file: sort_constructors_first

import 'package:equatable/equatable.dart';

final class QueryParameterModel extends Equatable {
  const QueryParameterModel({required this.key, required this.value});

  final QueryParameterKey key;
  final String value;

  @override
  List<Object?> get props => [key, value];
}

enum QueryParameterKey {
  page('page')
  ;

  final String data;

  const QueryParameterKey(this.data);
}
