import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/app.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupLocator();
  runApp(
    EasyLocalization(
      startLocale: englishLocale,
      supportedLocales: const [
        englishLocale,
        ukrainianLocale,
      ],
      path: 'translations',
      assetLoader: JsonAssetLoader(),
      fallbackLocale: englishLocale,
      child: const App(),
    ),
  );
}
