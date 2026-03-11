// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => _DeviceModel(
  platform: json['platform'] as String?,
  deviceName: json['deviceName'] as String?,
  osVersion: json['osVersion'] as String?,
  screenResolution: json['screenResolution'] as String?,
  browserName: json['browserName'] as String?,
  userAgent: json['userAgent'] as String?,
  language: json['language'] as String?,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  appVersion: json['appVersion'] as String?,
);

Map<String, dynamic> _$DeviceModelToJson(_DeviceModel instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'deviceName': instance.deviceName,
      'osVersion': instance.osVersion,
      'screenResolution': instance.screenResolution,
      'browserName': instance.browserName,
      'userAgent': instance.userAgent,
      'language': instance.language,
      'brand': instance.brand,
      'model': instance.model,
      'appVersion': instance.appVersion,
    };
