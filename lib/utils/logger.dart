import 'dart:developer';

/// Levels of log messages
enum LogLevel {
  info,
  debug,
  error,
  warning,
}

/// Extension on [LogLevel] to provide a color for each level
/// when logging to the console.
/// See [l] for more information.
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

/// Resets the color of the console.
/// See [l] for more information.
String get _resetCode => '\x1B[0m';

/// Logger wrapper for the [log] function.
/// Logs the given [message] to the console.
/// Optionally, a [level] can be provided to color the message.
/// Optionally, a [name] can be provided to identify the log message.
/// Optionally, an [error] can be provided to log an error message.
/// Optionally, a [stackTrace] can be provided to log a stacktrace.
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

/// Logger separator "-" for the [l] function.
void logUpperLine({LogLevel level = LogLevel.info}) =>
    l('———————————————————————————————————————————', level: level);

/// Logger separator "_" for the [l] function.
void logBottomLine({LogLevel level = LogLevel.info}) =>
    l('___________________________________________', level: level);
