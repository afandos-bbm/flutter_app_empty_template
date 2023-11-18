import 'package:flutter/material.dart';
import 'package:flutter_app_empty_template/features/language/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Class whose purpose is to centralize, init and inject common providers.
class BlocProviderStore {
  static Widget init({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LanguageCubit()..loadLanguagePreference(),
        ),
        // TODO: Add your providers here
      ],
      child: child,
    );
  }
}
