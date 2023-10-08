import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_api/log_api.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    Log.info(
      'onChange(${bloc.runtimeType}, $change)',
      enableLocalLogArg: false,
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Log.danger(
      'onError(${bloc.runtimeType}, $error, $stackTrace)',
    );
  }
}
