import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/assets_client.dart';
import '../data/assets_models.dart';
import 'pdf_page_navigation.dart';
import 'pdf_page_zoom.dart';
import 'pdf_viewer.dart';

/// Document viewer widget for displaying asset PDFs.
///
/// Features:
/// - Multi-PDF dropdown selector
/// - Page navigation controls
/// - Zoom controls
/// - Download button
class DocumentViewer extends StatefulWidget {
  final String assetId;
  final List<AssetFile>? initialFiles;

  const DocumentViewer({
    required this.assetId,
    this.initialFiles,
    super.key,
  });

  @override
  State<DocumentViewer> createState() => _DocumentViewerState();
}

class _DocumentViewerState extends State<DocumentViewer>
    with AutomaticKeepAliveClientMixin {
  final _assetsClient = getIt<AssetsClient>();
  final PdfViewerController _pdfController = PdfViewerController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(1);

  List<AssetFile> _pdfFiles = [];
  AssetFile? _selectedFile;
  int _totalPages = 1;
  double _zoomLevel = 1.0;
  bool _isLoading = true;
  String? _error;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (widget.initialFiles != null) {
      _loadFilesFromInitial();
    } else {
      _loadFiles();
    }
  }

  @override
  void dispose() {
    _pdfController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  void _loadFilesFromInitial() {
    final pdfs =
        widget.initialFiles!.where((f) => f.isPdf || f.extension == 'pdf').toList();
    setState(() {
      _pdfFiles = pdfs;
      _selectedFile = pdfs.isNotEmpty ? pdfs.first : null;
      _isLoading = false;
    });
  }

  Future<void> _loadFiles() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final files = await _assetsClient.listAssetFiles(widget.assetId);
      final pdfs = files.where((f) => f.isPdf || f.extension == 'pdf').toList();

      if (mounted) {
        setState(() {
          _pdfFiles = pdfs;
          _selectedFile = pdfs.isNotEmpty ? pdfs.first : null;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _onFileSelected(AssetFile? file) {
    if (file == null) return;
    setState(() {
      _selectedFile = file;
      _currentPage.value = 1;
      _totalPages = 1;
    });
  }

  void _onDocumentLoaded(PdfDocumentLoadedDetails details) {
    setState(() {
      _totalPages = details.document.pages.count;
    });
  }

  void _onPageChanged(PdfPageChangedDetails details) {
    _currentPage.value = details.newPageNumber;
  }

  void _goToNextPage() {
    if (_currentPage.value < _totalPages) {
      _pdfController.jumpToPage(_currentPage.value + 1);
    }
  }

  void _goToPreviousPage() {
    if (_currentPage.value > 1) {
      _pdfController.jumpToPage(_currentPage.value - 1);
    }
  }

  void _zoomIn() {
    if (_zoomLevel < 2.0) {
      setState(() {
        _zoomLevel = (_zoomLevel + 0.25).clamp(0.5, 2.0);
        _pdfController.zoomLevel = _zoomLevel;
      });
    }
  }

  void _zoomOut() {
    if (_zoomLevel > 0.5) {
      setState(() {
        _zoomLevel = (_zoomLevel - 0.25).clamp(0.5, 2.0);
        _pdfController.zoomLevel = _zoomLevel;
      });
    }
  }

  void _downloadFile() {
    if (_selectedFile == null) return;
    launchUrl(
      Uri.parse(_selectedFile!.url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_isLoading) {
      return Container(
        color: AppColors.bgSecondary,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentButton),
          ),
        ),
      );
    }

    if (_error != null) {
      return Container(
        color: AppColors.bgSecondary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load documents',
                style: AppTextStyles.textLGSemibold,
              ),
              const SizedBox(height: 8),
              Text(
                _error!,
                style: AppTextStyles.textSMSecondary,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadFiles,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_pdfFiles.isEmpty) {
      return Container(
        color: AppColors.bgSecondary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.description_outlined,
                size: 64,
                color: AppColors.textTertiary,
              ),
              const SizedBox(height: 16),
              Text(
                'No Documents',
                style: AppTextStyles.textLGSemibold,
              ),
              const SizedBox(height: 8),
              Text(
                'Upload warranty documents, manuals, or invoices to view them here.',
                style: AppTextStyles.textSMSecondary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: AppColors.bgSecondary,
      child: Column(
        children: [
          // Toolbar
          _buildToolbar(),
          // PDF Viewer
          Expanded(
            child: Stack(
              children: [
                if (_selectedFile != null)
                  PdfViewer(
                    key: ValueKey(_selectedFile!.id),
                    url: _selectedFile!.url,
                    pdfController: _pdfController,
                    zoomLevel: _zoomLevel,
                    onDocumentLoaded: _onDocumentLoaded,
                    onPageChanged: _onPageChanged,
                  ),
                // Page navigation overlay (bottom left)
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: PdfPageNavigation(
                    currentPage: _currentPage,
                    totalPages: _totalPages,
                    onPageUp: _goToNextPage,
                    onPageDown: _goToPreviousPage,
                  ),
                ),
                // Zoom controls overlay (bottom right)
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: PdfPageZoom(
                    zoomLevel: _zoomLevel,
                    onZoomIn: _zoomIn,
                    onZoomOut: _zoomOut,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderPrimary),
        ),
      ),
      child: Row(
        children: [
          // PDF selector dropdown
          Expanded(
            child: _pdfFiles.length > 1
                ? DropdownButton<AssetFile>(
                    value: _selectedFile,
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    style: AppTextStyles.textSM,
                    items: _pdfFiles.map((file) {
                      return DropdownMenuItem<AssetFile>(
                        value: file,
                        child: Text(
                          file.fileName,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.textSM,
                        ),
                      );
                    }).toList(),
                    onChanged: _onFileSelected,
                  )
                : Text(
                    _selectedFile?.fileName ?? '',
                    style: AppTextStyles.textSM,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          const SizedBox(width: 8),
          // File info
          if (_selectedFile != null)
            Text(
              _selectedFile!.sizeDisplay,
              style: AppTextStyles.textXS.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          const SizedBox(width: 8),
          // Download button
          IconButton(
            onPressed: _downloadFile,
            icon: const Icon(Icons.download),
            iconSize: 20,
            color: AppColors.textSecondary,
            tooltip: 'Download',
          ),
        ],
      ),
    );
  }
}
