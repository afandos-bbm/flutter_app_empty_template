import 'package:flutter_app_empty_template/bootstrap.dart';
import 'package:flutter_app_empty_template/core/configuration_service/configuration_service.dart';
import 'package:flutter_app_empty_template/features/app/app.dart';

void main() {
  ConfigurationService.initialize(Flavor.staging);
  bootstrap(() => const App());
}
