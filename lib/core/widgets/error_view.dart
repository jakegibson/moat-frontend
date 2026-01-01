import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/app_error.dart';

/// Displays an error with optional retry action.
///
/// Automatically selects appropriate icon based on error type.
class ErrorView extends StatelessWidget {
  final AppError error;
  final VoidCallback? onRetry;
  final String? retryLabel;

  const ErrorView({
    required this.error,
    this.onRetry,
    this.retryLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _iconForError(error),
              size: 48,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: Spacing.md),
            Text(
              _titleForError(error),
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              error.message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: Spacing.lg),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(retryLabel ?? 'Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _iconForError(AppError error) => switch (error) {
        NetworkError() => Icons.wifi_off,
        AuthError() => Icons.lock_outline,
        NotFoundError() => Icons.search_off,
        PermissionError() => Icons.block,
        ValidationError() => Icons.error_outline,
        ConflictError() => Icons.content_copy,
        RateLimitError() => Icons.hourglass_empty,
        UnknownError() => Icons.warning_amber,
      };

  String _titleForError(AppError error) => switch (error) {
        NetworkError() => 'Connection Error',
        AuthError() => 'Authentication Required',
        NotFoundError() => 'Not Found',
        PermissionError() => 'Access Denied',
        ValidationError() => 'Invalid Input',
        ConflictError() => 'Conflict',
        RateLimitError() => 'Too Many Requests',
        UnknownError() => 'Something Went Wrong',
      };
}

/// Inline error message for form fields
class ErrorText extends StatelessWidget {
  final String message;

  const ErrorText(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: Spacing.xs),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            size: 16,
            color: theme.colorScheme.error,
          ),
          const SizedBox(width: Spacing.xs),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
