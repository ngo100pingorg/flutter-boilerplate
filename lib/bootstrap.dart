import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_api/locale_api.dart';
import 'package:log_api/log_api.dart';
import 'package:theme_api/theme_api.dart';

import 'bloc/bloc/locale_bloc/locale_bloc.dart';
import 'bloc/bloc/theme_bloc/theme_bloc.dart';
import 'presentation/app/app.dart';
import 'presentation/app/app_bloc_observer.dart';

Future<void> bootstrap() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = AppBlocObserver();

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final ThemeApi themeApi = ThemeApi(
        plugin: sharedPreferences,
      );

      final LocaleApi localeApi = LocaleApi(
        plugin: sharedPreferences,
      );

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeBloc(themeAPI: themeApi)
                ..add(
                  const InitThemeEvent(),
                ),
            ),
            BlocProvider(
              create: (context) => LocaleBloc(localeApi: localeApi)
                ..add(
                  const InitLocaleEvent(),
                ),
            )
          ],
          child: const App(),
        ),
      );
    },
    (error, stack) => Log.danger(error.toString(), data: stack),
  );
}
