import 'app_error.dart';

/// A Result type for explicit error handling using Dart 3 sealed classes.
///
/// Usage:
/// ```dart
/// final result = await fetchData().toResult();
/// result.when(
///   ok: (data) => print('Got: $data'),
///   error: (e) => print('Error: ${e.message}'),
/// );
/// ```
sealed class Result<T> {
  const Result();

  /// Pattern match on result
  R when<R>({
    required R Function(T value) ok,
    required R Function(AppError error) error,
  });

  /// Map the success value
  Result<U> map<U>(U Function(T value) transform) => switch (this) {
        Ok(value: final v) => Ok(transform(v)),
        Err(error: final e) => Err(e),
      };

  /// FlatMap the success value
  Result<U> flatMap<U>(Result<U> Function(T value) transform) =>
      switch (this) {
        Ok(value: final v) => transform(v),
        Err(error: final e) => Err(e),
      };

  /// Get value or null
  T? get valueOrNull => switch (this) {
        Ok(value: final v) => v,
        Err() => null,
      };

  /// Get error or null
  AppError? get errorOrNull => switch (this) {
        Ok() => null,
        Err(error: final e) => e,
      };

  /// Whether this is a success
  bool get isOk => this is Ok<T>;

  /// Whether this is an error
  bool get isError => this is Err<T>;
}

/// Success result
final class Ok<T> extends Result<T> {
  final T value;

  const Ok(this.value);

  @override
  R when<R>({
    required R Function(T value) ok,
    required R Function(AppError error) error,
  }) =>
      ok(value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Ok<T> && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Ok($value)';
}

/// Error result
final class Err<T> extends Result<T> {
  final AppError error;

  const Err(this.error);

  @override
  R when<R>({
    required R Function(T value) ok,
    required R Function(AppError error) error,
  }) =>
      error(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Err<T> && other.error == error);

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'Err($error)';
}

/// Extension to convert Future<T> to Future<Result<T>>
extension ResultFuture<T> on Future<T> {
  /// Convert a Future to a Result, catching exceptions as AppError
  Future<Result<T>> toResult() async {
    try {
      return Ok(await this);
    } catch (e, st) {
      return Err(AppError.from(e, st));
    }
  }
}

/// Extension to convert Result<T> to a nullable value
extension ResultToNullable<T> on Result<T> {
  /// Get the value or throw the error
  T getOrThrow() => switch (this) {
        Ok(value: final v) => v,
        Err(error: final e) => throw e,
      };

  /// Get the value or a default
  T getOrElse(T defaultValue) => switch (this) {
        Ok(value: final v) => v,
        Err() => defaultValue,
      };

  /// Get the value or compute a default
  T getOrElseCompute(T Function(AppError error) compute) => switch (this) {
        Ok(value: final v) => v,
        Err(error: final e) => compute(e),
      };
}
