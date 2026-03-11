import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teska_boilerplate/product/init/di/base_container.dart';
import 'package:teska_boilerplate/product/init/session/model/device_model.dart';
import 'package:teska_boilerplate/product/init/session/model/user_model.dart';
import 'package:teska_boilerplate/product/init/session/session_state.dart';
import 'package:teska_boilerplate/product/packages/logger/custom_logger.dart';
import 'package:web/web.dart' as web;

final class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(const SessionState());

  /// Restores session from secure storage (call on app start).
  Future<void> restoreSession() async {
    emit(state.copyWith(isLoading: true));

    try {
      final token = await BC.tokenStorageManager.getToken();
      final userJson = await BC.sharedManager.getString('session_user');
      final device = _collectDeviceInfo();

      UserModel? user;
      if (userJson != null) {
        user = UserModel.fromJson(
          jsonDecode(userJson) as Map<String, dynamic>,
        );
      }

      emit(
        state.copyWith(
          isAuthenticated: token != null,
          token: token,
          user: user,
          device: device,
          isLoading: false,
        ),
      );
    } on Exception catch (e) {
      LOG.error(e.toString());
      emit(state.copyWith(isLoading: false));
    }
  }

  /// Starts a new session after successful login.
  Future<void> login({
    required String token,
    required UserModel user,
  }) async {
    await BC.tokenStorageManager.saveToken(token);
    await BC.sharedManager.setString(
      'session_user',
      jsonEncode(user.toJson()),
    );

    emit(
      state.copyWith(
        isAuthenticated: true,
        token: token,
        user: user,
      ),
    );
  }

  /// Updates the current user data.
  Future<void> updateUser(UserModel user) async {
    await BC.sharedManager.setString(
      'session_user',
      jsonEncode(user.toJson()),
    );
    emit(state.copyWith(user: user));
  }

  /// Clears session and logs out.
  Future<void> logout() async {
    await BC.tokenStorageManager.clearToken();
    await BC.sharedManager.remove('session_user');

    emit(
      const SessionState(),
    );
  }

  /// Collects device/browser information.
  DeviceModel _collectDeviceInfo() {
    if (kIsWeb) {
      final navigator = web.window.navigator;
      return DeviceModel(
        platform: navigator.platform,
        browserName: _parseBrowserName(navigator.userAgent),
        userAgent: navigator.userAgent,
        language: navigator.language,
        screenResolution:
            '${web.window.screen.width}x${web.window.screen.height}',
      );
    }
    return const DeviceModel(platform: 'unknown');
  }

  String _parseBrowserName(String userAgent) {
    final ua = userAgent.toLowerCase();
    if (ua.contains('edg')) return 'Edge';
    if (ua.contains('chrome')) return 'Chrome';
    if (ua.contains('firefox')) return 'Firefox';
    if (ua.contains('safari')) return 'Safari';
    if (ua.contains('opera') || ua.contains('opr')) return 'Opera';
    return 'Unknown';
  }
}
