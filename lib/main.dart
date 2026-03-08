import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:teska_boilerplate/app.dart';
import 'package:teska_boilerplate/product/init/di/base_container.dart';
import 'package:teska_boilerplate/product/init/localization/localization_manager.dart';
import 'package:teska_boilerplate/product/packages/preview/preview_manager.dart';
import 'package:teska_boilerplate/product/packages/toastification/toastification_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) usePathUrlStrategy();
  await EasyLocalization.ensureInitialized();
  BC.setupLocator();
  runApp(const _AppWrapper());
}

final class _AppWrapper extends StatelessWidget {
  const _AppWrapper();

  @override
  Widget build(BuildContext context) {
    return PreviewManager(
      child: LocalizationManager(
        child: ToastificationManager.app(
          child: const App(),
        ),
      ),
    );
  }
}
