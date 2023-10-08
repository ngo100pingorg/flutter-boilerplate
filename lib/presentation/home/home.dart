import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/locale_bloc/locale_bloc.dart';
import '../../bloc/bloc/theme_bloc/theme_bloc.dart';
import '../../l10n/l10n.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) => Center(
              child: Switch(
                value: !state.isLightThemeMode,
                onChanged: (_) {
                  context.read<ThemeBloc>().add(
                        const ToggleThemeEvent(),
                      );
                },
              ),
            ),
          ),
          // Dropdown to change language
          const Center(child: LanguageSelector()),
        ],
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector>
    with TranslationMixin {
  @override
  Widget build(BuildContext context) {
    // use minimum width
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) => DropdownButton(
        value: state.locale,
        items: L10n.all
            .map(
              (locale) => DropdownMenuItem(
                value: locale,
                child: Text(
                  L10n.getLanguageTranslation(context, locale.languageCode),
                ),
              ),
            )
            .toList(),
        onChanged: (locale) {
          if (locale != null) {
            context.read<LocaleBloc>().add(ChangeLocaleEvent(locale: locale));
          }
        },
        isExpanded: false,
        underline: const SizedBox(),
      ),
    );
  }
}
