import 'package:flutter_app_empty_template/bootstrap.dart';
import 'package:flutter_app_empty_template/core/configuration_service/configuration_service.dart';
import 'package:flutter_app_empty_template/features/app/app.dart';

void main() {
  /// Initializes the configuration service with the production flavor
  ConfigurationService.initialize(Flavor.production);

  /// Starts the app running the bootstrap function
  bootstrap(() => const App());
}
