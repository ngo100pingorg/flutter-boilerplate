import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../_internal/config/app_config.dart';
import '../../_internal/theme/theme.dart';
import '../../bloc/bloc/locale_bloc/locale_bloc.dart';
import '../../bloc/bloc/theme_bloc/theme_bloc.dart';
import '../../l10n/l10n.dart';
import '../initializer/initializer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, localeState) => BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) => MaterialApp(
          title: AppConfig.config.appTitle,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          locale: L10n.all.contains(localeState.locale)
              ? localeState.locale
              : L10n.all.first,
          theme: themeState.isLightThemeMode ? AppTheme.light : AppTheme.dark,
          home: const Initializer(),
        ),
      ),
    );
  }
}
