import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/task_models.dart';

/// A section for displaying and managing task attachments.
class AttachmentSection extends StatelessWidget {
  final List<TaskAttachment> attachments;
  final bool isLoading;
  final VoidCallback? onAddAttachment;
  final void Function(TaskAttachment)? onDeleteAttachment;
  final void Function(TaskAttachment)? onViewAttachment;

  const AttachmentSection({
    super.key,
    required this.attachments,
    this.isLoading = false,
    this.onAddAttachment,
    this.onDeleteAttachment,
    this.onViewAttachment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Attachments',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (onAddAttachment != null)
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onAddAttachment,
                tooltip: 'Add attachment',
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          )
        else if (attachments.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_file,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'No attachments',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: attachments.map((att) {
              return _AttachmentChip(
                attachment: att,
                onTap: onViewAttachment != null
                    ? () => onViewAttachment!(att)
                    : null,
                onDelete: onDeleteAttachment != null
                    ? () => onDeleteAttachment!(att)
                    : null,
              );
            }).toList(),
          ),
      ],
    );
  }
}

class _AttachmentChip extends StatelessWidget {
  final TaskAttachment attachment;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const _AttachmentChip({
    required this.attachment,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                attachment.fileIcon,
                size: 20,
                color: _getIconColor(theme),
              ),
              const SizedBox(width: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      attachment.fileName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      attachment.formattedSize,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (onDelete != null) ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: onDelete,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getIconColor(ThemeData theme) {
    if (attachment.isImage) return Colors.blue;
    if (attachment.isPdf) return Colors.red;
    if (attachment.contentType.contains('word')) return Colors.indigo;
    if (attachment.contentType.contains('excel')) return Colors.green;
    return theme.colorScheme.primary;
  }
}

/// A button for adding attachments with file picker integration.
class AddAttachmentButton extends StatelessWidget {
  final void Function(PlatformFile file)? onFilePicked;
  final bool isLoading;

  const AddAttachmentButton({
    super.key,
    this.onFilePicked,
    this.isLoading = false,
  });

  Future<void> _pickFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        onFilePicked?.call(result.files.first);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick file: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: isLoading ? null : () => _pickFile(context),
      icon: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.attach_file),
      label: Text(isLoading ? 'Uploading...' : 'Add Attachment'),
    );
  }
}
