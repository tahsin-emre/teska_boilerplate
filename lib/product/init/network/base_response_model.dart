import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_model.freezed.dart';
part 'base_response_model.g.dart';

@freezed
abstract class BaseResponseModel with _$BaseResponseModel {
  const factory BaseResponseModel({
    int? status,
    dynamic data,
    dynamic error,
  }) = _BaseResponseModel;

  const BaseResponseModel._();

  factory BaseResponseModel.fromJson(Map<String, Object?> json) =>
      _$BaseResponseModelFromJson(json);

  bool get hasError => error != null;
}
