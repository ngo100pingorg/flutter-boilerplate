part of 'locale_bloc.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class InitLocaleEvent extends LocaleEvent {
  const InitLocaleEvent();
}

class ChangeLocaleEvent extends LocaleEvent {
  const ChangeLocaleEvent({required this.locale});

  final Locale locale;
}
