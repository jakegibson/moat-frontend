import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Route path constants matching v0 structure
abstract class Routes {
  // Auth routes
  static const login = '/login';
  static const signUp = '/sign-up';
  static const resetPassword = '/reset-password';
  static const invite = '/invite'; // /invite/:companyId/:memberId

  // System routes
  static const loading = '/loading';
  static const noPermissions = '/no-permissions';

  // Dashboard
  static const dashboard = '/dashboard';

  // Asset Management
  static const assets = '/assets';
  static const assetsList = '/assets/list';
  static const assetsAlerts = '/assets/alerts';

  // Tickets
  static const tickets = '/tickets';
  static const ticketsList = '/tickets/list';

  // Settings
  static const settings = '/settings';
  static const settingsMembers = '/settings/members';
  static const settingsRoles = '/settings/roles';
  static const settingsLocations = '/settings/locations';
  static const settingsTicketing = '/settings/ticketing';

  // Admin
  static const admin = '/admin';
  static const adminOverview = '/admin/overview';
  static const adminGapAnalysis = '/admin/gap-analysis';
  static const adminMetrics = '/admin/metrics';
  static const adminWorkflows = '/admin/workflows';
  static const adminDocumentProcessing = '/admin/document-processing';
  static const adminPrompts = '/admin/prompts';
  static const adminAIGenerations = '/admin/ai-generations';
  static const adminCompanyManagement = '/admin/company-management';
  static const adminSSODomains = '/admin/sso-domains';
}

/// Type-safe navigation extensions
extension AppRouterExtensions on BuildContext {
  // Dashboard
  void goToDashboard() => go(Routes.dashboard);

  // Assets
  void goToAssets() => go(Routes.assetsList);
  void goToAssetsList() => go(Routes.assetsList);
  void goToAssetsAlerts() => go(Routes.assetsAlerts);
  void goToAsset(String assetId) => go('${Routes.assets}/$assetId');
  void pushAssetDetail(String assetId) => push('${Routes.assets}/$assetId');

  // Tickets
  void goToTickets() => go(Routes.ticketsList);
  void goToTicketsList() => go(Routes.ticketsList);
  void goToTicket(String externalId) => go('${Routes.tickets}/$externalId');
  void pushTicketDetail(String externalId) => push('${Routes.tickets}/$externalId');

  // Settings
  void goToSettings() => go(Routes.settingsMembers);
  void goToSettingsMembers() => go(Routes.settingsMembers);
  void goToSettingsMember(String memberId) => go('${Routes.settingsMembers}/$memberId');
  void goToSettingsRoles() => go(Routes.settingsRoles);
  void goToSettingsLocations() => go(Routes.settingsLocations);
  void goToSettingsTicketing() => go(Routes.settingsTicketing);

  // Admin
  void goToAdmin() => go(Routes.adminOverview);
  void goToAdminOverview() => go(Routes.adminOverview);
  void goToAdminGapAnalysis() => go(Routes.adminGapAnalysis);
  void goToAdminMetrics() => go(Routes.adminMetrics);
  void goToAdminWorkflows() => go(Routes.adminWorkflows);
  void goToAdminDocumentProcessing() => go(Routes.adminDocumentProcessing);
  void goToAdminPrompts() => go(Routes.adminPrompts);
  void goToAdminAIGenerations() => go(Routes.adminAIGenerations);
  void goToAdminCompanyManagement() => go(Routes.adminCompanyManagement);
  void goToAdminSSODomains() => go(Routes.adminSSODomains);

  // Auth
  void goToLogin() => go(Routes.login);
  void goToLoginWithRedirect(String redirectTo) {
    final encoded = Uri.encodeComponent(redirectTo);
    go('${Routes.login}?redirect=$encoded');
  }
  void goToSignUp() => go(Routes.signUp);
  void goToResetPassword() => go(Routes.resetPassword);

  // System
  void goToLoading({String? redirectTo}) {
    if (redirectTo != null) {
      final encoded = Uri.encodeComponent(redirectTo);
      go('${Routes.loading}?redirectTo=$encoded');
    } else {
      go(Routes.loading);
    }
  }
  void goToNoPermissions() => go(Routes.noPermissions);
}
