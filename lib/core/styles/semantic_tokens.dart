import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_sizes.dart';

/// Semantic Design Tokens
///
/// This file provides a semantic layer on top of the raw design tokens,
/// making it easier to choose the right style by meaning rather than
/// knowing specific token names.
///
/// ## Usage
///
/// Instead of:
/// ```dart
/// Text('Title', style: AppTextStyles.textLGSemibold)
/// ```
///
/// Use:
/// ```dart
/// Text('Title', style: Semantic.cardTitle)
/// ```
///
/// ## When to use which
///
/// - **Page titles**: `Semantic.pageTitle`
/// - **Card/section titles**: `Semantic.cardTitle`
/// - **Form labels**: `Semantic.formLabel`
/// - **Body text**: `Semantic.body` or `Semantic.bodySmall`
/// - **Buttons**: `Semantic.buttonText` or `Semantic.buttonTextSecondary`
/// - **Captions/metadata**: `Semantic.caption`
/// - **Error messages**: `Semantic.error`

// =============================================================================
// TEXT STYLES
// =============================================================================

abstract class Semantic {
  Semantic._();

  // ---------------------------------------------------------------------------
  // Headings
  // ---------------------------------------------------------------------------

  /// Large page titles (e.g., "Tickets", "Assets")
  static const TextStyle pageTitle = AppTextStyles.text2XLSemibold;

  /// Section headers within a page
  static const TextStyle sectionTitle = AppTextStyles.textXLSemibold;

  /// Card or panel titles
  static const TextStyle cardTitle = AppTextStyles.textLGSemibold;

  /// Subsection or group titles
  static const TextStyle subtitle = AppTextStyles.textMDSemiBold;

  // ---------------------------------------------------------------------------
  // Body Text
  // ---------------------------------------------------------------------------

  /// Default body text
  static const TextStyle body = AppTextStyles.textMD;

  /// Small body text
  static const TextStyle bodySmall = AppTextStyles.textSM;

  /// Extra small text (fine print)
  static const TextStyle bodyXS = AppTextStyles.textXS;

  /// Secondary/muted body text
  static TextStyle get bodySecondary => AppTextStyles.textMD.copyWith(
        color: SemanticColors.textSecondary,
      );

  // ---------------------------------------------------------------------------
  // Form Elements
  // ---------------------------------------------------------------------------

  /// Form field labels
  static const TextStyle formLabel = AppTextStyles.textSMMedium;

  /// Form input text
  static const TextStyle formInput = AppTextStyles.textMD;

  /// Form placeholder text
  static TextStyle get formPlaceholder => AppTextStyles.textMD.copyWith(
        color: SemanticColors.textPlaceholder,
      );

  /// Form helper/hint text
  static const TextStyle formHint = AppTextStyles.textXS;

  /// Form field error message
  static const TextStyle formError = AppTextStyles.fieldError;

  // ---------------------------------------------------------------------------
  // Buttons
  // ---------------------------------------------------------------------------

  /// Primary button text
  static const TextStyle buttonText = AppTextStyles.textMDSemiBoldWhite;

  /// Secondary/outlined button text
  static const TextStyle buttonTextSecondary = AppTextStyles.textMDSemiBold;

  /// Small button text
  static const TextStyle buttonTextSmall = AppTextStyles.textSMSemibold;

  // ---------------------------------------------------------------------------
  // Data Display
  // ---------------------------------------------------------------------------

  /// Table header cells
  static const TextStyle tableHeader = AppTextStyles.textSMSemibold;

  /// Table body cells
  static const TextStyle tableCell = AppTextStyles.textSM;

  /// Metric/stat values (large numbers)
  static const TextStyle metric = AppTextStyles.text2XLSemibold;

  /// Metric labels
  static const TextStyle metricLabel = AppTextStyles.textSM;

  /// Badge/tag text
  static const TextStyle badge = AppTextStyles.textXSSemibold;

  // ---------------------------------------------------------------------------
  // Feedback
  // ---------------------------------------------------------------------------

  /// Error messages
  static TextStyle get error => AppTextStyles.textSM.copyWith(
        color: SemanticColors.error,
      );

  /// Success messages
  static TextStyle get success => AppTextStyles.textSM.copyWith(
        color: SemanticColors.success,
      );

  /// Warning messages
  static TextStyle get warning => AppTextStyles.textSM.copyWith(
        color: SemanticColors.warning,
      );

  // ---------------------------------------------------------------------------
  // Captions & Metadata
  // ---------------------------------------------------------------------------

  /// Timestamps, metadata, secondary info
  static TextStyle get caption => AppTextStyles.textXS.copyWith(
        color: SemanticColors.textSecondary,
      );

  /// Link text
  static TextStyle get link => AppTextStyles.textMD.copyWith(
        color: SemanticColors.link,
      );
}

// =============================================================================
// COLORS
// =============================================================================

abstract class SemanticColors {
  SemanticColors._();

  // ---------------------------------------------------------------------------
  // Text Colors
  // ---------------------------------------------------------------------------

  /// Primary text color (headings, body)
  static const Color textPrimary = AppColors.textPrimary;

  /// Secondary text color (captions, metadata)
  static const Color textSecondary = AppColors.textSecondary;

  /// Tertiary/muted text
  static const Color textTertiary = AppColors.textTertiary;

  /// Placeholder text in inputs
  static const Color textPlaceholder = AppColors.textPlaceHolder;

  /// Text on dark backgrounds
  static const Color textInverse = AppColors.textWhite;

  // ---------------------------------------------------------------------------
  // Backgrounds
  // ---------------------------------------------------------------------------

  /// Main page background
  static const Color bgPage = AppColors.white;

  /// Card/panel background
  static const Color bgCard = AppColors.white;

  /// Secondary background (sections, alternating rows)
  static const Color bgSecondary = AppColors.bgSecondary;

  /// Hover/highlight background
  static const Color bgHover = AppColors.bgSecondarySubtitle;

  /// Selected item background
  static const Color bgSelected = AppColors.bgQuaternary;

  // ---------------------------------------------------------------------------
  // Borders
  // ---------------------------------------------------------------------------

  /// Default border color
  static const Color border = AppColors.borderSecondary;

  /// Stronger border (focused inputs, selected items)
  static const Color borderStrong = AppColors.borderPrimary;

  // ---------------------------------------------------------------------------
  // Status Colors
  // ---------------------------------------------------------------------------

  /// Error/danger state
  static const Color error = AppColors.utilityError500;

  /// Error background
  static const Color errorBg = AppColors.utilityError50;

  /// Success state
  static const Color success = AppColors.utilityGreen500;

  /// Success background
  static const Color successBg = AppColors.utilityGreen50;

  /// Warning state
  static const Color warning = AppColors.utilityOrange500;

  /// Warning background
  static const Color warningBg = AppColors.utilityOrange50;

  /// Info state
  static const Color info = AppColors.utilityBlue500;

  /// Info background
  static const Color infoBg = AppColors.utilityBlue50;

  // ---------------------------------------------------------------------------
  // Interactive
  // ---------------------------------------------------------------------------

  /// Primary action color
  static const Color primary = AppColors.bgPrimary;

  /// Link color
  static const Color link = AppColors.blueLight700;

  /// Disabled state
  static const Color disabled = AppColors.textTertiary;

  // ---------------------------------------------------------------------------
  // Ticket Status
  // ---------------------------------------------------------------------------

  static const Color statusNew = AppColors.statusNew;
  static const Color statusInProgress = AppColors.statusInProgress;
  static const Color statusResolved = AppColors.statusResolved;
  static const Color statusClosed = AppColors.statusClosed;
  static const Color statusReopened = AppColors.statusReopened;
}

// =============================================================================
// SPACING
// =============================================================================

abstract class SemanticSpacing {
  SemanticSpacing._();

  /// Tight spacing within components (4px)
  static const double tight = AppSizes.spacingSM;

  /// Default spacing between elements (8px)
  static const double normal = AppSizes.spacingMD;

  /// Spacing between related groups (12px)
  static const double relaxed = AppSizes.spacingLG;

  /// Section spacing (16px)
  static const double section = AppSizes.spacingXL;

  /// Large section spacing (24px)
  static const double large = AppSizes.spacing2XL;

  /// Page-level spacing (32px)
  static const double page = AppSizes.spacing3XL;

  // ---------------------------------------------------------------------------
  // Component-specific
  // ---------------------------------------------------------------------------

  /// Card internal padding
  static const double cardPadding = AppSizes.spacingXL;

  /// Form field vertical gap
  static const double formGap = AppSizes.spacingLG;

  /// Table row height
  static const double tableRowHeight = AppSizes.tableRowHeight;

  /// Button horizontal padding
  static const double buttonPaddingH = AppSizes.spacingXL;

  /// Button vertical padding
  static const double buttonPaddingV = AppSizes.spacingMD;
}

// =============================================================================
// RADII
// =============================================================================

abstract class SemanticRadius {
  SemanticRadius._();

  /// Small radius for badges, chips (4px)
  static const double small = AppSizes.radiusXS;

  /// Default radius for buttons, inputs (8px)
  static const double normal = AppSizes.radiusSM;

  /// Medium radius for cards (12px)
  static const double card = AppSizes.radiusMD;

  /// Large radius for modals, drawers (16px)
  static const double large = AppSizes.radiusLG;

  /// Full circle (for avatars)
  static const double circle = 999.0;
}
