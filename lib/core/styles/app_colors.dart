import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // Primary Colors
  static const primary = Color(0xFF161616);
  static const primaryLight = Color(0xFFE0E0E0);
  static const error = Color(0xFFF44336);
  static const success = Color(0xFF4CAF50);
  static const successLight = Color(0xFFE8F5E9);
  static const warning = Color(0xFFFF9800);
  static const info = Color(0xFF2196F3);
  static const tertiary = Color(0xFF848281);

  // Text Colors
  static const textHighEmphasis = Color(0xDE000000);
  static const textMediumEmphasis = Color(0x99000000);
  static const textDisabled = Color(0x61000000);
  static const textInverse = Color(0xFFFFFFFF);

  // Background & Surface
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFFFFFFF);
  static const errorSurface = Color(0xFFFFEBEE);
  static const surfaceVariant = Color(0xFFFFFFFF);

  // Status Colors (updated to match Figma design)
  static const statusNew = Color(0xFF2563EB); // Figma: Created/Open status
  static const statusCreated = Color(0xFF2563EB); // Alias for statusNew
  static const statusInProgress = Color(0xFFF79009); // Figma: In Progress
  static const statusOnHold = Color(0xFFF59E0B); // Figma: On Hold (amber)
  static const statusResolved = Color(0xFF17B26A); // Figma: Resolved (green)
  static const statusClosed = Color(0xFF757575);
  static const statusReopened = Color(0xFF8E24AA);

  // Priority Colors
  static const priorityLow = Color(0xFF4CAF50);
  static const priorityMedium = Color(0xFFFFC107);
  static const priorityHigh = Color(0xFFFF9800);
  static const priorityCritical = Color(0xFFF44336);

  // Legacy colors (keeping for backward compatibility)
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const transparent = Color(0x00000000);
  static const grayLight = Color(0xFFE0E0E0);
  static const graySolid = Color(0xFF9E9E9E);
  static const grayHighlightBg = Color(0xFFF5F5F5);
  static const grayOptional = Color(0xFF757575);
  static const red = Color(0xFFF44336);
  static const green = Color(0xFF4CAF50);
  static const blue = Color(0xFF2196F3);
  static const orange = Color(0xFFFF9800);
  static const cardBorder = Color(0xFFE0E0E0);
  static const cardSurface = Color(0xFFFFFFFF);

  // Additional legacy colors for backward compatibility
  static const accentButton = primary;
  static const actionButton = primary;
  static const secondaryButton = surfaceVariant;
  static const disabled = textDisabled;
  static const gray = grayOptional;
  static const grayMedium = graySolid;
  static const link = blue;
  static const darkRed = Color(0xFFB71C1C);
  static const warningButton = warning;
  static const purple = Color(0xFF9C27B0);
  static const cardWhite = white;
  static const cardGray = grayLight;
  static const segmentedButtonBackground = white;
  static const segmentedButtonSelectedBackground = surfaceVariant;
  static const segmentedButtonBorder = grayLight;

  //Moat Colors
  static const bgPrimary = Color(0xFF161616);
  static const bgSecondary = Color(0xFFF1F0EE);
  static const bgSecondarySubtitle = Color(0xFFF8F8F6);
  static const bgQuaternary = Color(0xFFE4E1DF);
  static const bgOverlay = Color(0xFF161616);

  static const fgPrimary = Color(0xFF211F1C);
  static const fgTertiary = Color(0xFF848281);
  static const fgQuaternary = Color(0xFFB4B3B1);

  static const textPrimary = Color(0xFF161616);
  static const textSecondary = Color(0xFF696867);
  static const textTertiary = Color(0xFF848281);
  static const textPlaceHolder = Color(0xFF9B9997);
  static const textWhite = Color(0xFFFFFFFF);

  static const gray900 = Color(0xFF211F1C);

  static const borderSecondary = Color(0xFFE4E1DF);
  static const borderPrimary = Color(0xFFD3D1CF);

  static const blueLight = Color(0xFF0086C9);
  static const blueLight700 = Color(0xFF026AA2);

  // Admin Dashboard Colors
  static const admin = Color(0xFF6B46C1);

  static const utilityBlue700 = Color(0xFF175CD3);
  static const utilityBlue500 = Color(0xFF0BA5EC);
  static const utilityBlue200 = Color(0xFFB2DDFF);
  static const utilityBlue300 = Color(0xFF7DD3FC);
  static const utilityBlue50 = Color(0xFFEFF8FF);
  static const utilityGreyBlue500 = Color(0xFF4E5BA6);
  static const utilityGreen500 = Color(0xFF16B364);
  static const utilityGreen700 = Color(0xFF087443);
  static const utilityGreen200 = Color(0xFFAAF0C4);
  static const utilityGreen50 = Color(0xFFECFDF3);
  static const utilityYellow300 = Color(0xFFFDE272);
  static const utilityYellow400 = Color(0xFFFAC515);
  static const utilityOrangeDark300 = Color(0xFFFF9C66);
  static const utilityOrangeDark400 = Color(0xFFFF692E);
  static const utilityError500 = Color(0xFFF04438);
  static const utilityError700 = Color(0xFFB42318);
  static const utilityError200 = Color(0xFFFECDCA);
  static const utilityError50 = Color(0xFFFEF3F2);
  static const utilityOrange700 = Color(0xFFB93815);
  static const utilityOrange500 = Color(0xFFEF6820);
  static const utilityOrange200 = Color(0xFFF9DBAF);
  static const utilityOrange50 = Color(0xFFFEF6EE);
  static const utilityWarning500 = Color(0xFFE99537);
  static const moss400 = Color(0xFF86CB3C);
  static const lime = Color(0xFFACDC79);
  static const utilityPurple700 = Color(0xFF5925DC);
  static const utilityPurple500 = Color(0xFF7A5AF8);
  static const utilityPurple300 = Color(0xFFBDB4FE);
  static const utilityPurple200 = Color(0xFFD9D6FE);
  static const utilityPurple50 = Color(0xFFF4F3FF);
  static const utilityGray500 = Color(0xFF9B9997);

  // Accent Colors (Figma design system)
  static const accentBlue = Color(0xFF2563EB); // Primary accent blue
  static const accentBlueBg = Color(0xFFDBEAFE); // Accent blue background
  static const accentBlueLight = Color(0xFFEFF6FF); // Light blue background
  static const accentBlueDark = Color(0xFF1D4ED8); // Darker accent blue

  // Badge Colors (Figma)
  static const badgeServiceRequest = Color(0xFFF97066);
  static const badgeServiceRequestBg = Color(0xFFFEF3F2);
  static const badgeMaintenance = Color(0xFF17B26A);
  static const badgeMaintenanceBg = Color(0xFFECFDF3);

  // Additional Status/Badge Colors
  static const utilityGreenLight50 = Color(0xFFF0FDF4); // Light green bg variant
  static const utilityAmber50 = Color(0xFFFEF3C7); // Amber/yellow bg (pending)
  static const utilityAmber800 = Color(0xFF92400E); // Amber/yellow text (pending)
  static const utilityErrorLight50 = Color(0xFFFEE2E2); // Light error bg (critical)

  // Shadow Colors
  static const shadowXS = Color(0x0D0A0D12); // 5% opacity - Figma shadow-xs
  static const shadowSM = Color(0x1A0A0D12); // 10% opacity
  static const shadowMD = Color(0x260A0D12); // 15% opacity

  // AI/Accent Purple (for AI features)
  static const accentPurple = Color(0xFF7C3AED);
  static const accentPurpleBg = Color(0xFFF5F3FF);
  static const accentPurpleBorder = Color(0xFFDDD6FE);

  // Explore Feature (Cyan/Teal)
  static const exploreCyan = Color(0xFF06B6D4);
  static const exploreTeal = Color(0xFF14B8A6);

  // Avatar
  static const avatarBorder = Color(0xFFE3E1DF);

  // Celebration/Confetti Colors
  static const confettiColors = [
    Color(0xFFFF6B6B), // Coral red
    Color(0xFF4ECDC4), // Teal
    Color(0xFFFFE66D), // Yellow
    Color(0xFF95E1D3), // Mint
    Color(0xFFF38181), // Salmon
    Color(0xFFAA96DA), // Lavender
    Color(0xFFFCBF49), // Gold
    Color(0xFF2EC4B6), // Turquoise
  ];

  // Navigation Button Gradient Colors
  static const gradientTicketsColors = [
    Color(0xFFD16B59), // Coral
    Color(0xFFE88C79),
    Color(0xFFE29887),
    Color(0xFFD28D73),
    Color(0xFF976529), // Rust
    Color(0xFFA23E27),
  ];

  static const gradientReportsColors = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF818CF8),
    Color(0xFF8B5CF6),
    Color(0xFFA78BFA),
    Color(0xFF7C3AED), // Purple
    Color(0xFF5B21B6),
  ];

  static const gradientReports2Colors = [
    Color(0xFF10B981), // Emerald
    Color(0xFF34D399),
    Color(0xFF6EE7B7),
    Color(0xFF34D399),
    Color(0xFF059669), // Green
    Color(0xFF047857),
  ];

  static const gradientExploreColors = [
    Color(0xFF06B6D4), // Cyan
    Color(0xFF22D3EE),
    Color(0xFF14B8A6),
    Color(0xFF2DD4BF),
    Color(0xFF0891B2), // Teal
    Color(0xFF0E7490),
  ];

  static const gradientAssetsColors = [
    Color(0xFFC37B4C), // Tan
    Color(0xFFA4B3B3),
    Color(0xFF9FBCC3),
    Color(0xFF8DAFBB),
    Color(0xFF317293), // Blue
    Color(0xFF004263),
  ];
}
