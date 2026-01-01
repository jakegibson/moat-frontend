import 'app_error.dart';

/// Represents an asynchronous operation state.
///
/// Usage:
/// ```dart
/// final state = signal<AsyncState<User>>(const Loading());
///
/// // Fetch data
/// state.value = const Loading();
/// try {
///   final user = await fetchUser();
///   state.value = Data(user);
/// } catch (e) {
///   state.value = Error(AppError.from(e));
/// }
///
/// // In widget
/// Watch((context) {
///   return switch (state.value) {
///     Loading() => CircularProgressIndicator(),
///     Data(value: final user) => Text(user.name),
///     Error(error: final e) => ErrorView(error: e),
///   };
/// });
/// ```
sealed class AsyncState<T> {
  const AsyncState();

  /// Pattern match on async state
  R when<R>({
    required R Function() loading,
    required R Function(T value) data,
    required R Function(AppError error) error,
  }) =>
      switch (this) {
        Loading() => loading(),
        Data(value: final v) => data(v),
        Error(error: final e) => error(e),
      };

  /// Get data if available, otherwise null
  T? get dataOrNull => switch (this) {
        Data(value: final v) => v,
        _ => null,
      };

  /// Whether the state is loading
  bool get isLoading => this is Loading;

  /// Whether the state has data
  bool get hasData => this is Data;

  /// Whether the state has an error
  bool get hasError => this is Error;
}

/// Loading state
final class Loading<T> extends AsyncState<T> {
  const Loading();

  @override
  String toString() => 'Loading()';
}

/// Data state
final class Data<T> extends AsyncState<T> {
  final T value;

  const Data(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Data<T> && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Data($value)';
}

/// Error state
final class Error<T> extends AsyncState<T> {
  final AppError error;

  const Error(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Error<T> && other.error == error);

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'Error($error)';
}
