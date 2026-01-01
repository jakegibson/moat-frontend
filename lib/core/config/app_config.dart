/// Application configuration loaded from dart-define environment variables.
///
/// Usage:
/// ```bash
/// flutter run --dart-define-from-file=dart_defines/dev.env
/// ```
class AppConfig {
  AppConfig._();

  /// API base URL for ConnectRPC transport
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080',
  );

  /// Firebase project ID
  static const String firebaseProject = String.fromEnvironment(
    'FIREBASE_PROJECT',
    defaultValue: 'moat-dev',
  );

  /// Current environment name
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'dev',
  );

  /// Whether we're in development mode
  static bool get isDev => environment == 'dev';

  /// Whether we're in staging mode
  static bool get isStaging => environment == 'staging';

  /// Whether we're in production mode
  static bool get isProd => environment == 'prod';

  /// Whether to enable debug features
  static bool get debugEnabled => !isProd;
}
