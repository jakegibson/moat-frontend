import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ticket_detail_drawer.dart';
import 'ticket_list_screen.dart';

/// A page that displays the ticket list with a specific ticket's drawer open.
/// This allows for direct URL navigation to a ticket while maintaining the
/// drawer UX pattern (like V0).
class TicketDetailPage extends StatefulWidget {
  final String externalId;

  const TicketDetailPage({required this.externalId, super.key});

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  bool _drawerOpened = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Open the drawer after the first frame renders
    if (!_drawerOpened) {
      _drawerOpened = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openDrawer();
      });
    }
  }

  void _openDrawer() {
    TicketDetailDrawer.show(context, widget.externalId).then((result) {
      // When drawer closes, navigate back to ticket list URL
      if (mounted) {
        context.go('/tickets/list');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show the ticket list screen - the drawer will open on top of it
    return const TicketListScreen();
  }
}
