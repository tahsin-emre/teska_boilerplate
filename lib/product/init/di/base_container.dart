import 'package:get_it/get_it.dart';
import 'package:teska_boilerplate/feature/splash/cubit/splash_cubit.dart';
import 'package:teska_boilerplate/product/init/network/network_manager.dart';
import 'package:teska_boilerplate/product/packages/storage/token_storage_manager.dart';

typedef BC = BaseContainer;

final class BaseContainer {
  factory BaseContainer() => _instance;
  BaseContainer._();
  static final BaseContainer _instance = BaseContainer._();
  static final GetIt _locator = GetIt.instance;

  static void setupLocator() {
    _locator
      //
      // Token Storage Manager
      ..registerLazySingleton<TokenStorageManager>(TokenStorageManager.new)
      //
      // Network Manager
      ..registerLazySingleton<NetworkManager>(() => NetworkManager.instance)
      //
      // Service Repositories
      //
      // Cubits
      ..registerLazySingleton<SplashCubit>(SplashCubit.new);
  }

  static TokenStorageManager get tokenStorageManager {
    return _locator<TokenStorageManager>();
  }

  static NetworkManager get networkManager {
    return _locator<NetworkManager>();
  }

  static SplashCubit get splashCubit {
    return _locator<SplashCubit>();
  }
}
