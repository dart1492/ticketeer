// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Abstract localization datasource class
abstract class LocalizationDatasource {
  /// Sets new locale
  Future<void> setNewLocale(Locale newLocale);

  /// get currently stored locale
  Future<Locale?> getCurrentLocale();
}

class LocalizationDatasourceImpl extends LocalizationDatasource {
  /// Shared preferences instance
  final SharedPreferences sp;

  /// Implementation of the [LocalizationDatasource]
  LocalizationDatasourceImpl(this.sp);

  @override
  Future<Locale?> getCurrentLocale() async {
    final String? langCode = sp.getString("language_code");
    final String? countryCode = sp.getString("country_code");

    if (langCode == null || countryCode == null) {
      return null;
    } else {
      return Locale(langCode, countryCode);
    }
  }

  @override
  Future<void> setNewLocale(Locale newLocale) async {
    await sp.setString("language_code", newLocale.languageCode);
    await sp.setString("country_code", newLocale.countryCode ?? "");
  }
}
