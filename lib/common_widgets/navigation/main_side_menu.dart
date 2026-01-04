import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import '../../core/di/injection.dart';
import '../../core/routing/routes.dart';
import '../../core/styles/app_sizes.dart';
import '../../features/notifications/state/notification_state.dart';
import '../../features/notifications/widgets/notification_drawer.dart';
import '../profile_avatar.dart';
import 'button_admin.dart';
import 'button_assets.dart';
import 'button_explore.dart';
import 'button_notifications.dart';
import 'button_reports.dart';
import 'button_reports2.dart';
import 'button_settings.dart';
import 'button_tickets.dart';

class MainSideMenu extends StatefulWidget {
  const MainSideMenu({super.key});

  @override
  State<MainSideMenu> createState() => _MainSideMenuState();
}

class _MainSideMenuState extends State<MainSideMenu> {
  String selectedRoute = '';
  late final NotificationState _notificationState;

  @override
  void initState() {
    super.initState();
    _notificationState = getIt<NotificationState>();
    // Fetch unread count on init
    _notificationState.fetchUnreadCount();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedRoute = GoRouterState.of(context).matchedLocation;
  }

  void _openNotificationDrawer() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Notifications',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            child: NotificationDrawer(),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.spacingMD),
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
      width: 68,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Moat Logo
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/branding/moat-bug.svg',
                  width: 32.0,
                ),
              ),
              SizedBox(height: AppSizes.radiusXL),

              // Assets Button
              ButtonAssets(
                selected: selectedRoute == '/' ||
                    selectedRoute.contains('/assets'),
                onTap: () {
                  setState(() {
                    selectedRoute = Routes.assetsList;
                  });
                  context.go(Routes.assetsList);
                },
              ),
              SizedBox(height: AppSizes.radiusXL),

              // Tickets Button
              ButtonTickets(
                selected: selectedRoute.contains('/tickets'),
                onTap: () {
                  setState(() {
                    selectedRoute = Routes.ticketsList;
                  });
                  context.go(Routes.ticketsList);
                },
              ),
              SizedBox(height: AppSizes.radiusXL),

              // Activity/Notifications Button
              Watch((context) {
                final unreadCount = _notificationState.unreadCount.value;
                return ButtonNotifications(
                  selected: false,
                  unreadCount: unreadCount,
                  onTap: _openNotificationDrawer,
                );
              }),
              SizedBox(height: AppSizes.radiusXL),

              // Reports Button
              ButtonReports(
                selected: selectedRoute.contains('/reports') &&
                    !selectedRoute.contains('/reports2'),
                onTap: () {
                  setState(() {
                    selectedRoute = Routes.reportsDashboard;
                  });
                  context.go(Routes.reportsDashboard);
                },
              ),
              SizedBox(height: AppSizes.radiusXL),

              // Reports 2 Button (fl_chart)
              ButtonReports2(
                selected: selectedRoute.contains('/reports2'),
                onTap: () {
                  setState(() {
                    selectedRoute = Routes.reports2Dashboard;
                  });
                  context.go(Routes.reports2Dashboard);
                },
              ),
              SizedBox(height: AppSizes.radiusXL),

              // Explore Button (self-service analytics)
              ButtonExplore(
                selected: selectedRoute.contains('/explore'),
                onTap: () {
                  setState(() {
                    selectedRoute = Routes.exploreBuilder;
                  });
                  context.go(Routes.exploreBuilder);
                },
              ),
              SizedBox(height: AppSizes.radiusXL),

              // Settings Button
              ButtonSettings(
                selected: selectedRoute.contains('/settings'),
                onTap: () {
                  setState(() {
                    selectedRoute = Routes.settingsMembers;
                  });
                  context.go(Routes.settingsMembers);
                },
              ),
              SizedBox(height: AppSizes.radiusXL),

              // Admin Button
              ButtonAdmin(
                selected: selectedRoute.contains('/admin'),
                onTap: () {
                  setState(() {
                    selectedRoute = Routes.adminOverview;
                  });
                  context.go(Routes.adminOverview);
                },
              ),
            ],
          ),
          const Spacer(),
          // Profile Button
          ProfileAvatar(
            name: 'User',
            size: 40,
            onTap: () {
              // TODO: Open profile drawer
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile coming soon')),
              );
            },
          ),
        ],
      ),
    );
  }
}
