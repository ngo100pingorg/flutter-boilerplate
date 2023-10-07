import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleApi {
  LocaleApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin;

  final SharedPreferences _plugin;

  Locale _locale = const Locale('en');
  Locale get locale => _locale;
  set locale(Locale locale) {
    _setValue(kLanguageCodeCollectionKey, locale.languageCode);
    _setValue(kCountryCodeCollectionKey, locale.countryCode ?? '');
    _locale = locale;
  }

  // The keys used for storing the locale locally.
  // This is only exposed for testing and shouldn't be used by consumers of this library.
  @visibleForTesting
  static const kLanguageCodeCollectionKey = '_language_code_collection_key';
  static const kCountryCodeCollectionKey = '_country_code_collection_key';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void initLocale() {
    String? languageCode = _getValue(kLanguageCodeCollectionKey);
    String? countryCode = _getValue(kCountryCodeCollectionKey);
    if (languageCode != null) {
      locale = Locale(languageCode, countryCode);
      return;
    }
    locale = WidgetsBinding.instance.platformDispatcher.locales.first;
    return;
  }

  Future<void> changeLocale(Locale locale) async {
    this.locale = locale;
  }
}
