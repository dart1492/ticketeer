import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ticketeer/app.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/locator.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setupLocator();

  runApp(
    EasyLocalization(
      startLocale: startLocale,
      supportedLocales: const [
        englishLocale,
        ukrainianLocale,
      ],
      path: translationFolderPath,
      assetLoader: JsonAssetLoader(),
      fallbackLocale: englishLocale,
      child: const App(),
    ),
  );
}
