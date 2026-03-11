import 'package:get_it/get_it.dart';
import 'package:teska_boilerplate/feature/splash/cubit/splash_cubit.dart';
import 'package:teska_boilerplate/product/init/network/network_manager.dart';
import 'package:teska_boilerplate/product/init/session/session_cubit.dart';
import 'package:teska_boilerplate/product/packages/storage/shared_manager.dart';
import 'package:teska_boilerplate/product/packages/storage/token_storage_manager.dart';

typedef BC = BaseContainer;

final class BaseContainer {
  factory BaseContainer() => _instance;
  BaseContainer._();
  static final BaseContainer _instance = BaseContainer._();
  static final GetIt _di = GetIt.instance;

  static void setupLocator() {
    _di
      //
      // Shared Manager
      ..registerLazySingleton<SharedManager>(SharedManager.new)
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
      ..registerLazySingleton<SessionCubit>(SessionCubit.new)
      ..registerLazySingleton<SplashCubit>(SplashCubit.new);
  }

  static SessionCubit get sessionCubit => _di<SessionCubit>();
  static SharedManager get sharedManager => _di<SharedManager>();
  static NetworkManager get networkManager => _di<NetworkManager>();
  static SplashCubit get splashCubit => _di<SplashCubit>();
  static TokenStorageManager get tokenStorageManager =>
      _di<TokenStorageManager>();
}
