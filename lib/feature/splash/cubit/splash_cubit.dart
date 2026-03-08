import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teska_boilerplate/feature/splash/cubit/splash_state.dart';
import 'package:teska_boilerplate/product/init/guard/app_initialization_guard.dart';

final class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));
    // initialize app, load resources, etc.
    AppInitializationGuard.instance.setInitialized();
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }
}
