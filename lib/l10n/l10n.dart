import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static const all = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
  ];

  static String getLanguageTranslation(BuildContext context, String key) {
    return {
          'en': AppLocalizations.of(context)?.enLanguageName ?? 'English',
          'hi': AppLocalizations.of(context)?.hiLanguageName ?? 'Hindi',
        }[key] ??
        'No key found!';
  }
}

typedef TranslationProvider = String Function(AppLocalizations translations);

extension TranslationExtension on BuildContext {
  AppLocalizations get translations => AppLocalizations.of(this)!;
}

// TranslationMixin is a mixin that provides a translation function to a class.
// It is used by the generated code to provide a translation function to the App class.

mixin TranslationMixin<T extends StatefulWidget> on State<T> {
  AppLocalizations get translations => context.translations;
}
