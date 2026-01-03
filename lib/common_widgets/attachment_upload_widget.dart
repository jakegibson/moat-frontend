import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Conditional import for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html if (dart.library.io) 'attachment_upload_widget_stub.dart';

/// Attachment upload state model
enum UploadStatus { pending, uploading, completed, failed }

class AttachmentUploadState {
  final String localId;
  final String fileName;
  final Uint8List bytes;
  final String mimeType;
  final int sizeBytes;
  final UploadStatus status;
  final double progress;
  final String? uploadedAttachmentId;
  final String? errorMessage;

  AttachmentUploadState({
    required this.localId,
    required this.fileName,
    required this.bytes,
    required this.mimeType,
    required this.sizeBytes,
    this.status = UploadStatus.pending,
    this.progress = 0.0,
    this.uploadedAttachmentId,
    this.errorMessage,
  });

  AttachmentUploadState copyWith({
    UploadStatus? status,
    double? progress,
    String? uploadedAttachmentId,
    String? errorMessage,
  }) {
    return AttachmentUploadState(
      localId: localId,
      fileName: fileName,
      bytes: bytes,
      mimeType: mimeType,
      sizeBytes: sizeBytes,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      uploadedAttachmentId: uploadedAttachmentId ?? this.uploadedAttachmentId,
      errorMessage: errorMessage,
    );
  }
}

/// Design colors matching v0
class _Colors {
  static const Color bgPrimary = Color(0xFFFFFFFF);
  static const Color bgSecondary = Color(0xFFF1F0EE);
  static const Color borderPrimary = Color(0xFFD3D1CF);
  static const Color textPrimary = Color(0xFF161616);
  static const Color textTertiary = Color(0xFF848281);
  static const Color fgTertiary = Color(0xFF848281);
  static const Color primary = Color(0xFF161616);
}

/// A widget for uploading attachments with visual feedback.
/// Matches v0's AttachmentUploadWidget behavior.
class AttachmentUploadWidget extends StatefulWidget {
  const AttachmentUploadWidget({
    super.key,
    this.taskId,
    this.onAttachmentsChanged,
    this.maxFiles = 10,
    this.enabled = true,
  });

  final String? taskId;
  final void Function(List<AttachmentUploadState>)? onAttachmentsChanged;
  final int maxFiles;
  final bool enabled;

  @override
  State<AttachmentUploadWidget> createState() => _AttachmentUploadWidgetState();
}

class _AttachmentUploadWidgetState extends State<AttachmentUploadWidget> {
  final List<AttachmentUploadState> _uploads = [];

  void _notifyParent() {
    widget.onAttachmentsChanged?.call(_uploads);
  }

  /// Web-specific file picker using HTML FileUploadInputElement
  /// This is more reliable than file_picker on web
  void _pickFilesWeb() {
    final input = html.FileUploadInputElement()
      ..accept = 'image/jpeg,image/png,image/gif,image/webp,image/heic,image/heif,application/pdf'
      ..multiple = true
      ..style.display = 'none';

    input.onChange.listen((e) async {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        int validFileCount = 0;

        for (final file in files) {
          // Check file limit
          if (_uploads.length >= widget.maxFiles) {
            _showError('Maximum ${widget.maxFiles} files allowed');
            break;
          }

          try {
            final reader = html.FileReader();
            reader.readAsArrayBuffer(file);

            await reader.onLoadEnd.first;

            if (reader.result != null) {
              final bytes = reader.result as Uint8List;
              final fileName = file.name;
              final extension = _getFileExtension(fileName);
              final mimeType = _getMimeTypeFromExtension(extension);

              // Validate and add file
              _addFileToUpload(fileName, bytes, mimeType);
              validFileCount++;
            }
          } catch (e) {
            debugPrint('Error reading file ${file.name}: $e');
          }
        }

        if (validFileCount == 0 && mounted) {
          _showError('No valid image files selected');
        }
      }

      input.remove();
    });

    html.document.body!.append(input);
    input.click();
  }

  Future<void> _pickFiles() async {
    // Check file limit
    if (_uploads.length >= widget.maxFiles) {
      _showError('Maximum ${widget.maxFiles} files allowed');
      return;
    }

    if (kIsWeb) {
      // Use HTML file input on web for better reliability
      _pickFilesWeb();
      return;
    }

    // Use file_picker on mobile/desktop platforms
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'heic', 'heif', 'pdf'],
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        _processPickedFiles(result.files);
      }
    } catch (e) {
      debugPrint('File picker error: $e');
      _showError('Error selecting files: $e');
    }
  }

  void _processPickedFiles(List<PlatformFile> files) {
    int validFileCount = 0;

    for (var file in files) {
      if (_uploads.length >= widget.maxFiles) {
        _showError('Maximum ${widget.maxFiles} files allowed');
        break;
      }

      if (file.bytes != null) {
        final mimeType = _getMimeTypeFromExtension(file.extension ?? '');
        _addFileToUpload(file.name, file.bytes!, mimeType);
        validFileCount++;
      } else {
        debugPrint('Warning: File picker returned null bytes for ${file.name}');
      }
    }

    // Show error if no valid files were processed
    if (validFileCount == 0 && files.isNotEmpty) {
      _showError('Failed to load selected files');
    }
  }

  void _addFileToUpload(String fileName, Uint8List bytes, String mimeType) {
    // Validate file
    final validation = _validateFileForUpload(fileName, bytes.length, mimeType);
    if (!validation.isValid) {
      _showError(validation.errorMessage!);
      return;
    }

    final localId = '${DateTime.now().millisecondsSinceEpoch}_${fileName.hashCode}';
    final upload = AttachmentUploadState(
      localId: localId,
      fileName: fileName,
      bytes: bytes,
      mimeType: mimeType,
      sizeBytes: bytes.length,
      status: UploadStatus.pending,
    );

    setState(() {
      _uploads.add(upload);
    });
    _notifyParent();
  }

  void _retryUpload(AttachmentUploadState upload) {
    final index = _uploads.indexWhere((u) => u.localId == upload.localId);
    if (index != -1) {
      setState(() {
        _uploads[index] = upload.copyWith(
          status: UploadStatus.pending,
          errorMessage: null,
          progress: 0.0,
        );
      });
      _notifyParent();
    }
  }

  void _deleteUpload(AttachmentUploadState upload) {
    setState(() {
      _uploads.removeWhere((u) => u.localId == upload.localId);
    });
    _notifyParent();
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _getFileExtension(String fileName) {
    final lastDot = fileName.lastIndexOf('.');
    if (lastDot != -1 && lastDot < fileName.length - 1) {
      return fileName.substring(lastDot + 1).toLowerCase();
    }
    return '';
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

  _FileValidation _validateFileForUpload(String fileName, int sizeBytes, String mimeType) {
    // Check file size (max 10MB)
    const maxSize = 10 * 1024 * 1024;
    if (sizeBytes > maxSize) {
      return _FileValidation(isValid: false, errorMessage: 'File too large (max 10MB)');
    }

    // Check supported types
    const supportedTypes = [
      'image/jpeg',
      'image/png',
      'image/gif',
      'image/webp',
      'image/heic',
      'application/pdf',
    ];
    if (!supportedTypes.contains(mimeType)) {
      return _FileValidation(isValid: false, errorMessage: 'Unsupported file type');
    }

    return _FileValidation(isValid: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upload area - always visible
        GestureDetector(
          onTap: widget.enabled ? _pickFiles : null,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _Colors.bgSecondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 32,
                    color: _Colors.fgTertiary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add a photo or video',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: _Colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Uploads list below the upload box
        if (_uploads.isNotEmpty) ...[
          const SizedBox(height: 12),
          ..._uploads.map((upload) => _AttachmentThumbnail(
                upload: upload,
                onRetry: () => _retryUpload(upload),
                onDelete: () => _deleteUpload(upload),
              )),
        ],
      ],
    );
  }
}

class _FileValidation {
  final bool isValid;
  final String? errorMessage;

  _FileValidation({required this.isValid, this.errorMessage});
}

/// Attachment thumbnail with visual feedback for upload status.
/// Matches v0's AttachmentThumbnail design.
class _AttachmentThumbnail extends StatelessWidget {
  const _AttachmentThumbnail({
    required this.upload,
    required this.onRetry,
    required this.onDelete,
  });

  final AttachmentUploadState upload;
  final VoidCallback onRetry;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final isFailed = upload.status == UploadStatus.failed;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isFailed ? Colors.red.shade300 : _Colors.borderPrimary,
          width: isFailed ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: _Colors.bgPrimary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Status icon
              _buildStatusIcon(),
              const SizedBox(width: 12),

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
                        color: _Colors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _buildMetadataText(),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: _Colors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),

              // Delete button
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onDelete,
                child: SvgPicture.asset(
                  'assets/icons/icon-trash.svg',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),

          // Progress bar (only for uploading)
          if (upload.status == UploadStatus.uploading) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: upload.progress,
                backgroundColor: _Colors.bgSecondary,
                valueColor: const AlwaysStoppedAnimation<Color>(_Colors.primary),
                minHeight: 4,
              ),
            ),
          ],

          // Error message and retry link
          if (isFailed && upload.errorMessage != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 68), // Align with file name
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
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: onRetry,
                        child: Text(
                          'Try again',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _Colors.primary,
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
      final percentage = (upload.progress * 100).toInt();
      return '$size • $percentage%';
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
            color: const Color(0xFFEFF6FF), // Light blue background
            borderRadius: BorderRadius.circular(8),
          ),
          child: upload.mimeType == 'application/pdf'
              ? Icon(
                  Icons.picture_as_pdf,
                  color: const Color(0xFF2563EB), // Blue-600
                  size: 28,
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/icon-img.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
        );
      case UploadStatus.uploading:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF), // Light blue background
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF2563EB), // Blue-600
                ),
              ),
            ),
          ),
        );
      case UploadStatus.completed:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.check_circle,
            color: Colors.green.shade700,
            size: 28,
          ),
        );
      case UploadStatus.failed:
        return Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.error_outline,
            color: Colors.red.shade700,
            size: 28,
          ),
        );
    }
  }
}
