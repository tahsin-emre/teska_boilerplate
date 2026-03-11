import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teska_boilerplate/product/init/session/model/device_model.dart';
import 'package:teska_boilerplate/product/init/session/model/user_model.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState({
    @Default(false) bool isAuthenticated,
    @Default(false) bool isLoading,
    UserModel? user,
    DeviceModel? device,
    String? token,
  }) = _SessionState;
}
