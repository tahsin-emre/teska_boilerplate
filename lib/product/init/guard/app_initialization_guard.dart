import 'package:flutter/material.dart';

final class AppInitializationGuard extends ValueNotifier<bool> {
  AppInitializationGuard._() : super(false);

  static final AppInitializationGuard instance = AppInitializationGuard._();

  bool get isInitialized => value;

  void setInitialized() => value = true;
}
