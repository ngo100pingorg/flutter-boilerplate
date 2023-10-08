import '_internal/config/app_config.dart';
import '_internal/config/config.dart';
import 'bootstrap.dart';

Future<void> main() async {
  AppConfig(stagingConfig);
  await bootstrap();
}
