// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    _BaseResponseModel(
      status: (json['status'] as num?)?.toInt(),
      data: json['data'],
      error: json['error'],
    );

Map<String, dynamic> _$BaseResponseModelToJson(_BaseResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'error': instance.error,
    };
