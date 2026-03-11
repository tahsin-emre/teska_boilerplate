// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => _DeviceModel(
  platform: json['platform'] as String?,
  browserName: json['browserName'] as String?,
  userAgent: json['userAgent'] as String?,
  language: json['language'] as String?,
  screenResolution: json['screenResolution'] as String?,
);

Map<String, dynamic> _$DeviceModelToJson(_DeviceModel instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'browserName': instance.browserName,
      'userAgent': instance.userAgent,
      'language': instance.language,
      'screenResolution': instance.screenResolution,
    };
