import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    // Common
    String? platform,
    String? deviceName,
    String? osVersion,
    String? screenResolution,
    // Web
    String? browserName,
    String? userAgent,
    String? language,
    // Mobile
    String? brand,
    String? model,
    String? appVersion,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}
