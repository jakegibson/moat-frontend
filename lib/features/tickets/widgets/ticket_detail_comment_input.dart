import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show FileUploadInputElement, FileReader, document;

import 'package:flutter/material.dart';

import '../../../common_widgets/attachment_upload_widget.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../state/task_detail_state.dart';

/// Comment input section at the bottom of the activity tab
class TicketDetailCommentInput extends StatefulWidget {
  final String taskId;
  final bool isLoading;
  final Future<void> Function(String content, List<String>? attachmentIds) onSubmit;
  final TaskDetailState state;

  const TicketDetailCommentInput({
    super.key,
    required this.taskId,
    required this.isLoading,
    required this.onSubmit,
    required this.state,
  });

  @override
  State<TicketDetailCommentInput> createState() => _TicketDetailCommentInputState();
}

class _TicketDetailCommentInputState extends State<TicketDetailCommentInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final List<AttachmentUploadState> _pendingAttachments = [];
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  /// Handle image picker - uses HTML5 file input for web
  void _handleImagePicker() {
    final input = html.FileUploadInputElement()
      ..accept = 'image/jpeg,image/png,image/gif,image/webp,image/heic,image/heif,application/pdf'
      ..multiple = false
      ..style.display = 'none';

    input.onChange.listen((e) async {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        final file = files.first;
        try {
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);
          await reader.onLoadEnd.first;

          if (reader.result != null) {
            final bytes = reader.result as Uint8List;
            final fileName = file.name;
            final extension = _getFileExtension(fileName);
            final mimeType = _getMimeTypeFromExtension(extension);

            _addFileToUpload(
              bytes: bytes,
              fileName: fileName,
              mimeType: mimeType,
            );
          }
        } catch (e) {
          _showErrorSnackBar('Error reading file: $e');
        }
      }
      input.remove();
    });

    html.document.body!.append(input);
    input.click();
  }

  String _getFileExtension(String fileName) {
    final parts = fileName.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  String _getMimeTypeFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      case 'heic':
      case 'heif':
        return 'image/heic';
      case 'pdf':
        return 'application/pdf';
      default:
        return 'application/octet-stream';
    }
  }

  void _addFileToUpload({
    required Uint8List bytes,
    required String fileName,
    required String mimeType,
  }) {
    // Validate file size (max 10MB)
    const maxSize = 10 * 1024 * 1024;
    if (bytes.length > maxSize) {
      _showErrorSnackBar('File too large (max 10MB)');
      return;
    }

    // Validate file type
    const supportedTypes = [
      'image/jpeg',
      'image/png',
      'image/gif',
      'image/webp',
      'image/heic',
      'application/pdf',
    ];
    if (!supportedTypes.contains(mimeType)) {
      _showErrorSnackBar('Unsupported file type. Supported: JPEG, PNG, GIF, WebP, HEIC, PDF');
      return;
    }

    final localId = '${DateTime.now().millisecondsSinceEpoch}_${fileName.hashCode}';
    final uploadState = AttachmentUploadState(
      localId: localId,
      fileName: fileName,
      bytes: bytes,
      mimeType: mimeType,
      sizeBytes: bytes.length,
      status: UploadStatus.pending,
    );

    setState(() {
      _pendingAttachments.add(uploadState);
    });
  }

  void _removeAttachment(String localId) {
    setState(() {
      _pendingAttachments.removeWhere((a) => a.localId == localId);
    });
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _handleSubmit() async {
    final content = _controller.text.trim();
    if (content.isEmpty && _pendingAttachments.isEmpty) return;
    if (widget.isLoading || _isUploading) return;

    setState(() => _isUploading = true);

    try {
      // Upload all pending attachments first
      final attachmentIds = <String>[];
      for (var i = 0; i < _pendingAttachments.length; i++) {
        final attachment = _pendingAttachments[i];
        if (attachment.status == UploadStatus.pending) {
          // Update status to uploading
          setState(() {
            _pendingAttachments[i] = attachment.copyWith(status: UploadStatus.uploading);
          });

          // Upload via state
          final result = await widget.state.uploadAttachment(
            taskId: widget.taskId,
            fileName: attachment.fileName,
            contentType: attachment.mimeType,
            sizeBytes: attachment.sizeBytes,
            bytes: attachment.bytes.toList(),
          );

          result.when(
            ok: (uploaded) {
              setState(() {
                _pendingAttachments[i] = attachment.copyWith(
                  status: UploadStatus.completed,
                  uploadedAttachmentId: uploaded.id,
                );
              });
              attachmentIds.add(uploaded.id);
            },
            error: (e) {
              setState(() {
                _pendingAttachments[i] = attachment.copyWith(
                  status: UploadStatus.failed,
                  errorMessage: e.message,
                );
              });
            },
          );
        } else if (attachment.status == UploadStatus.completed &&
            attachment.uploadedAttachmentId != null) {
          attachmentIds.add(attachment.uploadedAttachmentId!);
        }
      }

      // Check for failed uploads
      final failedUploads = _pendingAttachments.where((a) => a.status == UploadStatus.failed);
      if (failedUploads.isNotEmpty) {
        _showErrorSnackBar('Some attachments failed to upload. Please retry or remove them.');
        return;
      }

      // Submit comment with attachment IDs
      await widget.onSubmit(content, attachmentIds.isNotEmpty ? attachmentIds : null);

      // Clear on success
      _controller.clear();
      setState(() {
        _pendingAttachments.clear();
      });
      _focusNode.requestFocus();
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isProcessing = widget.isLoading || _isUploading;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Attachment preview section (above input)
        if (_pendingAttachments.isNotEmpty)
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(color: AppColors.borderSecondary),
              ),
            ),
            child: Column(
              children: _pendingAttachments.map((attachment) {
                return PendingAttachmentThumbnail(
                  upload: attachment,
                  onRetry: () {
                    final index = _pendingAttachments.indexWhere((a) => a.localId == attachment.localId);
                    if (index != -1) {
                      setState(() {
                        _pendingAttachments[index] = attachment.copyWith(
                          status: UploadStatus.pending,
                          errorMessage: null,
                        );
                      });
                    }
                  },
                  onDelete: () => _removeAttachment(attachment.localId),
                );
              }).toList(),
            ),
          ),
        // Input field
        Container(
          padding: const EdgeInsets.all(AppSizes.spacingXL),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: _pendingAttachments.isEmpty
                ? const Border(top: BorderSide(color: AppColors.borderSecondary))
                : null,
          ),
          child: SafeArea(
            top: false,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Text input - no border
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    maxLines: null,
                    enabled: !isProcessing,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _handleSubmit(),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Write a message...',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: AppColors.textTertiary,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.spacingXS),
                // Image picker button
                InkWell(
                  onTap: isProcessing ? null : _handleImagePicker,
                  borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.spacingMD),
                    child: Icon(
                      Icons.image_outlined,
                      size: 24,
                      color: isProcessing ? AppColors.borderSecondary : AppColors.textTertiary,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.spacingXS),
                // Send button - circular with arrow-up icon
                GestureDetector(
                  onTap: isProcessing ? null : _handleSubmit,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.textPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: isProcessing
                        ? const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.white,
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: AppColors.textWhite,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Pending attachment thumbnail for the comment input
class PendingAttachmentThumbnail extends StatelessWidget {
  final AttachmentUploadState upload;
  final VoidCallback onRetry;
  final VoidCallback onDelete;

  const PendingAttachmentThumbnail({
    super.key,
    required this.upload,
    required this.onRetry,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isFailed = upload.status == UploadStatus.failed;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(AppSizes.spacingLG),
      decoration: BoxDecoration(
        border: Border.all(
          color: isFailed ? Colors.red.shade300 : AppColors.borderPrimary,
          width: isFailed ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Status icon
              _buildStatusIcon(),
              SizedBox(width: AppSizes.spacingLG),
              // File info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      upload.fileName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSizes.spacingXS),
                    Text(
                      _buildMetadataText(),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
              // Delete button
              SizedBox(width: AppSizes.spacingLG),
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
          // Progress bar (only for uploading)
          if (upload.status == UploadStatus.uploading) ...[
            SizedBox(height: AppSizes.spacingMD),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              child: const LinearProgressIndicator(
                backgroundColor: AppColors.bgSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.textPrimary),
                minHeight: 4,
              ),
            ),
          ],
          // Error message and retry link
          if (isFailed && upload.errorMessage != null) ...[
            SizedBox(height: AppSizes.spacingMD),
            Row(
              children: [
                const SizedBox(width: 68),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        upload.errorMessage!,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Colors.red.shade700,
                        ),
                      ),
                      SizedBox(height: AppSizes.spacingXS),
                      GestureDetector(
                        onTap: onRetry,
                        child: const Text(
                          'Try again',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _buildMetadataText() {
    final size = _formatFileSize(upload.sizeBytes);
    if (upload.status == UploadStatus.uploading) {
      return '$size • uploading...';
    } else if (upload.status == UploadStatus.completed) {
      return '$size • 100%';
    }
    return size;
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Widget _buildStatusIcon() {
    switch (upload.status) {
      case UploadStatus.pending:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.accentBlueLight,
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          ),
          child: upload.mimeType == 'application/pdf'
              ? const Icon(Icons.picture_as_pdf, color: AppColors.accentBlue, size: 28)
              : const Icon(Icons.image, color: AppColors.accentBlue, size: 28),
        );
      case UploadStatus.uploading:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.accentBlueLight,
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          ),
          child: const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentBlue),
              ),
            ),
          ),
        );
      case UploadStatus.completed:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.utilityGreen50,
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          ),
          child: const Icon(Icons.check_circle, color: AppColors.utilityGreen700, size: 28),
        );
      case UploadStatus.failed:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.utilityError50,
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
          ),
          child: const Icon(Icons.error_outline, color: AppColors.utilityError700, size: 28),
        );
    }
  }
}
