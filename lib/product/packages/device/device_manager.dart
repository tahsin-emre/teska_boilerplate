import 'package:device_info_plus/device_info_plus.dart';
import 'package:teska_boilerplate/product/init/platform/app_platform.dart';
import 'package:teska_boilerplate/product/init/session/model/device_model.dart';

final class DeviceManager {
  DeviceManager._init();
  static final DeviceManager _instance = DeviceManager._init();
  static DeviceManager get instance => _instance;
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<DeviceModel> collectDeviceInfo() async {
    return switch (AppPlatform.current) {
      AppPlatform.web => _collectWebInfo(await _deviceInfo.webBrowserInfo),
      AppPlatform.ios => _collectIosInfo(await _deviceInfo.iosInfo),
      AppPlatform.android => _collectAndroidInfo(await _deviceInfo.androidInfo),
      _ => DeviceModel(platform: AppPlatform.current.displayName),
    };
  }

  DeviceModel _collectWebInfo(WebBrowserInfo info) {
    return DeviceModel(
      platform: AppPlatform.web.displayName,
      browserName: info.browserName.name,
      userAgent: info.userAgent,
      language: info.language,
    );
  }

  DeviceModel _collectIosInfo(IosDeviceInfo info) {
    return DeviceModel(
      platform: AppPlatform.ios.displayName,
      deviceName: info.name,
      osVersion: '${info.systemName} ${info.systemVersion}',
      model: info.model,
      brand: 'Apple',
    );
  }

  DeviceModel _collectAndroidInfo(AndroidDeviceInfo info) {
    return DeviceModel(
      platform: AppPlatform.android.displayName,
      deviceName: info.name,
      osVersion: 'Android ${info.version.release}',
      model: info.model,
      brand: info.brand,
    );
  }
}
