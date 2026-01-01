import 'package:connectrpc/connect.dart';

/// Base error type using Dart 3 sealed classes.
///
/// Maps ConnectRPC error codes to semantic error types.
sealed class AppError implements Exception {
  /// Human-readable error message
  String get message;

  /// Private constructor for subclasses
  const AppError._();

  /// Create an AppError from any exception
  factory AppError.from(Object error, [StackTrace? stackTrace]) {
    if (error is AppError) return error;

    // Map ConnectRPC errors
    if (error is ConnectException) {
      return switch (error.code) {
        Code.notFound => NotFoundError(error.message ?? 'Not found'),
        Code.permissionDenied =>
          PermissionError(error.message ?? 'Permission denied'),
        Code.unauthenticated =>
          AuthError(error.message ?? 'Authentication required'),
        Code.invalidArgument =>
          ValidationError(error.message ?? 'Invalid input'),
        Code.alreadyExists =>
          ConflictError(error.message ?? 'Already exists'),
        Code.resourceExhausted =>
          RateLimitError(error.message ?? 'Rate limit exceeded'),
        Code.unavailable ||
        Code.deadlineExceeded =>
          NetworkError(error.message ?? 'Service unavailable'),
        _ => NetworkError(error.message ?? 'Network error'),
      };
    }

    // Generic exception handling
    if (error is Exception) {
      return UnknownError(error.toString());
    }

    return UnknownError(error.toString());
  }
}

/// Network/connectivity error
final class NetworkError extends AppError {
  @override
  final String message;

  NetworkError(this.message) : super._();

  @override
  String toString() => 'NetworkError: $message';
}

/// Authentication error (user not logged in)
final class AuthError extends AppError {
  @override
  final String message;

  AuthError(this.message) : super._();

  @override
  String toString() => 'AuthError: $message';
}

/// Resource not found
final class NotFoundError extends AppError {
  @override
  final String message;

  NotFoundError(this.message) : super._();

  @override
  String toString() => 'NotFoundError: $message';
}

/// Input validation error
final class ValidationError extends AppError {
  @override
  final String message;

  /// Optional field-level errors
  final Map<String, String> fieldErrors;

  ValidationError(this.message, {this.fieldErrors = const {}}) : super._();

  @override
  String toString() => 'ValidationError: $message';
}

/// Permission denied
final class PermissionError extends AppError {
  @override
  final String message;

  PermissionError(this.message) : super._();

  @override
  String toString() => 'PermissionError: $message';
}

/// Resource already exists (conflict)
final class ConflictError extends AppError {
  @override
  final String message;

  ConflictError(this.message) : super._();

  @override
  String toString() => 'ConflictError: $message';
}

/// Rate limit exceeded
final class RateLimitError extends AppError {
  @override
  final String message;

  /// When the rate limit resets
  final DateTime? retryAfter;

  RateLimitError(this.message, {this.retryAfter}) : super._();

  @override
  String toString() => 'RateLimitError: $message';
}

/// Unknown/unhandled error
final class UnknownError extends AppError {
  @override
  final String message;

  UnknownError(this.message) : super._();

  @override
  String toString() => 'UnknownError: $message';
}
