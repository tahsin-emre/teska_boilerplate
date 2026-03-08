import 'package:flutter/material.dart';

extension TeskaColorExt on Color {
  _TeskaColorExt get teska => _TeskaColorExt(this);
}

final class _TeskaColorExt {
  const _TeskaColorExt(this.value);
  final Color value;

  /// Returns a new [Color] with the specified opacity.
  /// [opacity] should be a value between
  ///  0.0 (fully transparent) and 1.0 (fully opaque).
  Color opacity(double opacity) {
    return value.withValues(alpha: opacity);
  }
}
