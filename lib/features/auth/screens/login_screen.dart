import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/app_theme.dart';
import '../state/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authState = getIt<AuthState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await _authState.signInWithEmail(
      _emailController.text.trim(),
      _passwordController.text,
    );

    if (success && mounted) {
      context.goToDashboard();
    }
  }

  Future<void> _handleGoogleSignIn() async {
    final success = await _authState.signInWithGoogle();

    if (success && mounted) {
      context.goToDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo/Title
                    Text(
                      'Moat',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spacing.sm),
                    Text(
                      'Sign in to your account',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spacing.xl),

                    // Error message
                    Watch((context) {
                      final error = _authState.error;
                      if (error == null) return const SizedBox.shrink();

                      return Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.md),
                        child: Container(
                          padding: const EdgeInsets.all(Spacing.md),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: theme.colorScheme.onErrorContainer,
                              ),
                              const SizedBox(width: Spacing.sm),
                              Expanded(
                                child: Text(
                                  error,
                                  style: TextStyle(
                                    color: theme.colorScheme.onErrorContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    // Email field
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Spacing.md),

                    // Password field
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outlined),
                      ),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _handleSubmit(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Spacing.sm),

                    // Forgot password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context.goToResetPassword(),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.md),

                    // Submit button
                    Watch((context) {
                      final isLoading = _authState.isLoading;

                      return FilledButton(
                        onPressed: isLoading ? null : _handleSubmit,
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Sign In'),
                      );
                    }),
                    const SizedBox(height: Spacing.lg),

                    // Divider with "OR"
                    Row(
                      children: [
                        Expanded(child: Divider(color: theme.colorScheme.outline)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                          child: Text(
                            'OR',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: theme.colorScheme.outline)),
                      ],
                    ),
                    const SizedBox(height: Spacing.lg),

                    // Google Sign In button
                    Watch((context) {
                      final isLoading = _authState.isLoading;

                      return OutlinedButton.icon(
                        onPressed: isLoading ? null : _handleGoogleSignIn,
                        icon: Image.network(
                          'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg',
                          height: 18,
                          width: 18,
                          errorBuilder: (_, __, ___) => const Icon(Icons.g_mobiledata, size: 20),
                        ),
                        label: const Text('Sign in with Google'),
                      );
                    }),
                    const SizedBox(height: Spacing.xl),

                    // Sign up link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.goToSignUp(),
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
