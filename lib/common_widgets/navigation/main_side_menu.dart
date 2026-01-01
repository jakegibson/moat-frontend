import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/routes.dart';
import '../../core/styles/app_sizes.dart';
import '../profile_avatar.dart';
import 'button_admin.dart';
import 'button_assets.dart';
import 'button_notifications.dart';
import 'button_settings.dart';
import 'button_tickets.dart';

class MainSideMenu extends StatefulWidget {
  const MainSideMenu({super.key});

  @override
  State<MainSideMenu> createState() => _MainSideMenuState();
}

class _MainSideMenuState extends State<MainSideMenu> {
  String selectedRoute = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedRoute = GoRouterState.of(context).matchedLocation;
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

              // Notifications Button
              ButtonNotifications(
                selected: false,
                unreadCount: 0,
                onTap: () {
                  // TODO: Open notifications drawer
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications coming soon')),
                  );
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
