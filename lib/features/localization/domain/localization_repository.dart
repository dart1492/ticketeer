import 'package:flutter/material.dart';
import 'package:ticketeer/core/error/request_handler.dart';

/// This repository describes interactions with local datasource to set and
/// retrieve info about currently selected locale.
///
/// EasyLocalization package already provides the ability to "remember"
/// selected localization -
/// I guess it stores the choice somewhere on the device, but, unfortunately,
/// it doesn't provide any interface to interact with this local storage.
///
/// So I will have to duplicate this functionality to then provide current
/// locale to the request header
abstract class LocalizationRepository {
  /// Sets new locale
  FutureFailable<void> setNewLocale(Locale newLocale);

  /// get currently stored locale
  FutureFailable<Locale?> getCurrentLocale();
}
