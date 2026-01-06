import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_sizes.dart';
import '../data/task_models.dart';

/// Full-screen image viewer with blurred background, navigation, and metadata
class FullScreenImageViewer extends StatefulWidget {
  final List<TaskAttachment> images;
  final int initialIndex;
  final String? uploaderName;

  const FullScreenImageViewer({
    super.key,
    required this.images,
    required this.initialIndex,
    this.uploaderName,
  });

  /// Shows the image viewer dialog
  static void show(
    BuildContext context, {
    required List<TaskAttachment> images,
    required int initialIndex,
    String? uploaderName,
  }) {
    showDialog(
      context: context,
      barrierColor: AppColors.transparent,
      builder: (context) => FullScreenImageViewer(
        images: images,
        initialIndex: initialIndex,
        uploaderName: uploaderName,
      ),
    );
  }

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  String _formatDate(DateTime date) {
    final localDate = date.isUtc ? date.toLocal() : date;
    return DateFormat('MMM d, yyyy').format(localDate);
  }

  String _getInitials(String? name) {
    if (name == null || name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final currentImage = widget.images[_currentIndex];

    return Stack(
      children: [
        // Blurred background (light to support dark text)
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: AppColors.white.withValues(alpha: 0.85),
            ),
          ),
        ),
        // Main content
        SafeArea(
          child: Column(
            children: [
              // Header with avatar, name, date, and counter
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // Close button (top left)
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondary,
                          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.textPrimary,
                          size: 20,
                        ),
                      ),
                    ),
                    // Center: Avatar + Name + Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Avatar
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.utilityBlue500,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _getInitials(widget.uploaderName),
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppSizes.spacingXS),
                          // Name
                          Text(
                            widget.uploaderName ?? 'Unknown',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          // Date
                          Text(
                            'Added ${_formatDate(currentImage.createdAt)}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Counter (top right)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.bgSecondary,
                        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                      ),
                      child: Text(
                        '${_currentIndex + 1} of ${widget.images.length}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Image viewer with navigation
              Expanded(
                child: Stack(
                  children: [
                    // PageView for images
                    PageView.builder(
                      controller: _pageController,
                      itemCount: widget.images.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final image = widget.images[index];
                        return Padding(
                          padding: const EdgeInsets.all(AppSizes.spacing3XL),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                              child: Image.network(
                                image.url,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Container(
                                  width: 200,
                                  height: 200,
                                  color: AppColors.bgSecondary,
                                  child: const Icon(
                                    Icons.broken_image_outlined,
                                    color: AppColors.textTertiary,
                                    size: 48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // Left navigation arrow
                    if (_currentIndex > 0)
                      Positioned(
                        left: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: _goToPrevious,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.bgSecondary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.chevron_left,
                                color: AppColors.textPrimary,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    // Right navigation arrow
                    if (_currentIndex < widget.images.length - 1)
                      Positioned(
                        right: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: _goToNext,
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.bgSecondary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.chevron_right,
                                color: AppColors.textPrimary,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
