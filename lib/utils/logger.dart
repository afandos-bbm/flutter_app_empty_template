import 'dart:developer';

enum LogLevel {
  info,
  debug,
  error,
  warning,
}

extension LogLevelExt on LogLevel {
  String levelColor() {
    switch (this) {
      case LogLevel.info:
        return '\x1B[37m';
      case LogLevel.debug:
        return '\x1B[34m';
      case LogLevel.error:
        return '\x1B[31m';
      case LogLevel.warning:
        return '\x1B[33m';
    }
  }
}

String get _resetCode => '\x1B[0m';

void l(
  String message, {
  LogLevel level = LogLevel.info,
  String? name,
  Object? error,
  StackTrace? stackTrace,
}) {
  log(
    '${level.levelColor()}$message$_resetCode',
    name: name ?? '',
    error: error != null ? '${level.levelColor()}$error$_resetCode' : null,
  );

  if (stackTrace != null) {
    log(
      '${level.levelColor()}$stackTrace$_resetCode',
      name: 'stackTrace',
    );
  }
}

void logUpperLine({LogLevel level = LogLevel.info}) =>
    l('———————————————————————————————————————————', level: level);
void logBottomLine({LogLevel level = LogLevel.info}) =>
    l('___________________________________________', level: level);
