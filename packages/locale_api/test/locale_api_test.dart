import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:locale_api/locale_api.dart';

void main() {
  late LocaleApi localeApi;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    localeApi = LocaleApi(plugin: sharedPreferences);
  });

  test(
    'test locale api default value',
    () async {
      expect(localeApi.locale, equals(const Locale('en')));
    },
  );

  test(
    'test init Function when no value found locally (in stored prefs)',
    () async {
      localeApi.initLocale();
      expect(localeApi.locale, equals(const Locale('en', 'US')));
    },
  );

  test(
    'test init Function when  value of locale found locally (in stored prefs)',
    () async {
      localeApi.initLocale();
      localeApi.initLocale();
      expect(localeApi.locale, equals(const Locale('en', 'US')));
    },
  );

  test(
    'test change locale',
    () async {
      Locale result = const Locale('hi', 'IN');
      localeApi.changeLocale(result);
      expect(localeApi.locale, equals(result));
    },
  );
}
