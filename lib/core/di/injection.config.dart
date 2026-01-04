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

import '../../features/admin/data/admin_client.dart' as _i1026;
import '../../features/admin/state/admin_state.dart' as _i34;
import '../../features/assets/data/alerts_client.dart' as _i829;
import '../../features/assets/data/assets_client.dart' as _i274;
import '../../features/assets/data/warranty_coverage_client.dart' as _i1037;
import '../../features/assets/state/alerts_state.dart' as _i362;
import '../../features/assets/state/assets_state.dart' as _i19;
import '../../features/auth/data/auth_client.dart' as _i573;
import '../../features/auth/state/auth_state.dart' as _i813;
import '../../features/reports/data/analytics_client.dart' as _i756;
import '../../features/reports/state/reports_state.dart' as _i949;
import '../../features/settings/data/locations_client.dart' as _i855;
import '../../features/settings/data/members_client.dart' as _i234;
import '../../features/settings/data/roles_client.dart' as _i448;
import '../../features/settings/data/ticketing_client.dart' as _i81;
import '../../features/settings/state/locations_state.dart' as _i980;
import '../../features/settings/state/members_state.dart' as _i861;
import '../../features/settings/state/roles_state.dart' as _i1043;
import '../../features/settings/state/ticketing_state.dart' as _i516;
import '../../features/tickets/data/task_client.dart' as _i127;
import '../../features/tickets/state/task_detail_state.dart' as _i327;
import '../../features/tickets/state/task_list_state.dart' as _i369;
import '../../features/tickets/state/task_metrics_state.dart' as _i695;
import '../auth/firebase_auth_service.dart' as _i491;
import '../transport/asset_service_client.dart' as _i621;
import '../transport/notification_service_client.dart' as _i245;
import '../transport/organization_service_client.dart' as _i487;
import '../transport/task_service_client.dart' as _i83;
import '../transport/warranty_coverage_service_client.dart' as _i660;
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
    gh.lazySingleton<_i1026.AdminClient>(() => _i1026.AdminClient());
    gh.lazySingleton<_i829.AlertsClient>(() => _i829.AlertsClient());
    gh.lazySingleton<_i573.AuthClient>(() => _i573.AuthClient());
    gh.lazySingleton<_i756.AnalyticsClient>(() => _i756.AnalyticsClient());
    gh.lazySingleton<_i855.LocationsClient>(() => _i855.LocationsClient());
    gh.lazySingleton<_i234.MembersClient>(() => _i234.MembersClient());
    gh.lazySingleton<_i448.RolesClient>(() => _i448.RolesClient());
    gh.lazySingleton<_i81.TicketingClient>(() => _i81.TicketingClient());
    gh.lazySingleton<_i516.TicketingState>(
        () => _i516.TicketingState(gh<_i81.TicketingClient>()));
    gh.lazySingleton<_i34.AdminState>(
        () => _i34.AdminState(gh<_i1026.AdminClient>()));
    gh.lazySingleton<_i621.AssetServiceClient>(
        () => _i621.AssetServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i245.NotificationServiceClient>(
        () => _i245.NotificationServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i487.OrganizationServiceClient>(
        () => _i487.OrganizationServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i83.TaskServiceClient>(
        () => _i83.TaskServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i660.WarrantyCoverageServiceClient>(
        () => _i660.WarrantyCoverageServiceClient(gh<_i691.Transport>()));
    gh.lazySingleton<_i362.AlertsState>(
        () => _i362.AlertsState(gh<_i829.AlertsClient>()));
    gh.lazySingleton<_i1043.RolesState>(
        () => _i1043.RolesState(gh<_i448.RolesClient>()));
    gh.lazySingleton<_i949.ReportsState>(
        () => _i949.ReportsState(gh<_i756.AnalyticsClient>()));
    gh.lazySingleton<_i980.LocationsState>(
        () => _i980.LocationsState(gh<_i855.LocationsClient>()));
    gh.lazySingleton<_i127.TaskClient>(
        () => _i127.TaskClient(gh<_i83.TaskServiceClient>()));
    gh.lazySingleton<_i861.MembersState>(
        () => _i861.MembersState(gh<_i234.MembersClient>()));
    gh.lazySingleton<_i813.AuthState>(() => _i813.AuthState(
          gh<_i491.FirebaseAuthService>(),
          gh<_i573.AuthClient>(),
        ));
    gh.lazySingleton<_i1037.WarrantyCoverageClient>(() =>
        _i1037.WarrantyCoverageClient(
            gh<_i660.WarrantyCoverageServiceClient>()));
    gh.lazySingleton<_i274.AssetsClient>(
        () => _i274.AssetsClient(gh<_i621.AssetServiceClient>()));
    gh.lazySingleton<_i369.TaskListState>(() => _i369.TaskListState(
          gh<_i127.TaskClient>(),
          gh<_i813.AuthState>(),
        ));
    gh.lazySingleton<_i19.AssetsState>(
        () => _i19.AssetsState(gh<_i274.AssetsClient>()));
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
