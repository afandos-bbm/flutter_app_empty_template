import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';

/// Error codes for the application.
enum ErrorCodes {
  generic,
}

/// Base class for all errors in the application.
abstract class AppError implements Error {
  const AppError({
    required this.errorCode,
    this.errorMessage = '',
  });

  final ErrorCodes errorCode;
  final String errorMessage;
}

/// Errors that are thrown by the business logic.
@freezed
class BusinessAppError extends AppError with _$BusinessAppError {
  const BusinessAppError._()
      : super(errorCode: ErrorCodes.generic, errorMessage: '');

  const factory BusinessAppError.generic({
    required ErrorCodes errorCode,
    StackTrace? stackTrace,
    @Default('No description provided') String errorMessage,
  }) = GenericBusinessAppError;

  @override
  StackTrace? get stackTrace => StackTrace.current;
}

/// Errors that are thrown by the application itself.
@freezed
class InternalAppError extends AppError with _$InternalAppError {
  const InternalAppError._()
      : super(errorCode: ErrorCodes.generic, errorMessage: '');

  const factory InternalAppError.generic({
    required ErrorCodes errorCode,
    StackTrace? stackTrace,
    @Default('No description provided') String errorMessage,
  }) = GenericInternalAppError;

  @override
  StackTrace? get stackTrace => StackTrace.current;
}
