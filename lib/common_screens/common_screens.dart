import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/routing/routes.dart';
import '../core/styles/app_colors.dart';
import '../core/styles/semantic_tokens.dart';
import '../core/theme/app_theme.dart';

// AlertsScreen is now implemented in lib/features/assets/screens/alerts_screen.dart

/// Invite acceptance screen.
///
/// Handles the flow for accepting or declining an organization invite.
class InviteScreen extends StatefulWidget {
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
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  bool _isLoading = true;
  bool _isAccepting = false;
  String? _error;
  _InviteDetails? _inviteDetails;

  @override
  void initState() {
    super.initState();
    _validateInvite();
  }

  Future<void> _validateInvite() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    // Simulate API call to validate invite token
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock validation - in production, this would call the backend
    if (widget.token == null || widget.token!.isEmpty) {
      setState(() {
        _isLoading = false;
        _error = 'Invalid or missing invitation token.';
      });
      return;
    }

    // Mock invite details - would come from backend
    setState(() {
      _isLoading = false;
      _inviteDetails = _InviteDetails(
        companyName: 'Acme Corporation',
        inviterName: 'Jake Admin',
        inviterEmail: 'jake@acme.com',
        role: 'Technician',
        expiresAt: DateTime.now().add(const Duration(days: 7)),
      );
    });
  }

  Future<void> _acceptInvite() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Not logged in - redirect to sign up with return URL
      context.go('${Routes.signUp}?returnTo=/invite/${widget.companyId}/${widget.memberId}?token=${widget.token}');
      return;
    }

    setState(() => _isAccepting = true);

    // Simulate API call to accept invite
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    // Mock success - redirect to dashboard
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Welcome to ${_inviteDetails?.companyName ?? 'the organization'}!'),
        backgroundColor: SemanticColors.success,
      ),
    );

    context.go(Routes.dashboard);
  }

  Future<void> _declineInvite() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Decline Invitation?'),
        content: const Text(
          'Are you sure you want to decline this invitation? '
          'You will need a new invitation to join this organization.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: SemanticColors.error),
            child: const Text('Decline'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Simulate decline API call
    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invitation declined.')),
    );

    context.go(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Padding(
              padding: const EdgeInsets.all(Spacing.lg),
              child: _buildContent(theme),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: Spacing.lg),
          Text(
            'Validating invitation...',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      );
    }

    if (_error != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(Spacing.lg),
            decoration: BoxDecoration(
              color: SemanticColors.errorBg,
              borderRadius: BorderRadius.circular(SemanticRadius.card),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: SemanticColors.error,
                ),
                const SizedBox(height: Spacing.md),
                Text(
                  'Invalid Invitation',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  _error!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: Spacing.lg),
          OutlinedButton(
            onPressed: () => context.go(Routes.login),
            child: const Text('Go to Login'),
          ),
        ],
      );
    }

    final details = _inviteDetails!;
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo/Header
        Text(
          'Moat',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Spacing.xl),

        // Invitation Card
        Container(
          padding: const EdgeInsets.all(Spacing.lg),
          decoration: BoxDecoration(
            color: SemanticColors.bgCard,
            borderRadius: BorderRadius.circular(SemanticRadius.card),
            border: Border.all(color: SemanticColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withAlpha(10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Invite icon
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: SemanticColors.infoBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.mail_outline,
                  size: 32,
                  color: SemanticColors.info,
                ),
              ),
              const SizedBox(height: Spacing.lg),

              // Title
              Text(
                "You've been invited!",
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.sm),

              // Description
              Text(
                '${details.inviterName} has invited you to join',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.xs),

              // Company name
              Text(
                details.companyName,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: SemanticColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.lg),

              // Details grid
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: SemanticColors.bgSecondary,
                  borderRadius: BorderRadius.circular(SemanticRadius.normal),
                ),
                child: Column(
                  children: [
                    _DetailRow(
                      icon: Icons.person_outline,
                      label: 'Invited by',
                      value: details.inviterEmail,
                    ),
                    const Divider(height: Spacing.lg),
                    _DetailRow(
                      icon: Icons.badge_outlined,
                      label: 'Role',
                      value: details.role,
                    ),
                    const Divider(height: Spacing.lg),
                    _DetailRow(
                      icon: Icons.schedule,
                      label: 'Expires',
                      value: _formatExpiry(details.expiresAt),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Spacing.lg),

        // Login notice (if not logged in)
        if (!isLoggedIn) ...[
          Container(
            padding: const EdgeInsets.all(Spacing.md),
            decoration: BoxDecoration(
              color: SemanticColors.warningBg,
              borderRadius: BorderRadius.circular(SemanticRadius.normal),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: SemanticColors.warning, size: 20),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: Text(
                    'You will need to create an account or sign in to accept this invitation.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: SemanticColors.warning,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Spacing.lg),
        ],

        // Action buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _isAccepting ? null : _declineInvite,
                child: const Text('Decline'),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Expanded(
              flex: 2,
              child: FilledButton(
                onPressed: _isAccepting ? null : _acceptInvite,
                child: _isAccepting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.white,
                        ),
                      )
                    : Text(isLoggedIn ? 'Accept Invitation' : 'Continue'),
              ),
            ),
          ],
        ),

        // Already have account link (if not logged in)
        if (!isLoggedIn) ...[
          const SizedBox(height: Spacing.md),
          TextButton(
            onPressed: () => context.go(
              '${Routes.login}?returnTo=/invite/${widget.companyId}/${widget.memberId}?token=${widget.token}',
            ),
            child: const Text('Already have an account? Sign in'),
          ),
        ],
      ],
    );
  }

  String _formatExpiry(DateTime date) {
    final now = DateTime.now();
    final diff = date.difference(now);
    if (diff.inDays > 1) {
      return 'in ${diff.inDays} days';
    } else if (diff.inHours > 1) {
      return 'in ${diff.inHours} hours';
    } else {
      return 'soon';
    }
  }
}

/// Internal model for invite details.
class _InviteDetails {
  final String companyName;
  final String inviterName;
  final String inviterEmail;
  final String role;
  final DateTime expiresAt;

  const _InviteDetails({
    required this.companyName,
    required this.inviterName,
    required this.inviterEmail,
    required this.role,
    required this.expiresAt,
  });
}

/// Detail row widget for invite details.
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 18, color: SemanticColors.textSecondary),
        const SizedBox(width: Spacing.sm),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: SemanticColors.textSecondary,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

/// Loading screen shown during auth state resolution.
class LoadingScreen extends StatelessWidget {
  final String? redirectTo;

  const LoadingScreen({this.redirectTo, super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/// No permissions screen shown when user lacks access.
class NoPermissionsScreen extends StatelessWidget {
  const NoPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('You do not have permission to access this page.'),
    );
  }
}
