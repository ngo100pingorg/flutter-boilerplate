import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeApi {
  ThemeApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin;

  final SharedPreferences _plugin;

  bool? _isLightThemeMode;
  bool get isLightThemeMode => _isLightThemeMode ?? true;

  /// The key used for storing the theme bool locally.
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kThemeCollectionKey = '__theme_collection_key__';

  bool? _getValue(String key) => _plugin.getBool(key);

  Future<void> _setValue(String key, bool value) => _plugin.setBool(key, value);

  void initTheme() {
    bool? lightThemeModeStorageValue = _getValue(kThemeCollectionKey);
    if (lightThemeModeStorageValue != null) {
      _isLightThemeMode = lightThemeModeStorageValue;
      return;
    }
    bool isDeviceInLightThemeMode =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.light;
    _isLightThemeMode = isDeviceInLightThemeMode;
    _setValue(kThemeCollectionKey, isDeviceInLightThemeMode);
  }

  Future<void> toogleTheme() async {
    if (_isLightThemeMode != null) {
      _isLightThemeMode = !_isLightThemeMode!;
      await _setValue(kThemeCollectionKey, _isLightThemeMode!);
    } else {
      initTheme();
    }
  }
}
