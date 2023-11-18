import 'package:flutter/material.dart';
import 'package:flutter_app_empty_template/core/provider_store/provider_store.dart';
import 'package:flutter_app_empty_template/core/router/app_router.dart';
import 'package:flutter_app_empty_template/core/theme_service/theme_service.dart';
import 'package:flutter_app_empty_template/features/language/language.dart';
import 'package:flutter_app_empty_template/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeService>(
      create: (_) => ThemeService(),
      child: BlocProviderStore.init(
        child: Consumer<ThemeService>(
          builder: (_, themeService, __) {
            return BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                final selectedLocale = Locale(state.selectedLanguage);
                return MaterialApp.router(
                  title: 'App Name',
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    ...AppLocalizations.localizationsDelegates,
                    LocaleNamesLocalizationsDelegate(),
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  theme: themeService.themeData,
                  darkTheme: themeService.themeData,
                  themeMode: themeService.themeMode,
                  locale: selectedLocale,
                  routerConfig: router,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
