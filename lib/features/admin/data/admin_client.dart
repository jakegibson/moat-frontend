import 'package:injectable/injectable.dart';

import '../../../core/transport/admin_service_client.dart';
import '../../../core/transport/organization_service_client.dart';
import '../../../gen/moat/v1/admin.pb.dart' as admin;
import '../../../gen/moat/v1/organization.pb.dart' as org;
import 'admin_models.dart';

export 'admin_models.dart';

/// Client for admin API calls.
///
/// Uses real v1 APIs:
/// - Members/locations/roles via OrganizationServiceClient
/// - SSO/prompts/generations/gap-analysis/stats via AdminServiceClient
@lazySingleton
class AdminClient {
  final OrganizationServiceClient _orgClient;
  final AdminServiceClient _adminClient;

  AdminClient(this._orgClient, this._adminClient);

  // ===========================================================================
  // Members (via OrganizationService)
  // ===========================================================================

  Future<List<Member>> listMembers({
    String? search,
    bool includePending = true,
    bool includeDeleted = false,
    int limit = 50,
    int offset = 0,
  }) async {
    final response = await _orgClient.listMembers(org.ListMembersRequest(
      search: search ?? '',
      includePending: includePending,
      includeDeleted: includeDeleted,
      limit: limit,
      offset: offset,
    ));
    return response.members.map(_fromProtoMember).toList();
  }

  Future<org.Member> getMember(String memberId) {
    return _orgClient.getMember(org.GetMemberRequest(memberId: memberId));
  }

  Future<org.Member> createMember({
    required String email,
    required String firstName,
    required String lastName,
    List<String>? roleIds,
    List<String>? locationIds,
  }) {
    return _orgClient.createMember(org.CreateMemberRequest(
      email: email,
      firstName: firstName,
      lastName: lastName,
      roleIds: roleIds ?? [],
      locationIds: locationIds ?? [],
    ));
  }

  Future<org.Member> updateMember({
    required String memberId,
    String? firstName,
    String? lastName,
  }) {
    return _orgClient.updateMember(org.UpdateMemberRequest(
      memberId: memberId,
      firstName: firstName,
      lastName: lastName,
    ));
  }

  Future<void> deleteMember(String memberId) {
    return _orgClient
        .deleteMember(org.DeleteMemberRequest(memberId: memberId))
        .then((_) {});
  }

  // ===========================================================================
  // Locations (via OrganizationService)
  // ===========================================================================

  Future<List<Location>> listLocations() async {
    final response = await _orgClient.listLocations(org.ListLocationsRequest());
    return response.locations.map(_fromProtoLocation).toList();
  }

  Future<org.Location> getLocation(String locationId) {
    return _orgClient
        .getLocation(org.GetLocationRequest(locationId: locationId));
  }

  Future<org.Location> createLocation({
    required String name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) {
    return _orgClient.createLocation(org.CreateLocationRequest(
      name: name,
      address: address ?? '',
      city: city ?? '',
      state: state ?? '',
      zipCode: zipCode ?? '',
      country: country ?? '',
    ));
  }

  Future<org.Location> updateLocation({
    required String locationId,
    String? name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
  }) {
    return _orgClient.updateLocation(org.UpdateLocationRequest(
      locationId: locationId,
      name: name,
      address: address,
      city: city,
      state: state,
      zipCode: zipCode,
      country: country,
    ));
  }

  Future<void> deleteLocation(String locationId) {
    return _orgClient
        .deleteLocation(org.DeleteLocationRequest(locationId: locationId))
        .then((_) {});
  }

  // ===========================================================================
  // Roles (via OrganizationService)
  // ===========================================================================

  Future<List<Role>> listRoles({bool includeSystem = false}) async {
    final response = await _orgClient
        .listRoles(org.ListRolesRequest(includeSystem: includeSystem));
    return response.roles.map(_fromProtoRoleDetail).toList();
  }

  Future<org.RoleDetail> getRole(String roleId) {
    return _orgClient.getRole(org.GetRoleRequest(roleId: roleId));
  }

  Future<org.RoleDetail> createRole({
    required String name,
    String? description,
    bool isAssignable = true,
    List<String>? permissionIds,
  }) {
    return _orgClient.createRole(org.CreateRoleRequest(
      name: name,
      description: description ?? '',
      isAssignable: isAssignable,
      permissionIds: permissionIds ?? [],
    ));
  }

  Future<org.RoleDetail> updateRole({
    required String roleId,
    String? name,
    String? description,
    bool? isAssignable,
    List<String>? permissionIds,
  }) {
    return _orgClient.updateRole(org.UpdateRoleRequest(
      roleId: roleId,
      name: name,
      description: description,
      isAssignable: isAssignable,
      permissionIds: permissionIds ?? [],
    ));
  }

  Future<void> deleteRole(String roleId) {
    return _orgClient
        .deleteRole(org.DeleteRoleRequest(roleId: roleId))
        .then((_) {});
  }

  Future<void> assignRole({
    required String memberId,
    required String roleId,
    List<String>? locationIds,
  }) {
    return _orgClient
        .assignRole(org.AssignRoleRequest(
          memberId: memberId,
          roleId: roleId,
          locationIds: locationIds ?? [],
        ))
        .then((_) {});
  }

  Future<void> revokeRole({
    required String memberId,
    required String roleId,
    String? reason,
  }) {
    return _orgClient
        .revokeRole(org.RevokeRoleRequest(
          memberId: memberId,
          roleId: roleId,
          reason: reason ?? '',
        ))
        .then((_) {});
  }

  // ===========================================================================
  // Permissions (via OrganizationService)
  // ===========================================================================

  Future<org.ListPermissionsResponse> listPermissions() {
    return _orgClient.listPermissions(org.ListPermissionsRequest());
  }

  // ===========================================================================
  // SSO Domains (via AdminService)
  // ===========================================================================

  Future<List<SSODomain>> listSSODomains({String? companyId}) async {
    final response = await _adminClient.listSSODomains(admin.ListSSODomainsRequest(
      companyId: companyId,
    ));
    return response.domains.map(_fromProtoSSODomain).toList();
  }

  Future<admin.SSODomain> getSSODomain(String domainId) {
    return _adminClient
        .getSSODomain(admin.GetSSODomainRequest(domainId: domainId));
  }

  Future<admin.SSODomain> createSSODomain({
    required String domain,
    required String companyId,
    List<String>? allowedAuthProviders,
    bool autoJoinEnabled = true,
    String? defaultRoleId,
  }) {
    return _adminClient.createSSODomain(admin.CreateSSODomainRequest(
      domain: domain,
      companyId: companyId,
      allowedAuthProviders: allowedAuthProviders ?? ['google.com'],
      autoJoinEnabled: autoJoinEnabled,
      defaultRoleId: defaultRoleId,
    ));
  }

  Future<admin.SSODomain> updateSSODomain({
    required String domainId,
    String? domain,
    List<String>? allowedAuthProviders,
    bool? autoJoinEnabled,
    String? defaultRoleId,
  }) {
    return _adminClient.updateSSODomain(admin.UpdateSSODomainRequest(
      domainId: domainId,
      domain: domain,
      allowedAuthProviders: allowedAuthProviders ?? [],
      autoJoinEnabled: autoJoinEnabled,
      defaultRoleId: defaultRoleId,
    ));
  }

  Future<void> deleteSSODomain(String domainId) {
    return _adminClient
        .deleteSSODomain(admin.DeleteSSODomainRequest(domainId: domainId))
        .then((_) {});
  }

  // ===========================================================================
  // Prompt Templates (via AdminService)
  // ===========================================================================

  Future<List<PromptTemplate>> listPromptTemplates({
    admin.PromptCategory? category,
    String? search,
  }) async {
    final response = await _adminClient.listPromptTemplates(admin.ListPromptTemplatesRequest(
      category: category,
      search: search,
    ));
    return response.templates.map(_fromProtoPromptTemplate).toList();
  }

  Future<admin.PromptTemplateDetail> getPromptTemplate(String templateId) {
    return _adminClient.getPromptTemplate(
        admin.GetPromptTemplateRequest(templateId: templateId));
  }

  Future<admin.PromptTemplate> createPromptTemplate({
    required String key,
    required String name,
    String? description,
    required admin.PromptCategory category,
    required String initialContent,
  }) {
    return _adminClient.createPromptTemplate(admin.CreatePromptTemplateRequest(
      key: key,
      name: name,
      description: description,
      category: category,
      initialContent: initialContent,
    ));
  }

  Future<admin.PromptTemplate> updatePromptTemplate({
    required String templateId,
    String? name,
    String? description,
    admin.PromptCategory? category,
  }) {
    return _adminClient.updatePromptTemplate(admin.UpdatePromptTemplateRequest(
      templateId: templateId,
      name: name,
      description: description,
      category: category,
    ));
  }

  Future<void> deletePromptTemplate(String templateId) {
    return _adminClient
        .deletePromptTemplate(
            admin.DeletePromptTemplateRequest(templateId: templateId))
        .then((_) {});
  }

  // ===========================================================================
  // Prompt Versions (via AdminService)
  // ===========================================================================

  Future<admin.PromptVersion> createPromptVersion({
    required String templateId,
    required String content,
    String? notes,
    String? modelName,
  }) {
    return _adminClient.createPromptVersion(admin.CreatePromptVersionRequest(
      templateId: templateId,
      content: content,
      notes: notes,
      modelName: modelName,
    ));
  }

  Future<void> activatePromptVersion({
    required String templateId,
    required int versionNumber,
    required admin.Environment environment,
  }) {
    return _adminClient
        .activatePromptVersion(admin.ActivatePromptVersionRequest(
          templateId: templateId,
          versionNumber: versionNumber,
          environment: environment,
        ))
        .then((_) {});
  }

  Future<void> deactivatePromptVersion({
    required String templateId,
    required int versionNumber,
    required admin.Environment environment,
  }) {
    return _adminClient
        .deactivatePromptVersion(admin.DeactivatePromptVersionRequest(
          templateId: templateId,
          versionNumber: versionNumber,
          environment: environment,
        ))
        .then((_) {});
  }

  Future<void> promotePromptVersion({
    required String templateId,
    required int versionNumber,
    required admin.Environment fromEnvironment,
    required admin.Environment toEnvironment,
  }) {
    return _adminClient
        .promotePromptVersion(admin.PromotePromptVersionRequest(
          templateId: templateId,
          versionNumber: versionNumber,
          fromEnvironment: fromEnvironment,
          toEnvironment: toEnvironment,
        ))
        .then((_) {});
  }

  // ===========================================================================
  // AI Generations (via AdminService)
  // ===========================================================================

  Future<admin.GenerationStats> getGenerationStats({
    String? companyId,
    String? generationType,
  }) {
    return _adminClient.getGenerationStats(admin.GetGenerationStatsRequest(
      companyId: companyId,
      generationType: generationType,
    ));
  }

  Future<List<Generation>> listGenerations({
    String? companyId,
    String? assetId,
    String? generationType,
    bool? success,
    String? status,
    int limit = 50,
    int offset = 0,
    String sortBy = 'created_at',
    String sortOrder = 'desc',
  }) async {
    final response = await _adminClient.listGenerations(admin.ListGenerationsRequest(
      companyId: companyId,
      assetId: assetId,
      generationType: generationType,
      success: success,
      status: status,
      limit: limit,
      offset: offset,
      sortBy: sortBy,
      sortOrder: sortOrder,
    ));
    return response.generations.map(_fromProtoGeneration).toList();
  }

  Future<admin.GenerationDetail> getGeneration(String generationId) {
    return _adminClient
        .getGeneration(admin.GetGenerationRequest(generationId: generationId));
  }

  Future<admin.GetRecentErrorsResponse> getRecentErrors({
    int limit = 20,
    String? companyId,
  }) {
    return _adminClient.getRecentErrors(admin.GetRecentErrorsRequest(
      limit: limit,
      companyId: companyId,
    ));
  }

  Future<admin.AssetAIHistory> getAssetAIHistory(String assetId) {
    return _adminClient
        .getAssetAIHistory(admin.GetAssetAIHistoryRequest(assetId: assetId));
  }

  // ===========================================================================
  // Gap Analysis (via AdminService)
  // ===========================================================================

  Future<admin.GapAnalysisResponse> getAssetGapAnalysis(String companyId) {
    return _adminClient.getAssetGapAnalysis(
        admin.GetAssetGapAnalysisRequest(companyId: companyId));
  }

  Future<admin.GetAssetsMissingFieldsResponse> getAssetsMissingFields({
    required String companyId,
    required List<String> fieldNames,
    int limit = 50,
    int offset = 0,
  }) {
    return _adminClient
        .getAssetsMissingFields(admin.GetAssetsMissingFieldsRequest(
      companyId: companyId,
      fieldNames: fieldNames,
      limit: limit,
      offset: offset,
    ));
  }

  // ===========================================================================
  // System Statistics (via AdminService)
  // ===========================================================================

  Future<admin.SystemOverviewResponse> getSystemOverview() {
    return _adminClient
        .getSystemOverview(admin.GetSystemOverviewRequest());
  }

  Future<admin.GetCompanySummariesResponse> getCompanySummaries({
    String? search,
    String sortBy = 'name',
    String sortOrder = 'asc',
    int limit = 50,
    int offset = 0,
  }) {
    return _adminClient.getCompanySummaries(admin.GetCompanySummariesRequest(
      search: search,
      sortBy: sortBy,
      sortOrder: sortOrder,
      limit: limit,
      offset: offset,
    ));
  }

  // ===========================================================================
  // Proto Converters
  // ===========================================================================

  Member _fromProtoMember(org.Member proto) {
    return Member(
      id: proto.id,
      email: proto.email,
      firstName: proto.firstName,
      lastName: proto.lastName,
      hasAcceptedInvite: proto.hasAcceptedInvite,
      deleted: proto.deleted,
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
      roles: proto.roles.map(_fromProtoMemberRole).toList(),
      locationIds: proto.locationIds.toList(),
    );
  }

  MemberRole _fromProtoMemberRole(org.MemberRole proto) {
    return MemberRole(
      id: proto.id,
      name: proto.name,
      isSystem: proto.isSystem,
      locationIds: proto.locationIds.toList(),
    );
  }

  Location _fromProtoLocation(org.Location proto) {
    return Location(
      id: proto.id,
      name: proto.name,
      description: proto.description,
      address: proto.address,
      city: proto.city,
      state: proto.state,
      zipCode: proto.zipCode,
      country: proto.country,
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
    );
  }

  Role _fromProtoRoleDetail(org.RoleDetail proto) {
    return Role(
      id: proto.id,
      name: proto.name,
      description: proto.description,
      isSystem: proto.isSystem,
      isAssignable: proto.isAssignable,
      permissions: proto.permissions.map(_fromProtoPermission).toList(),
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
    );
  }

  Permission _fromProtoPermission(org.Permission proto) {
    return Permission(
      id: proto.id,
      name: proto.name,
    );
  }

  SSODomain _fromProtoSSODomain(admin.SSODomain proto) {
    return SSODomain(
      id: proto.id,
      domain: proto.domain,
      companyId: proto.companyId,
      companyName: proto.companyName,
      allowedAuthProviders: proto.allowedAuthProviders.toList(),
      autoJoinEnabled: proto.autoJoinEnabled,
      defaultRoleId: proto.hasDefaultRoleId() ? proto.defaultRoleId : null,
      defaultRoleName: proto.hasDefaultRoleName() ? proto.defaultRoleName : null,
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
    );
  }

  PromptTemplate _fromProtoPromptTemplate(admin.PromptTemplate proto) {
    return PromptTemplate(
      id: proto.id,
      key: proto.key,
      name: proto.name,
      description: proto.description,
      category: _fromProtoPromptCategory(proto.category),
      versionCount: proto.versionCount,
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
    );
  }

  PromptCategory _fromProtoPromptCategory(admin.PromptCategory proto) {
    if (proto == admin.PromptCategory.PROMPT_CATEGORY_EXTRACTION) {
      return PromptCategory.extraction;
    } else if (proto == admin.PromptCategory.PROMPT_CATEGORY_ANALYSIS) {
      return PromptCategory.analysis;
    } else if (proto == admin.PromptCategory.PROMPT_CATEGORY_GENERATION) {
      return PromptCategory.generation;
    } else if (proto == admin.PromptCategory.PROMPT_CATEGORY_CLASSIFICATION) {
      return PromptCategory.classification;
    }
    return PromptCategory.unspecified;
  }

  Generation _fromProtoGeneration(admin.Generation proto) {
    return Generation(
      id: proto.id,
      companyId: proto.companyId,
      companyName: proto.companyName,
      assetId: proto.assetId,
      assetName: proto.assetName,
      fileId: proto.fileId,
      generationType: proto.generationType,
      success: proto.success,
      error: proto.hasError() ? proto.error : null,
      status: proto.status,
      latencyMs: proto.latencyMs,
      tokens: proto.hasTokens()
          ? TokenUsage(
              prompt: proto.tokens.prompt,
              completion: proto.tokens.completion,
              total: proto.tokens.total,
            )
          : null,
      costUsd: proto.costUsd,
      createdAt: proto.hasCreatedAt() ? proto.createdAt.toDateTime() : null,
      completedAt: proto.hasCompletedAt() ? proto.completedAt.toDateTime() : null,
    );
  }
}
