import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../core/utils/app_error.dart';
import '../../../core/utils/result.dart';
import '../../../gen/moat/v1/admin.pb.dart' as admin;
import '../../../gen/moat/v1/organization.pb.dart' as org;
import '../data/admin_client.dart';
import 'admin_org_state.dart';

/// State management for admin features.
///
/// Uses Signals for reactive state updates.
/// Organization-related operations are delegated to [AdminOrgState].
@lazySingleton
class AdminState {
  final AdminClient _client;
  final AdminOrgState _orgState;

  AdminState(this._client, this._orgState);

  // ===========================================================================
  // Delegated Organization State (via AdminOrgState)
  // ===========================================================================

  // Members
  Signal<List<Member>> get members => _orgState.members;
  Signal<int> get membersTotal => _orgState.membersTotal;
  Signal<bool> get isLoadingMembers => _orgState.isLoadingMembers;
  Signal<AppError?> get membersError => _orgState.membersError;

  Future<void> fetchMembers({
    bool refresh = false,
    String? search,
    bool includePending = true,
  }) =>
      _orgState.fetchMembers(
          refresh: refresh, search: search, includePending: includePending);

  Future<Result<org.Member>> createMember({
    required String email,
    required String firstName,
    required String lastName,
    List<String>? roleIds,
    List<String>? locationIds,
  }) =>
      _orgState.createMember(
        email: email,
        firstName: firstName,
        lastName: lastName,
        roleIds: roleIds,
        locationIds: locationIds,
      );

  Future<Result<org.Member>> updateMember({
    required String memberId,
    String? firstName,
    String? lastName,
  }) =>
      _orgState.updateMember(
          memberId: memberId, firstName: firstName, lastName: lastName);

  Future<Result<void>> deleteMember(String memberId) =>
      _orgState.deleteMember(memberId);

  // Locations
  Signal<List<Location>> get locations => _orgState.locations;
  Signal<bool> get isLoadingLocations => _orgState.isLoadingLocations;
  Signal<AppError?> get locationsError => _orgState.locationsError;

  Future<void> fetchLocations({bool refresh = false}) =>
      _orgState.fetchLocations(refresh: refresh);

  Future<Result<org.Location>> createLocation({
    required String name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) =>
      _orgState.createLocation(
        name: name,
        address: address,
        city: city,
        state: state,
        zipCode: zipCode,
        country: country,
      );

  Future<Result<org.Location>> updateLocation({
    required String locationId,
    String? name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) =>
      _orgState.updateLocation(
        locationId: locationId,
        name: name,
        address: address,
        city: city,
        state: state,
        zipCode: zipCode,
        country: country,
      );

  Future<Result<void>> deleteLocation(String locationId) =>
      _orgState.deleteLocation(locationId);

  // Roles
  Signal<List<Role>> get roles => _orgState.roles;
  Signal<bool> get isLoadingRoles => _orgState.isLoadingRoles;
  Signal<AppError?> get rolesError => _orgState.rolesError;

  Future<void> fetchRoles({bool refresh = false, bool includeSystem = false}) =>
      _orgState.fetchRoles(refresh: refresh, includeSystem: includeSystem);

  Future<Result<org.RoleDetail>> createRole({
    required String name,
    String? description,
    bool isAssignable = true,
    List<String>? permissionIds,
  }) =>
      _orgState.createRole(
        name: name,
        description: description,
        isAssignable: isAssignable,
        permissionIds: permissionIds,
      );

  Future<Result<org.RoleDetail>> updateRole({
    required String roleId,
    String? name,
    String? description,
    bool? isAssignable,
    List<String>? permissionIds,
  }) =>
      _orgState.updateRole(
        roleId: roleId,
        name: name,
        description: description,
        isAssignable: isAssignable,
        permissionIds: permissionIds,
      );

  Future<Result<void>> deleteRole(String roleId) =>
      _orgState.deleteRole(roleId);

  Future<Result<void>> assignRole({
    required String memberId,
    required String roleId,
    List<String>? locationIds,
  }) =>
      _orgState.assignRole(
          memberId: memberId, roleId: roleId, locationIds: locationIds);

  Future<Result<void>> revokeRole({
    required String memberId,
    required String roleId,
    String? reason,
  }) =>
      _orgState.revokeRole(memberId: memberId, roleId: roleId, reason: reason);

  // Permissions
  Signal<List<org.Permission>> get permissions => _orgState.permissions;
  Signal<bool> get isLoadingPermissions => _orgState.isLoadingPermissions;
  Signal<AppError?> get permissionsError => _orgState.permissionsError;

  Future<void> fetchPermissions({bool refresh = false}) =>
      _orgState.fetchPermissions(refresh: refresh);

  // ===========================================================================
  // SSO Domains State (via AdminService)
  // ===========================================================================

  final ssoDomains = signal<List<SSODomain>>([]);
  final isLoadingSSO = signal(false);
  final ssoError = signal<AppError?>(null);

  Future<void> fetchSSODomains({bool refresh = false}) async {
    if (isLoadingSSO.value && !refresh) return;

    isLoadingSSO.value = true;
    ssoError.value = null;

    final result = await _client.listSSODomains().toResult();

    batch(() {
      result.when(
        ok: (data) => ssoDomains.value = data,
        error: (e) => ssoError.value = e,
      );
      isLoadingSSO.value = false;
    });
  }

  Future<Result<admin.SSODomain>> createSSODomain({
    required String domain,
    required String companyId,
    List<String>? allowedAuthProviders,
    bool autoJoinEnabled = true,
    String? defaultRoleId,
  }) async {
    final result = await _client
        .createSSODomain(
          domain: domain,
          companyId: companyId,
          allowedAuthProviders: allowedAuthProviders,
          autoJoinEnabled: autoJoinEnabled,
          defaultRoleId: defaultRoleId,
        )
        .toResult();

    result.when(
      ok: (_) => fetchSSODomains(refresh: true),
      error: (e) => ssoError.value = e,
    );

    return result;
  }

  Future<Result<admin.SSODomain>> updateSSODomain({
    required String domainId,
    String? domain,
    List<String>? allowedAuthProviders,
    bool? autoJoinEnabled,
    String? defaultRoleId,
  }) async {
    final result = await _client
        .updateSSODomain(
          domainId: domainId,
          domain: domain,
          allowedAuthProviders: allowedAuthProviders,
          autoJoinEnabled: autoJoinEnabled,
          defaultRoleId: defaultRoleId,
        )
        .toResult();

    result.when(
      ok: (_) => fetchSSODomains(refresh: true),
      error: (e) => ssoError.value = e,
    );

    return result;
  }

  Future<Result<void>> deleteSSODomain(String domainId) async {
    final previous = ssoDomains.value;
    ssoDomains.value =
        ssoDomains.value.where((d) => d.id != domainId).toList();

    final result = await _client.deleteSSODomain(domainId).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        ssoDomains.value = previous;
        ssoError.value = e;
      },
    );

    return result;
  }

  // ===========================================================================
  // Prompt Templates State (via AdminService)
  // ===========================================================================

  final promptTemplates = signal<List<PromptTemplate>>([]);
  final selectedPromptDetail = signal<admin.PromptTemplateDetail?>(null);
  final isLoadingPrompts = signal(false);
  final promptsError = signal<AppError?>(null);

  Future<void> fetchPromptTemplates({
    bool refresh = false,
    admin.PromptCategory? category,
    String? search,
  }) async {
    if (isLoadingPrompts.value && !refresh) return;

    isLoadingPrompts.value = true;
    promptsError.value = null;

    final result = await _client
        .listPromptTemplates(category: category, search: search)
        .toResult();

    batch(() {
      result.when(
        ok: (data) => promptTemplates.value = data,
        error: (e) => promptsError.value = e,
      );
      isLoadingPrompts.value = false;
    });
  }

  Future<Result<admin.PromptTemplateDetail>> fetchPromptTemplate(
      String templateId) async {
    final result = await _client.getPromptTemplate(templateId).toResult();

    result.when(
      ok: (data) => selectedPromptDetail.value = data,
      error: (e) => promptsError.value = e,
    );

    return result;
  }

  Future<Result<admin.PromptTemplate>> createPromptTemplate({
    required String key,
    required String name,
    String? description,
    required admin.PromptCategory category,
    required String initialContent,
  }) async {
    final result = await _client
        .createPromptTemplate(
          key: key,
          name: name,
          description: description,
          category: category,
          initialContent: initialContent,
        )
        .toResult();

    result.when(
      ok: (_) => fetchPromptTemplates(refresh: true),
      error: (e) => promptsError.value = e,
    );

    return result;
  }

  Future<Result<void>> deletePromptTemplate(String templateId) async {
    final previous = promptTemplates.value;
    promptTemplates.value =
        promptTemplates.value.where((t) => t.id != templateId).toList();

    final result = await _client.deletePromptTemplate(templateId).toResult();

    result.when(
      ok: (_) {},
      error: (e) {
        promptTemplates.value = previous;
        promptsError.value = e;
      },
    );

    return result;
  }

  Future<Result<admin.PromptVersion>> createPromptVersion({
    required String templateId,
    required String content,
    String? notes,
    String? modelName,
  }) async {
    final result = await _client
        .createPromptVersion(
          templateId: templateId,
          content: content,
          notes: notes,
          modelName: modelName,
        )
        .toResult();

    result.when(
      ok: (_) => fetchPromptTemplate(templateId),
      error: (e) => promptsError.value = e,
    );

    return result;
  }

  Future<Result<void>> activatePromptVersion({
    required String templateId,
    required int versionNumber,
    required admin.Environment environment,
  }) async {
    final result = await _client
        .activatePromptVersion(
          templateId: templateId,
          versionNumber: versionNumber,
          environment: environment,
        )
        .toResult();

    result.when(
      ok: (_) => fetchPromptTemplate(templateId),
      error: (e) => promptsError.value = e,
    );

    return result;
  }

  // ===========================================================================
  // AI Generations State (via AdminService)
  // ===========================================================================

  final generationStats = signal<admin.GenerationStats?>(null);
  final generations = signal<List<Generation>>([]);
  final generationsTotal = signal(0);
  final isLoadingGenerations = signal(false);
  final generationsError = signal<AppError?>(null);

  Future<void> fetchGenerationStats({
    String? companyId,
    String? generationType,
  }) async {
    final result = await _client
        .getGenerationStats(
            companyId: companyId, generationType: generationType)
        .toResult();

    result.when(
      ok: (data) => generationStats.value = data,
      error: (e) => generationsError.value = e,
    );
  }

  Future<void> fetchGenerations({
    bool refresh = false,
    String? companyId,
    String? generationType,
    bool? success,
    int limit = 50,
    int offset = 0,
  }) async {
    if (isLoadingGenerations.value && !refresh) return;

    isLoadingGenerations.value = true;
    generationsError.value = null;

    final result = await _client
        .listGenerations(
          companyId: companyId,
          generationType: generationType,
          success: success,
          limit: limit,
          offset: offset,
        )
        .toResult();

    batch(() {
      result.when(
        ok: (data) {
          generations.value = data;
          generationsTotal.value = data.length;
        },
        error: (e) => generationsError.value = e,
      );
      isLoadingGenerations.value = false;
    });
  }

  Future<Result<admin.GetRecentErrorsResponse>> fetchRecentErrors({
    int limit = 20,
    String? companyId,
  }) async {
    return await _client
        .getRecentErrors(limit: limit, companyId: companyId)
        .toResult();
  }

  // ===========================================================================
  // Gap Analysis State (via AdminService)
  // ===========================================================================

  final gapAnalysis = signal<admin.GapAnalysisResponse?>(null);
  final isLoadingGapAnalysis = signal(false);
  final gapAnalysisError = signal<AppError?>(null);

  Future<void> fetchGapAnalysis(String companyId) async {
    isLoadingGapAnalysis.value = true;
    gapAnalysisError.value = null;

    final result = await _client.getAssetGapAnalysis(companyId).toResult();

    batch(() {
      result.when(
        ok: (data) => gapAnalysis.value = data,
        error: (e) => gapAnalysisError.value = e,
      );
      isLoadingGapAnalysis.value = false;
    });
  }

  // ===========================================================================
  // System Statistics State (via AdminService)
  // ===========================================================================

  final systemOverview = signal<admin.SystemOverviewResponse?>(null);
  final companySummaries = signal<List<admin.CompanySummary>>([]);
  final companySummariesTotal = signal(0);
  final isLoadingSystemStats = signal(false);
  final systemStatsError = signal<AppError?>(null);

  Future<void> fetchSystemOverview() async {
    isLoadingSystemStats.value = true;
    systemStatsError.value = null;

    final result = await _client.getSystemOverview().toResult();

    batch(() {
      result.when(
        ok: (data) => systemOverview.value = data,
        error: (e) => systemStatsError.value = e,
      );
      isLoadingSystemStats.value = false;
    });
  }

  Future<void> fetchCompanySummaries({
    String? search,
    String sortBy = 'name',
    String sortOrder = 'asc',
    int limit = 50,
    int offset = 0,
  }) async {
    final result = await _client
        .getCompanySummaries(
          search: search,
          sortBy: sortBy,
          sortOrder: sortOrder,
          limit: limit,
          offset: offset,
        )
        .toResult();

    result.when(
      ok: (data) {
        companySummaries.value = data.companies;
        companySummariesTotal.value = data.total;
      },
      error: (e) => systemStatsError.value = e,
    );
  }
}
