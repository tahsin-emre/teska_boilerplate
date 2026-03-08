import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

final class ToastificationManager {
  const ToastificationManager._();

  static const _animationDuration = Duration(milliseconds: 500);

  static const _config = ToastificationConfig(
    animationDuration: _animationDuration,
  );

  static ToastificationWrapper app({required Widget child}) {
    return ToastificationWrapper(
      config: _config,
      child: child,
    );
  }

  static void showSuccess({required String title, required String content}) {
    toastification.show(
      title: Text(title),
      description: Text(content),
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 2),
    );
  }

  static void showError({required String title, required String content}) {
    toastification.show(
      title: Text(title),
      description: Text(content),
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 2),
    );
  }
}
