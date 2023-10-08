import 'bootstrap.dart';
import '_internal/config/app_config.dart';
import '_internal/config/config.dart';

Future<void> main() async {
  AppConfig(productionConfig);
  await bootstrap();
}
