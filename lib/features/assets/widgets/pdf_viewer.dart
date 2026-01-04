import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../core/styles/app_colors.dart';

/// A lightweight wrapper around Syncfusion's PDF viewer with Moat theming.
class PdfViewer extends StatelessWidget {
  final String url;
  final PdfViewerController pdfController;
  final double zoomLevel;
  final Function(PdfPageChangedDetails)? onPageChanged;
  final Function(PdfDocumentLoadedDetails)? onDocumentLoaded;

  const PdfViewer({
    required this.url,
    required this.pdfController,
    this.zoomLevel = 1.0,
    this.onPageChanged,
    this.onDocumentLoaded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfTheme(
      data: SfThemeData(
        pdfViewerThemeData: SfPdfViewerThemeData(
          backgroundColor: AppColors.white,
          progressBarColor: AppColors.accentButton,
        ),
      ),
      child: SfPdfViewer.network(
        url,
        controller: pdfController,
        initialZoomLevel: zoomLevel,
        maxZoomLevel: 2.0,
        enableDocumentLinkAnnotation: true,
        enableDoubleTapZooming: true,
        initialPageNumber: 1,
        onPageChanged: onPageChanged,
        onDocumentLoaded: onDocumentLoaded,
      ),
    );
  }
}
