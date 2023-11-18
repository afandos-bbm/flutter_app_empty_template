# 🌹 Flutter Project Template

## VERSION Template - v0.0.1 - 18-11-2023

![GitHub license](https://img.shields.io/github/license/afandos-bbm/flutter_app_empty_template?style=flat-square)

This is a Flutter project template that comes fully configured with some of the most commonly used packages and features. It's designed to help you get started with your Flutter project quickly and easily.

## 🚀 Features

- [Router](https://pub.dev/packages/go_router) for navigation. It's used to manage the routes and navigation.
- [Service Locator](https://pub.dev/packages/get_it) for dependency injection. It's used to manage the services and repositories.
- [Provider Store](https://pub.dev/packages/provider) a MultiBlocProvider that wraps the entire app for state management of the UI.
- [Shared Preferences Service](https://pub.dev/packages/shared_preferences) for local storage. It's used to manage the local storage.
- [Configuration Service]() A internal service for managing the build configuration. It's used to manage the environment variables.
- [Theme Service]() for managing the app theme.
- [Internationalization (i10n)](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) support.
- [Logger]() Custom logger for debugging (Also observes the blocs).
- [Device Info]() Class for getting the device info per platform.
- [Flavors]() configuration for environments: development, staging and production. (IOS, Android and Web)
- [Husky](https://pub.dev/packages/husky) for pre-commit and pre-push hooks. (Lint, Format, Tests)
- [App Bootstrap]() function for initializing the app that applies to all flavors.
- [Build Runner]() using json_serializable and freezed for generating the models and services.
- [Flutter Lint](https://pub.dev/packages/flutter_lints) for code analysis.

## 📦 Packages

### Dependencies

- flutter
- flutter_web_plugins
- flutter_localizations
- cupertino_icons
- json_annotation
- freezed_annotation
- get_it
- bloc
- bloc_concurrency
- flutter_bloc
- flutter_svg
- equatable
- shared_preferences
- provider
- flutter_localized_locales
- go_router
- intl
- device_info_plus
- package_info_plus

### Dev Dependencies

- flutter_test
- bloc_test
- flutter_lints
- husky
- build_runner
- freezed
- json_serializable
- mocktail

## 📝 Getting Started

1. Clone this repository:

   ```bash
   git clone
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Active the husky hooks: (Needs to be done only once after cloning)

   ```bash
   dart run husky install
   ```

4. Execute the build runner to generate the models and services:

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## 🏃‍♂️ Running the app

You can run the app in two ways:

### 1. VSCode

> The build runner is executed automatically when you make a hot restart by a preLaunchTask in the launch.json file. (Only for development)

The three launch configurations are:

- Development
- Staging
- Production

You can change the configuration in the launch.json file.

### 2. Console

> For the auto generate files, you must run the build runner manually
> You should run this anytime you make a change in the models or services.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

#### Development

```bash
flutter run --flavor development --target lib/main_development.dart
```

#### Staging

```bash
flutter run --flavor staging --target lib/main_staging.dart
```

#### Production

```bash
flutter run --flavor production --target lib/main_production.dart --release
```

## 🧪 Running Tests

To run the unit tests use the following command:

```bash
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```bash
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

## 🌐 Working with Translations

This project relies on [flutter_localizations]() and follows the [official internationalization guide for Flutter]().

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "appName": "Template App",
    "@appName": {
        "description": "App Name"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "appName": "Template App",
    "@appName": {
        "description": "App Name"
    }
    "helloWorld": "Hello World",
    "@helloWorld": {
       "description": "Hello World"
    }
}
```

3. Use the new string

```dart
import 'package:flutter_app_empty_template/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale. (IOS)

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "appName": "Template App",
    "@appName": {
        "description": "App Name"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "appName": "Plantilla de App",
    "@appName": {
       "description": "Nombre de la App"
    }
}
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
