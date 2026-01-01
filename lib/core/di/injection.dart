import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Global service locator instance
final getIt = GetIt.instance;

/// Initialize dependency injection for the given environment.
///
/// Call this in main() before runApp():
/// ```dart
/// configureDependencies(AppConfig.environment);
/// ```
@InjectableInit(preferRelativeImports: true)
void configureDependencies(String environment) =>
    getIt.init(environment: environment);

/// Environment constants for injectable
abstract class Env {
  static const dev = 'dev';
  static const staging = 'staging';
  static const prod = 'prod';
}
