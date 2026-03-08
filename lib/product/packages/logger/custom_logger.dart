import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

typedef LOG = CustomLogger;

final class CustomLogger {
  const CustomLogger._();

  static const bool _isEnable = kDebugMode;
  static final Logger _logger = Logger();

  /// Log an error message
  static void error(String message) {
    if (!_isEnable) return;
    _logger.e(message);
  }

  /// Log an info message
  static void info(String message) {
    if (!_isEnable) return;
    _logger.i(message);
  }

  /// Log a warning message
  static void warning(String message) {
    if (!_isEnable) return;
    _logger.w(message);
  }
}
