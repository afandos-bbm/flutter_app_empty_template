import 'package:flutter/widgets.dart';

enum Flavor {
  development,
  staging,
  production,
}

class Configuration {
  Configuration({
    required this.appUrl,
    required this.backUrl,
  });

  final String appUrl;
  final String backUrl;
}

class ConfigurationService {
  ConfigurationService({
    required this.flavor,
  }) {
    // TODO: Add the correct urls for each flavor
    switch (flavor) {
      case Flavor.development:
        _config = Configuration(
          backUrl: 'https://backend.dev.example.com',
          appUrl: 'http://localhost:3000',
        );
      case Flavor.staging:
        _config = Configuration(
          backUrl: 'https://backend.qa.example.com',
          appUrl: 'https://frontend.qa.example.com',
        );
      case Flavor.production:
        _config = Configuration(
          backUrl: 'https://backend.qa.example.com',
          appUrl: 'https://frontend.qa.example.com',
        );
    }
  }

  final Flavor flavor;
  late Configuration _config;

  static ConfigurationService? _instance;

  static void initialize(Flavor flavor) {
    _instance = ConfigurationService(flavor: flavor);
  }

  static ConfigurationService get i {
    assert(_instance != null, 'ConfigurationService has not been initialized.');
    return _instance!;
  }

  Configuration get config => _config;

  String get appUrl => _config.appUrl;
  String get hadeaBackUrl => _config.backUrl;
  Flavor get currentFlavor => flavor;

  static ConfigurationService of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            InheritedConfigurationServiceWidget>()!
        .configService;
  }
}

class InheritedConfigurationServiceWidget extends InheritedWidget {
  const InheritedConfigurationServiceWidget({
    required this.configService,
    required super.child,
    super.key,
  });

  final ConfigurationService configService;

  @override
  bool updateShouldNotify(InheritedConfigurationServiceWidget oldWidget) {
    return configService != oldWidget.configService;
  }
}
