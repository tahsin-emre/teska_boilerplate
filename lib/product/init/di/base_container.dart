import 'package:get_it/get_it.dart';
import 'package:teska_boilerplate/feature/splash/cubit/splash_cubit.dart';
import 'package:teska_boilerplate/product/init/network/network_manager.dart';
import 'package:teska_boilerplate/product/init/session/session_cubit.dart';
import 'package:teska_boilerplate/product/packages/device/device_manager.dart';
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
      // Device Manager
      ..registerLazySingleton(() => DeviceManager.instance)
      //
      // Shared Manager
      ..registerLazySingleton(() => SharedManager.instance)
      //
      // Token Storage Manager
      ..registerLazySingleton(() => TokenStorageManager.instance)
      //
      // Network Manager
      ..registerLazySingleton(() => NetworkManager.instance)
      //
      // Service Repositories
      //
      // Cubits
      ..registerLazySingleton(SessionCubit.new)
      ..registerLazySingleton(SplashCubit.new);
  }

  static DeviceManager get deviceManager => _di<DeviceManager>();
  static SharedManager get sharedManager => _di<SharedManager>();
  static NetworkManager get networkManager => _di<NetworkManager>();
  static TokenStorageManager get tokenStorageManager =>
      _di<TokenStorageManager>();

  static SessionCubit get sessionCubit => _di<SessionCubit>();
  static SplashCubit get splashCubit => _di<SplashCubit>();
}
