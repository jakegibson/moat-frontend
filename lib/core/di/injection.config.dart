// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectrpc/connect.dart' as _i691;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/assets/data/assets_client.dart' as _i274;
import '../../features/assets/state/assets_state.dart' as _i19;
import '../../features/auth/data/auth_client.dart' as _i573;
import '../../features/auth/state/auth_state.dart' as _i813;
import '../../features/tickets/data/task_client.dart' as _i127;
import '../../features/tickets/state/task_detail_state.dart' as _i327;
import '../../features/tickets/state/task_list_state.dart' as _i369;
import '../../features/tickets/state/task_metrics_state.dart' as _i695;
import '../auth/firebase_auth_service.dart' as _i491;
import '../transport/notification_service_client.dart' as _i245;
import '../transport/organization_service_client.dart' as _i487;
import '../transport/task_service_client.dart' as _i83;
import 'transport_module.dart' as _i718;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final transportModule = _$TransportModule();
    gh.lazySingleton<_i491.FirebaseAuthService>(
        () => _i491.FirebaseAuthService());
    gh.lazySingleton<_i691.Transport>(() => transportModule.transport);
    gh.lazySingleton<_i274.AssetsClient>(() => _i274.AssetsClient());
    gh.lazySingleton<_i573.AuthClient>(() => _i573.AuthClient());
    gh.lazySingleton<_i245.NotificationServiceClient>(
        () => _i245.NotificationServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i487.OrganizationServiceClient>(
        () => _i487.OrganizationServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i83.TaskServiceClient>(
        () => _i83.TaskServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i19.AssetsState>(
        () => _i19.AssetsState(gh<_i274.AssetsClient>()));
    gh.lazySingleton<_i127.TaskClient>(
        () => _i127.TaskClient(gh<_i83.TaskServiceClient>()));
    gh.lazySingleton<_i813.AuthState>(() => _i813.AuthState(
          gh<_i491.FirebaseAuthService>(),
          gh<_i573.AuthClient>(),
        ));
    gh.lazySingleton<_i369.TaskListState>(() => _i369.TaskListState(
          gh<_i127.TaskClient>(),
          gh<_i813.AuthState>(),
        ));
    gh.lazySingleton<_i327.TaskDetailState>(() => _i327.TaskDetailState(
          gh<_i127.TaskClient>(),
          gh<_i369.TaskListState>(),
        ));
    gh.lazySingleton<_i695.TaskMetricsState>(
        () => _i695.TaskMetricsState(gh<_i127.TaskClient>()));
    return this;
  }
}

class _$TransportModule extends _i718.TransportModule {}
