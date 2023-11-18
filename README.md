# Flutter Project Template 🌹

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

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
