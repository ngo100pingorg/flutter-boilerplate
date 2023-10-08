import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_api/theme_api.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required ThemeApi themeAPI,
  }) : super(const ThemeState()) {
    on<InitThemeEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            status: () => ThemeStatus.loading,
          ),
        );
        themeAPI.initTheme();
        bool isLightTheme = themeAPI.isLightThemeMode;
        emit(
          state.copyWith(
            status: () => ThemeStatus.changed,
            isLightThemeMode: () => isLightTheme,
          ),
        );
      },
    );

    on<ToggleThemeEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: () => ThemeStatus.loading,
          ),
        );
        await themeAPI.toogleTheme();
        bool isLightTheme = themeAPI.isLightThemeMode;
        emit(
          state.copyWith(
            status: () => ThemeStatus.changed,
            isLightThemeMode: () => isLightTheme,
          ),
        );
      },
    );
  }
}
