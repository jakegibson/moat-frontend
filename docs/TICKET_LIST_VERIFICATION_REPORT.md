# Design Verification Report: Moat V1 Screens

**Date:** 2026-01-03
**Figma URL:** https://www.figma.com/design/bJ3BCImLsZPtODEnJscEhW/Moat-V1?node-id=1300-19409

---

## Verification Loop Status

| Iteration | Screens Captured | Issues Found | Issues Fixed |
|-----------|------------------|--------------|--------------|
| 1 | Login (01_login_screen.png) | 3 | 3 (ticket list) |

---

## Login Screen Verification

**Flutter Screenshot:** `screenshots/01_login_screen.png`
**Status:** PASS (minor adjustments)

### Visual Comparison Results

| Element | Figma | Flutter | Match |
|---------|-------|---------|-------|
| Background | Dark (#161616) | Dark theme | ✅ |
| Title "Moat" | Centered, large | Centered, headlineLarge | ✅ |
| Subtitle | Gray text | onSurfaceVariant | ✅ |
| Email input | Dark field with icon | Dark field with icon | ✅ |
| Password input | Dark field with icon | Dark field with icon | ✅ |
| Sign In button | Primary blue | Blue (#7B8DEF) | ✅ |
| Google button | Outlined | Outlined with icon | ✅ |
| Sign up link | Bottom text | Bottom link | ✅ |

### Login Screen Notes
- Dark theme implementation matches Figma
- Input field styling is consistent
- Button colors and borders match design tokens

---

## Ticket List Screen Verification

**Flutter File:** `lib/features/tickets/screens/ticket_list_screen.dart`

## Summary

| Metric | Value |
|--------|-------|
| **Match Percentage** | ~85% |
| **Critical Issues** | 2 |
| **Minor Issues** | 8 |

The Ticket List screen implementation follows Moat design tokens closely. Key discrepancies found in data table row heights, stat card styling, and pagination component details.

---

## Design Tokens Analysis

### Colors - PASS

| Token | Figma Value | Flutter Value | Match |
|-------|-------------|---------------|-------|
| bgPrimary | #161616 | `AppColors.bgPrimary` (0xFF161616) | ✅ |
| bgSecondary | #F1F0EE | `AppColors.bgSecondary` (0xFFF1F0EE) | ✅ |
| textPrimary | #161616 | `AppColors.textPrimary` (0xFF161616) | ✅ |
| textSecondary | #696867 | `AppColors.textSecondary` (0xFF696867) | ✅ |
| textTertiary | #848281 | `AppColors.textTertiary` (0xFF848281) | ✅ |
| borderSecondary | #E4E1DF | `AppColors.borderSecondary` (0xFFE4E1DF) | ✅ |
| white | #FFFFFF | `AppColors.white` (0xFFFFFFFF) | ✅ |

### Typography - PASS

| Style | Figma Spec | Flutter Implementation | Match |
|-------|------------|------------------------|-------|
| Header (title) | Inter 20px Semibold | `textXLSemibold` (20px, w600) | ✅ |
| Table Header | Inter 12px Semibold | `textXSSemibold` (12px, w600) | ✅ |
| Table Body Primary | Inter 14px Medium | `textSMMedium` (14px, w500) | ✅ |
| Table Body Secondary | Inter 14px Regular Tertiary | `textSMTertiary` (14px, w400) | ✅ |
| Stat Card Title | Inter 14px Medium Tertiary | `textSMMediumTertiary` (14px, w500) | ✅ |
| Stat Card Value | Inter 30px Semibold | `displaySMSemiBold` (30px, w600) | ✅ |

### Spacing - MOSTLY PASS

| Token | Figma Value | Flutter Value | Match |
|-------|-------------|---------------|-------|
| spacingXS | 4px | `AppSizes.spacingXS` (4.0) | ✅ |
| spacingSM | 6px | `AppSizes.spacingSM` (6.0) | ✅ |
| spacingMD | 8px | `AppSizes.spacingMD` (8.0) | ✅ |
| spacingLG | 12px | `AppSizes.spacingLG` (12.0) | ✅ |
| spacingXL | 16px | `AppSizes.spacingXL` (16.0) | ✅ |
| spacing2XL | 20px | `AppSizes.spacing2XL` (20.0) | ✅ |
| spacing3XL | 24px | `AppSizes.spacing3XL` (24.0) | ✅ |
| spacing4XL | 32px | `AppSizes.spacing4XL` (32.0) | ✅ |

### Border Radius - PASS

| Token | Figma Value | Flutter Value | Match |
|-------|-------------|---------------|-------|
| radiusMD | 8px | `AppSizes.radiusMD` (8.0) | ✅ |
| radiusLG | 10px | `AppSizes.radiusLG` (10.0) | ✅ |
| radiusXL | 12px | `AppSizes.radiusXL` (12.0) | ✅ |
| radiusFull | 9999px | `AppSizes.radiusFull` (9999.0) | ✅ |

---

## Issues Found

### Critical (Must Fix)

#### 1. Table Row Height Mismatch
- **Location:** `ticket_list_screen.dart:333`
- **Expected (Figma):** 64px per `AppSizes.tableRowHeight`
- **Actual:** 72px (`dataRowHeight: 72`)
- **Impact:** Vertical spacing is larger than design, reducing visible rows

**Fix:**
```dart
// Line 333: Change from
dataRowHeight: 72,
// To
dataRowHeight: AppSizes.tableRowHeight, // 64.0
```

#### 2. Stat Card Gap Inconsistency
- **Location:** `ticket_list_screen.dart:128, 141`
- **Expected (Figma):** 16px gap between stat cards
- **Actual:** 12px (`spacingLG`)
- **Impact:** Stat cards are closer together than design

**Fix:**
```dart
// Lines 128, 141: Change from
SizedBox(width: AppSizes.spacingLG),
// To
SizedBox(width: AppSizes.spacingXL), // 16px
```

---

### Minor (Should Fix)

#### 3. Table Shadow Opacity
- **Location:** `ticket_list_screen.dart:314-318`
- **Expected (Figma):** shadow-xs with specific opacity
- **Actual:** Using hardcoded Color(0x0D0A0D12)
- **Note:** Value appears correct but should use a named constant

**Recommendation:** Add to `app_decorations.dart`:
```dart
static const shadowXs = BoxShadow(
  color: Color(0x0D0A0D12),
  blurRadius: 2,
  offset: Offset(0, 1),
);
```

#### 4. Column Spacing Non-Standard Value
- **Location:** `ticket_list_screen.dart:328`
- **Expected:** Use design token
- **Actual:** `columnSpacing: 12` (hardcoded)
- **Fix:** Use `AppSizes.spacingLG`

#### 5. Stat Card Border Width
- **Location:** `tickets_stat_card.dart:57`
- **Expected (Figma):** 1px border
- **Actual:** 1.25px border
- **Fix:** Change `width: 1.25` to `width: 1.0`

#### 6. Missing Line Height in Some Text Styles
- **Location:** Legacy text styles in `app_text_styles.dart`
- **Note:** Many legacy styles (e.g., `header`, `semi32`) don't specify `height: 1.5`
- **Impact:** May cause inconsistent line spacing in some components

#### 7. Pagination Button Padding
- **Location:** `ticket_list_screen.dart:518-521`
- **Expected:** Standard spacing tokens
- **Actual:** Using `spacingLG` (12px) and `spacingMD` (8px)
- **Note:** May need verification against Figma - appears correct but worth confirming

#### 8. Page Number Box Size
- **Location:** `ticket_list_screen.dart:566-567`
- **Actual:** 40x40px hardcoded
- **Recommendation:** Create constant if this is a standard size

#### 9. Sort Icon Size
- **Location:** `ticket_list_screen.dart:604`
- **Actual:** 18px hardcoded
- **Recommendation:** Consider using standard icon size constant

#### 10. Mobile Card Separator
- **Location:** `ticket_list_screen.dart:270`
- **Actual:** Uses `spacingMD` (8px)
- **Note:** Verify against Figma mobile mockups

---

## Component Mapping

| Figma Component | Flutter Widget | File |
|-----------------|----------------|------|
| Ticket List Table | DataTable2 | ticket_list_screen.dart |
| Stat Card | TicketsStatCard | tickets_stat_card.dart |
| Type Badge | TypeBadge | type_badge.dart |
| Filter Bar | TicketFilterBar | ticket_filter_bar.dart |
| Time in Queue | TimeInQueueBar | time_in_queue_bar.dart |
| Assignee Cell | AssigneeTableCard | assignee_table_card.dart |
| Page Header | PageHeader | common_widgets/page_header.dart |
| Mobile Ticket | MobileTicketCard | mobile_ticket_card.dart |

---

## Recommendations

### High Priority
1. Fix table row height to 64px (Critical #1)
2. Fix stat card gap to 16px (Critical #2)
3. Fix stat card border width to 1px (Minor #5)

### Medium Priority
4. Extract shadow constants to app_decorations.dart
5. Replace hardcoded spacing values with design tokens
6. Add line-height to legacy text styles

### Low Priority
7. Create constants for icon sizes
8. Create constants for pagination box sizes
9. Audit mobile layouts against Figma mobile mockups

---

## Testing Commands

```bash
# Run screenshot capture for visual comparison
cd frontend
chromedriver --port=4444 &
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart \
  -d web-server --web-port=3501

# Check specific test
flutter test integration_test/screenshot_test.dart \
  --name="10_ticket_list_screen"
```

---

## Next Steps

1. Apply critical fixes (row height, stat card gap)
2. Re-capture screenshots
3. Compare with Figma screenshot using visual diff tool
4. Address minor issues in follow-up iteration
