import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/drawer_list_tile.dart';
import '../../../common_widgets/drawer_shell.dart';
import '../../../common_widgets/hr.dart';
import '../../../common_widgets/profile_avatar.dart';
import '../../../core/constants/app_links.dart';
import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../auth/state/auth_state.dart';

/// Profile drawer matching v0's profile functionality.
///
/// Displays:
/// - Profile section with avatar and user info
/// - Account details (editable name, password reset)
/// - Support links
/// - Legal links
/// - Logout button
class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  late final AuthState _authState;
  Widget? _editView;

  @override
  void initState() {
    super.initState();
    _authState = getIt<AuthState>();
  }

  void _showEditView(Widget child) {
    setState(() {
      _editView = child;
    });
  }

  void _hideEditView() {
    setState(() {
      _editView = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerShell(
      title: 'Profile',
      width: 400,
      scrollableBody: false,
      bodyPadding: EdgeInsets.zero,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _editView ?? _ProfileView(
          onEdit: _showEditView,
          authState: _authState,
        ),
      ),
    );
  }
}

/// Main profile view with all sections.
class _ProfileView extends StatelessWidget {
  final Function(Widget) onEdit;
  final AuthState authState;

  const _ProfileView({
    required this.onEdit,
    required this.authState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProfileSection(authState: authState),
                const Hr(),
                _AccountSection(
                  authState: authState,
                  onEdit: onEdit,
                ),
                const Hr(),
                const _SupportSection(),
                const Hr(),
                const _LegalSection(),
                const Hr(),
                DrawerListTile(
                  title: 'Logout',
                  leading: const Icon(Icons.logout, size: 20.0),
                  onTap: () async {
                    await authState.signOut();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      context.go('/login');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Profile header section with avatar and user info.
class _ProfileSection extends StatelessWidget {
  final AuthState authState;

  const _ProfileSection({required this.authState});

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final user = authState.user.value;
      final displayName = authState.displayName.value;
      final email = authState.email.value ?? '';

      return Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.spacingXL,
          horizontal: AppSizes.spacing2XL,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAvatar(
              name: displayName,
              size: 56,
            ),
            SizedBox(width: AppSizes.spacingXL),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(displayName, style: AppTextStyles.textXLSemibold),
                  SizedBox(height: AppSizes.spacingXXS),
                  Text(email, style: AppTextStyles.textMDTertiary),
                  if (user?.company.name != null) ...[
                    SizedBox(height: AppSizes.spacingXXS),
                    Text(
                      user!.company.name,
                      style: AppTextStyles.textSMSecondary,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

/// Account details section with editable fields.
class _AccountSection extends StatelessWidget {
  final AuthState authState;
  final Function(Widget) onEdit;

  const _AccountSection({
    required this.authState,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      final user = authState.user.value;
      final displayName = authState.displayName.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.spacing2XL,
              vertical: AppSizes.spacingMD,
            ),
            child: Text('Account Details', style: AppTextStyles.textLGSemibold),
          ),
          DrawerListTile(
            title: 'Full Name',
            value: displayName,
            showTrailingIcon: true,
            onTap: () {
              onEdit(_EditNameView(
                authState: authState,
                initialFirstName: user?.firstName ?? '',
                initialLastName: user?.lastName ?? '',
                onBack: () {
                  // Find the ProfileDrawer state and hide edit view
                  final profileDrawerState = context.findAncestorStateOfType<_ProfileDrawerState>();
                  profileDrawerState?._hideEditView();
                },
              ));
            },
          ),
          DrawerListTile(
            title: 'Email',
            value: user?.email ?? '',
            showTrailingIcon: false,
          ),
          DrawerListTile(
            title: 'Password',
            value: '********',
            showTrailingIcon: true,
            onTap: () => _showPasswordResetDialog(context),
          ),
        ],
      );
    });
  }

  void _showPasswordResetDialog(BuildContext context) {
    final user = authState.user.value;
    if (user == null) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Change Password', style: AppTextStyles.heading3),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: 'To change your password, an email will be sent to ',
                style: AppTextStyles.body,
                children: [
                  TextSpan(
                    text: user.email,
                    style: AppTextStyles.bodyBold,
                  ),
                  const TextSpan(
                    text: ' with a link to create a new one.',
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final success = await authState.sendPasswordResetEmail(user.email);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Password reset email sent to ${user.email}'
                          : 'Failed to send password reset email',
                    ),
                  ),
                );
              }
            },
            child: const Text('Send Email'),
          ),
        ],
      ),
    );
  }
}

/// Edit name view with form.
class _EditNameView extends StatefulWidget {
  final AuthState authState;
  final String initialFirstName;
  final String initialLastName;
  final VoidCallback onBack;

  const _EditNameView({
    required this.authState,
    required this.initialFirstName,
    required this.initialLastName,
    required this.onBack,
  });

  @override
  State<_EditNameView> createState() => _EditNameViewState();
}

class _EditNameViewState extends State<_EditNameView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.initialFirstName);
    _lastNameController = TextEditingController(text: widget.initialLastName);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final success = await widget.authState.updateProfile(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
      );

      if (success && mounted) {
        widget.onBack();
      } else if (mounted) {
        setState(() {
          _errorMessage = 'Failed to update profile';
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Back button header
        Padding(
          padding: EdgeInsets.all(AppSizes.spacingLG),
          child: Row(
            children: [
              IconButton(
                onPressed: widget.onBack,
                icon: const Icon(Icons.arrow_back, size: 20.0),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.bgSecondary,
                ),
              ),
              SizedBox(width: AppSizes.spacingMD),
              Text('Edit Name', style: AppTextStyles.textLGSemibold),
            ],
          ),
        ),
        const Hr(),
        // Form
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.spacing2XL),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'First name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSizes.spacingXL),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Last name is required';
                      }
                      return null;
                    },
                  ),
                  if (_errorMessage != null) ...[
                    SizedBox(height: AppSizes.spacingMD),
                    Text(
                      _errorMessage!,
                      style: AppTextStyles.fieldError,
                    ),
                  ],
                  const Spacer(),
                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: widget.onBack,
                          child: const Text('Cancel'),
                        ),
                      ),
                      SizedBox(width: AppSizes.spacingMD),
                      Expanded(
                        flex: 2,
                        child: FilledButton(
                          onPressed: _isLoading ? null : _handleSave,
                          child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Support section with help links.
class _SupportSection extends StatelessWidget {
  const _SupportSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacing2XL,
            vertical: AppSizes.spacingMD,
          ),
          child: Text('Support', style: AppTextStyles.textLGSemibold),
        ),
        DrawerListTile(
          leading: const Icon(Icons.thumb_up_outlined, size: 20.0),
          title: 'Help and Feedback',
          showTrailingIcon: true,
          onTap: () => launchUrl(Uri.parse(AppLinks.helpAndFeedback)),
        ),
        DrawerListTile(
          leading: const Icon(Icons.email_outlined, size: 20.0),
          title: 'Talk with Support',
          showTrailingIcon: true,
          onTap: () => launchUrl(Uri.parse(AppLinks.contactUs)),
        ),
      ],
    );
  }
}

/// Legal section with policy links.
class _LegalSection extends StatelessWidget {
  const _LegalSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacing2XL,
            vertical: AppSizes.spacingMD,
          ),
          child: Text('Legal', style: AppTextStyles.textLGSemibold),
        ),
        DrawerListTile(
          leading: const Icon(Icons.article_outlined, size: 20.0),
          title: 'Terms of Use',
          showTrailingIcon: true,
          onTap: () => launchUrl(Uri.parse(AppLinks.termsOfService)),
        ),
        DrawerListTile(
          leading: const Icon(Icons.privacy_tip_outlined, size: 20.0),
          title: 'Privacy Policy',
          showTrailingIcon: true,
          onTap: () => launchUrl(Uri.parse(AppLinks.privacyPolicy)),
        ),
      ],
    );
  }
}
