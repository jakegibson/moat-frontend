import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../di/injection.dart';
import '../styles/app_colors.dart';
import '../../common_widgets/navigation/main_side_menu.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/sign_up_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/assets/screens/assets_screen.dart';
import '../../features/assets/screens/asset_detail_screen.dart';
import '../../features/assets/state/assets_state.dart';
import '../../features/tickets/screens/ticket_list_screen.dart' as tickets;
import '../../features/tickets/screens/ticket_detail_screen.dart' as tickets;
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
              pageBuilder: (context, state) => NoTransitionPage(
                child: AssetsScreen(state: getIt<AssetsState>()),
              ),
              routes: [
                GoRoute(
                  path: ':assetId',
                  builder: (context, state) {
                    final assetId = state.pathParameters['assetId']!;
                    return AssetDetailScreen(assetId: assetId);
                  },
                ),
              ],
            ),
            GoRoute(
              path: Routes.assetsAlerts,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AlertsScreen(),
              ),
            ),
          ],
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
              builder: (context, state) {
                final externalId = state.pathParameters['externalId']!;
                return tickets.TicketDetailScreen(externalId: externalId);
              },
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
              path: Routes.adminWorkflows,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminWorkflowsScreen(),
              ),
            ),
            GoRoute(
              path: Routes.adminDocumentProcessing,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AdminDocumentProcessingScreen(),
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

// =============================================================================
// Placeholder Screens (to be implemented)
// =============================================================================

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard'));
  }
}

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Alerts'));
  }
}


class InviteScreen extends StatelessWidget {
  final String companyId;
  final String memberId;
  final String? token;

  const InviteScreen({
    required this.companyId,
    required this.memberId,
    this.token,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Invite: $companyId / $memberId'));
  }
}

class LoadingScreen extends StatelessWidget {
  final String? redirectTo;

  const LoadingScreen({this.redirectTo, super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class NoPermissionsScreen extends StatelessWidget {
  const NoPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('You do not have permission to access this page.'));
  }
}

// Settings screens
class SettingsMembersScreen extends StatelessWidget {
  const SettingsMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings: Members'));
  }
}

class AddMemberScreen extends StatelessWidget {
  final String memberId;

  const AddMemberScreen({required this.memberId, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Add/Edit Member: $memberId'));
  }
}

class SettingsRolesScreen extends StatelessWidget {
  const SettingsRolesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings: Roles'));
  }
}

class SettingsLocationsScreen extends StatelessWidget {
  const SettingsLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings: Locations'));
  }
}

class SettingsTicketingScreen extends StatelessWidget {
  const SettingsTicketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings: Ticketing'));
  }
}

// Admin screens
class AdminOverviewScreen extends StatelessWidget {
  const AdminOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: Overview'));
  }
}

class AdminGapAnalysisScreen extends StatelessWidget {
  const AdminGapAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: Gap Analysis'));
  }
}

class AdminMetricsScreen extends StatelessWidget {
  const AdminMetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: Metrics'));
  }
}

class AdminWorkflowsScreen extends StatelessWidget {
  const AdminWorkflowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: Workflows'));
  }
}

class AdminDocumentProcessingScreen extends StatelessWidget {
  const AdminDocumentProcessingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: Document Processing'));
  }
}

class AdminPromptsScreen extends StatelessWidget {
  const AdminPromptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: Prompts'));
  }
}

class AdminAIGenerationsScreen extends StatelessWidget {
  const AdminAIGenerationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: AI Generations'));
  }
}

class AdminCompanyManagementScreen extends StatelessWidget {
  const AdminCompanyManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: Company Management'));
  }
}

class AdminSSODomainsScreen extends StatelessWidget {
  const AdminSSODomainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin: SSO Domains'));
  }
}
