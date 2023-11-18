import 'package:flutter/widgets.dart';
import 'package:flutter_app_empty_template/utils/errors/error.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  String Function(ErrorCodes key) get translate => (key) {
        switch (key) {
          case ErrorCodes.generic:
            return l10n.error_generic;
        }
      };
}
