import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../styles/app_colors.dart';
import '../../common_widgets/navigation/main_side_menu.dart';
import '../../common_screens/common_screens.dart';
import '../../features/admin/screens/admin_screens.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/sign_up_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/assets/screens/assets_screen.dart';
import '../../features/assets/screens/asset_detail_screen.dart';
import '../../features/assets/screens/alerts_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/settings/screens/settings_members_screen.dart';
import '../../features/settings/screens/settings_roles_screen.dart';
import '../../features/settings/screens/settings_locations_screen.dart';
import '../../features/settings/screens/settings_ticketing_screen.dart';
import '../../features/tickets/screens/ticket_list_screen.dart' as tickets;
import '../../features/tickets/screens/ticket_detail_page.dart' as tickets;
import '../../features/reports/screens/reports_dashboard_screen.dart';
import '../../features/reports/screens/reports_dashboard_v2_screen.dart';
import '../../features/explore/screens/data_explorer_screen.dart';
import 'routes.dart';

/// Main application router configuration
final appRouter = GoRouter(
  initialLocation: Routes.ticketsList,
  redirect: _authGuard,
  routes: [
    // Redirect root to tickets (matching v0 default)
    GoRoute(
      path: '/',
      redirect: (_, __) => Routes.ticketsList,
    ),

    // ========== Auth Routes ==========
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '${Routes.invite}/:companyId/:memberId',
      builder: (context, state) {
        final companyId = state.pathParameters['companyId']!;
        final memberId = state.pathParameters['memberId']!;
        final token = state.uri.queryParameters['token'];
        return InviteScreen(
          companyId: companyId,
          memberId: memberId,
          token: token,
        );
      },
    ),

    // ========== System Routes ==========
    GoRoute(
      path: Routes.loading,
      builder: (context, state) {
        final redirectTo = state.uri.queryParameters['redirectTo'];
        return LoadingScreen(redirectTo: redirectTo);
      },
    ),
    GoRoute(
      path: Routes.noPermissions,
      builder: (context, state) => const NoPermissionsScreen(),
    ),

    // ========== Main App Shell ==========
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        // Dashboard
        GoRoute(
          path: Routes.dashboard,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DashboardScreen(),
          ),
        ),

        // ========== Asset Management Shell ==========
        GoRoute(
          path: Routes.assets,
          redirect: (_, __) => Routes.assetsList,
        ),
        ShellRoute(
          builder: (context, state, child) => AssetManagementShell(child: child),
          routes: [
            GoRoute(
              path: Routes.assetsList,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AssetsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.assetsAlerts,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AlertsScreen(),
              ),
            ),
          ],
        ),
        // Asset detail route - AFTER ShellRoute so /assets/list and /assets/alerts match first
        GoRoute(
          path: '${Routes.assets}/:assetId',
          builder: (context, state) {
            final assetId = state.pathParameters['assetId']!;
            return AssetDetailScreen(assetId: assetId);
          },
        ),

        // ========== Tickets Shell ==========
        GoRoute(
          path: Routes.tickets,
          redirect: (_, __) => Routes.ticketsList,
        ),
        ShellRoute(
          builder: (context, state, child) => TicketsShell(child: child),
          routes: [
            GoRoute(
              path: Routes.ticketsList,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: tickets.TicketListScreen(),
              ),
            ),
            GoRoute(
              path: '${Routes.tickets}/:externalId',
              pageBuilder: (context, state) {
                final externalId = state.pathParameters['externalId']!;
                // Use timestamp-based key to force widget recreation on each navigation
                return NoTransitionPage(
                  key: ValueKey('ticket-$externalId-${DateTime.now().millisecondsSinceEpoch}'),
                  child: tickets.TicketDetailPage(externalId: externalId),
                );
              },
            ),
          ],
        ),

        // ========== Reports Shell ==========
        GoRoute(
          path: Routes.reports,
          redirect: (_, __) => Routes.reportsDashboard,
        ),
        ShellRoute(
          builder: (context, state, child) => ReportsShell(child: child),
          routes: [
            GoRoute(
              path: Routes.reportsDashboard,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ReportsDashboardScreen(),
              ),
            ),
          ],
        ),

        // ========== Reports 2 Shell (fl_chart) ==========
        GoRoute(
          path: Routes.reports2,
          redirect: (_, __) => Routes.reports2Dashboard,
        ),
        ShellRoute(
          builder: (context, state, child) => Reports2Shell(child: child),
          routes: [
            GoRoute(
              path: Routes.reports2Dashboard,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ReportsDashboardV2Screen(),
              ),
            ),
          ],
        ),

        // ========== Data Explorer Shell ==========
        GoRoute(
          path: Routes.explore,
          redirect: (_, __) => Routes.exploreBuilder,
        ),
        ShellRoute(
          builder: (context, state, child) => ExploreShell(child: child),
          routes: [
            GoRoute(
              path: Routes.exploreBuilder,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DataExplorerScreen(),
              ),
            ),
          ],
        ),

        // ========== Settings Shell ==========
        GoRoute(
          path: Routes.settings,
          redirect: (_, __) => Routes.settingsMembers,
        ),
        ShellRoute(
          builder: (context, state, child) => SettingsShell(child: child),
          routes: [
            GoRoute(
              path: Routes.settingsMembers,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsMembersScreen(),
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final memberId = state.pathParameters['id']!;
                    return AddMemberScreen(memberId: memberId);
                  },
                ),
              ],
            ),
            GoRoute(
              path: Routes.settingsRoles,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsRolesScreen(),
              ),
            ),
            GoRoute(
              path: Routes.settingsLocations,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsLocationsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.settingsTicketing,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsTicketingScreen(),
              ),
            ),
          ],
        ),

        // ========== Admin Shell ==========
        GoRoute(
          path: Routes.admin,
          redirect: (_, __) => Routes.adminOverview,
        ),
        ShellRoute(
          builder: (context, state, child) => AdminShell(child: child),
          routes: [
            GoRoute(
              path: Routes.adminOverview,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminOverviewScreen(),
              ),
            ),
            GoRoute(
              path: Routes.adminGapAnalysis,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminGapAnalysisScreen(),
              ),
            ),
            GoRoute(
              path: Routes.adminMetrics,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminMetricsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.adminPrompts,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminPromptsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.adminAIGenerations,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminAIGenerationsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.adminCompanyManagement,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminCompanyManagementScreen(),
              ),
            ),
            GoRoute(
              path: Routes.adminSSODomains,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminSSODomainsScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Check if a route is a public auth route
bool _isAuthRoute(String location) {
  return location == Routes.login ||
      location == Routes.signUp ||
      location == Routes.resetPassword ||
      location.startsWith(Routes.invite);
}

/// Auth redirect guard - uses Firebase auth directly like v0
String? _authGuard(BuildContext context, GoRouterState state) {
  final isLoggedIn = FirebaseAuth.instance.currentUser != null;
  final isAuthRoute = _isAuthRoute(state.matchedLocation);
  final currentPath = state.matchedLocation;

  // Allow reset-password without auth
  if (currentPath == Routes.resetPassword) {
    return null;
  }

  // Not logged in and trying to access protected route -> redirect to login
  if (!isLoggedIn && !isAuthRoute) {
    return Routes.login;
  }

  // Logged in and on login page -> redirect to tickets
  if (isLoggedIn && currentPath == Routes.login) {
    return Routes.ticketsList;
  }

  return null;
}

// =============================================================================
// Shell Widgets
// =============================================================================

/// Main app shell with v0-style sidebar
class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: Row(
        children: [
          // Show sidebar on desktop only
          if (!isMobile) const MainSideMenu(),
          // Content area
          Expanded(child: child),
        ],
      ),
      // Mobile bottom navigation (simplified for now)
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              currentIndex: _selectedIndex(GoRouterState.of(context).matchedLocation),
              onTap: (index) => _onTap(context, index),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.blueLight700,
              unselectedItemColor: AppColors.textTertiary,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory_2_outlined),
                  activeIcon: Icon(Icons.inventory_2),
                  label: 'Assets',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.confirmation_number_outlined),
                  activeIcon: Icon(Icons.confirmation_number),
                  label: 'Tickets',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined),
                  activeIcon: Icon(Icons.notifications),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            )
          : null,
    );
  }

  int _selectedIndex(String location) {
    if (location.startsWith(Routes.assets)) return 0;
    if (location.startsWith(Routes.tickets)) return 1;
    if (location.startsWith(Routes.settings)) return 3;
    return 1; // Default to tickets
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(Routes.assetsList);
      case 1:
        context.go(Routes.ticketsList);
      case 2:
        // Notifications - would open drawer
        break;
      case 3:
        context.go(Routes.settingsMembers);
    }
  }
}

/// Asset management shell (tabs for list/alerts)
class AssetManagementShell extends StatelessWidget {
  final Widget child;

  const AssetManagementShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child; // For now, just pass through. Can add tabs later.
  }
}

/// Tickets shell
class TicketsShell extends StatelessWidget {
  final Widget child;

  const TicketsShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

/// Settings shell (side nav for members/roles/locations/ticketing)
class SettingsShell extends StatelessWidget {
  final Widget child;

  const SettingsShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child; // Can add side navigation later
  }
}

/// Admin shell (side nav for admin sections)
class AdminShell extends StatelessWidget {
  final Widget child;

  const AdminShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child; // Can add side navigation later
  }
}

/// Reports shell
class ReportsShell extends StatelessWidget {
  final Widget child;

  const ReportsShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

/// Reports 2 shell (fl_chart)
class Reports2Shell extends StatelessWidget {
  final Widget child;

  const Reports2Shell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

/// Data Explorer shell
class ExploreShell extends StatelessWidget {
  final Widget child;

  const ExploreShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

// Placeholder screens are now in:
// - lib/common_screens/common_screens.dart (alerts, invite, loading, no permissions)
// - lib/features/dashboard/screens/dashboard_screen.dart
// - lib/features/settings/screens/*.dart
// - lib/features/admin/screens/admin_screens.dart
