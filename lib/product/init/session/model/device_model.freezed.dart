// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceModel {

// Common
 String? get platform; String? get deviceName; String? get osVersion; String? get screenResolution;// Web
 String? get browserName; String? get userAgent; String? get language;// Mobile
 String? get brand; String? get model; String? get appVersion;
/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<DeviceModel> get copyWith => _$DeviceModelCopyWithImpl<DeviceModel>(this as DeviceModel, _$identity);

  /// Serializes this DeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceModel&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.screenResolution, screenResolution) || other.screenResolution == screenResolution)&&(identical(other.browserName, browserName) || other.browserName == browserName)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.language, language) || other.language == language)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,deviceName,osVersion,screenResolution,browserName,userAgent,language,brand,model,appVersion);

@override
String toString() {
  return 'DeviceModel(platform: $platform, deviceName: $deviceName, osVersion: $osVersion, screenResolution: $screenResolution, browserName: $browserName, userAgent: $userAgent, language: $language, brand: $brand, model: $model, appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class $DeviceModelCopyWith<$Res>  {
  factory $DeviceModelCopyWith(DeviceModel value, $Res Function(DeviceModel) _then) = _$DeviceModelCopyWithImpl;
@useResult
$Res call({
 String? platform, String? deviceName, String? osVersion, String? screenResolution, String? browserName, String? userAgent, String? language, String? brand, String? model, String? appVersion
});




}
/// @nodoc
class _$DeviceModelCopyWithImpl<$Res>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._self, this._then);

  final DeviceModel _self;
  final $Res Function(DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = freezed,Object? deviceName = freezed,Object? osVersion = freezed,Object? screenResolution = freezed,Object? browserName = freezed,Object? userAgent = freezed,Object? language = freezed,Object? brand = freezed,Object? model = freezed,Object? appVersion = freezed,}) {
  return _then(_self.copyWith(
platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,screenResolution: freezed == screenResolution ? _self.screenResolution : screenResolution // ignore: cast_nullable_to_non_nullable
as String?,browserName: freezed == browserName ? _self.browserName : browserName // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceModel].
extension DeviceModelPatterns on DeviceModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? platform,  String? deviceName,  String? osVersion,  String? screenResolution,  String? browserName,  String? userAgent,  String? language,  String? brand,  String? model,  String? appVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.platform,_that.deviceName,_that.osVersion,_that.screenResolution,_that.browserName,_that.userAgent,_that.language,_that.brand,_that.model,_that.appVersion);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? platform,  String? deviceName,  String? osVersion,  String? screenResolution,  String? browserName,  String? userAgent,  String? language,  String? brand,  String? model,  String? appVersion)  $default,) {final _that = this;
switch (_that) {
case _DeviceModel():
return $default(_that.platform,_that.deviceName,_that.osVersion,_that.screenResolution,_that.browserName,_that.userAgent,_that.language,_that.brand,_that.model,_that.appVersion);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? platform,  String? deviceName,  String? osVersion,  String? screenResolution,  String? browserName,  String? userAgent,  String? language,  String? brand,  String? model,  String? appVersion)?  $default,) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.platform,_that.deviceName,_that.osVersion,_that.screenResolution,_that.browserName,_that.userAgent,_that.language,_that.brand,_that.model,_that.appVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceModel implements DeviceModel {
  const _DeviceModel({this.platform, this.deviceName, this.osVersion, this.screenResolution, this.browserName, this.userAgent, this.language, this.brand, this.model, this.appVersion});
  factory _DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

// Common
@override final  String? platform;
@override final  String? deviceName;
@override final  String? osVersion;
@override final  String? screenResolution;
// Web
@override final  String? browserName;
@override final  String? userAgent;
@override final  String? language;
// Mobile
@override final  String? brand;
@override final  String? model;
@override final  String? appVersion;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceModelCopyWith<_DeviceModel> get copyWith => __$DeviceModelCopyWithImpl<_DeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceModel&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.screenResolution, screenResolution) || other.screenResolution == screenResolution)&&(identical(other.browserName, browserName) || other.browserName == browserName)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.language, language) || other.language == language)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,deviceName,osVersion,screenResolution,browserName,userAgent,language,brand,model,appVersion);

@override
String toString() {
  return 'DeviceModel(platform: $platform, deviceName: $deviceName, osVersion: $osVersion, screenResolution: $screenResolution, browserName: $browserName, userAgent: $userAgent, language: $language, brand: $brand, model: $model, appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class _$DeviceModelCopyWith<$Res> implements $DeviceModelCopyWith<$Res> {
  factory _$DeviceModelCopyWith(_DeviceModel value, $Res Function(_DeviceModel) _then) = __$DeviceModelCopyWithImpl;
@override @useResult
$Res call({
 String? platform, String? deviceName, String? osVersion, String? screenResolution, String? browserName, String? userAgent, String? language, String? brand, String? model, String? appVersion
});




}
/// @nodoc
class __$DeviceModelCopyWithImpl<$Res>
    implements _$DeviceModelCopyWith<$Res> {
  __$DeviceModelCopyWithImpl(this._self, this._then);

  final _DeviceModel _self;
  final $Res Function(_DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = freezed,Object? deviceName = freezed,Object? osVersion = freezed,Object? screenResolution = freezed,Object? browserName = freezed,Object? userAgent = freezed,Object? language = freezed,Object? brand = freezed,Object? model = freezed,Object? appVersion = freezed,}) {
  return _then(_DeviceModel(
platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,screenResolution: freezed == screenResolution ? _self.screenResolution : screenResolution // ignore: cast_nullable_to_non_nullable
as String?,browserName: freezed == browserName ? _self.browserName : browserName // ignore: cast_nullable_to_non_nullable
as String?,userAgent: freezed == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
