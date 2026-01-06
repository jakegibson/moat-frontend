import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../../core/styles/app_colors.dart';
import '../data/task_models.dart';

/// A section for displaying task photos in a horizontal thumbnail grid.
/// Matches the Figma design for ticket detail view.
class PhotosSection extends StatelessWidget {
  final List<TaskAttachment> attachments;
  final bool isLoading;
  final VoidCallback? onAddPhoto;
  final void Function(TaskAttachment)? onViewPhoto;
  final void Function(TaskAttachment)? onDeletePhoto;

  const PhotosSection({
    super.key,
    required this.attachments,
    this.isLoading = false,
    this.onAddPhoto,
    this.onViewPhoto,
    this.onDeletePhoto,
  });

  List<TaskAttachment> get _photos =>
      attachments.where((a) => a.isImage).toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Photos',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        if (isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          )
        else
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ..._photos.map((photo) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _PhotoThumbnail(
                        attachment: photo,
                        onTap: onViewPhoto != null
                            ? () => onViewPhoto!(photo)
                            : null,
                        onDelete: onDeletePhoto != null
                            ? () => onDeletePhoto!(photo)
                            : null,
                      ),
                    )),
                if (onAddPhoto != null)
                  _AddPhotoButton(onTap: onAddPhoto!),
              ],
            ),
          ),
      ],
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  final TaskAttachment attachment;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const _PhotoThumbnail({
    required this.attachment,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              attachment.url,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.broken_image,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              },
            ),
          ),
          if (onDelete != null)
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: onDelete,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.black.withAlpha(138),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 12,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AddPhotoButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddPhotoButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
            style: BorderStyle.solid,
          ),
        ),
        child: Icon(
          Icons.add_a_photo_outlined,
          color: theme.colorScheme.onSurfaceVariant,
          size: 24,
        ),
      ),
    );
  }
}

/// Utility for picking photos
class PhotoPicker {
  static Future<PlatformFile?> pickPhoto() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.first;
      }
    } catch (_) {}
    return null;
  }
}
