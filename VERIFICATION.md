# Flutter Web Feature Verification Guide

This document provides step-by-step instructions for navigating and verifying each frontend feature, both functionally and visually against Figma designs.

---

## Quick Start

### 1. Start the Development Server

```bash
cd frontend
flutter run -d chrome --dart-define-from-file=dart_defines/dev.env --web-port=3500
```

The app runs at: **http://localhost:3500**

### 2. Run Screenshot Tests

```bash
# Terminal 1: Start ChromeDriver
chromedriver --port=4444

# Terminal 2: Run integration tests
cd frontend
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart \
  -d web-server --web-port=3501
```

Screenshots are saved to `frontend/screenshots/`.

---

## Navigation Map

### Route Structure

| Category | Route | Screen | Implementation Status |
|----------|-------|--------|----------------------|
| **Auth** | `/login` | Login Screen | Implemented |
| | `/sign-up` | Sign Up Screen | Implemented |
| | `/reset-password` | Forgot Password | Implemented |
| | `/invite/:companyId/:memberId` | Invite Flow | Placeholder |
| **System** | `/loading` | Loading Screen | Placeholder |
| | `/no-permissions` | No Access Screen | Placeholder |
| **Dashboard** | `/dashboard` | Dashboard Overview | Placeholder |
| **Tickets** | `/tickets/list` | Ticket List | Implemented |
| | `/tickets/:externalId` | Ticket Detail | Implemented (Drawer) |
| **Assets** | `/assets/list` | Asset List | Implemented |
| | `/assets/:assetId` | Asset Detail | Implemented |
| | `/assets/alerts` | Asset Alerts | Placeholder |
| **Settings** | `/settings/members` | Team Members | Implemented |
| | `/settings/roles` | Roles & Permissions | Implemented |
| | `/settings/locations` | Locations | Implemented |
| | `/settings/ticketing` | Ticketing Config | Implemented |
| **Admin** | `/admin/overview` | Admin Overview | Implemented |
| | `/admin/gap-analysis` | Gap Analysis | Implemented |
| | `/admin/metrics` | Metrics | Implemented |
| | `/admin/workflows` | Workflows | Implemented |
| | `/admin/document-processing` | Doc Processing | Implemented |
| | `/admin/prompts` | AI Prompts | Implemented |
| | `/admin/ai-generations` | AI Generations | Implemented |
| | `/admin/company-management` | Companies | Implemented |
| | `/admin/sso-domains` | SSO Domains | Implemented |

---

## Screen-by-Screen Verification

### Authentication Screens

#### 1. Login Screen (`/login`)

**Navigate:** Direct access or when unauthenticated

**Figma Node:** `1300-19409` (or search for "Login" in Figma)

**Functional Verification:**
- [ ] Email field validates format
- [ ] Password field is masked
- [ ] "Sign In" button submits form
- [ ] Validation errors display correctly
- [ ] "Forgot password?" link navigates to reset
- [ ] "Sign up" link navigates to registration
- [ ] Google Sign-In button initiates OAuth flow

**Visual Verification:**
1. Use Figma MCP: `get_design_context(fileKey="bJ3BCImLsZPtODEnJscEhW", nodeId="...")`
2. Compare against screenshot: `screenshots/01_login_screen.png`
3. Check:
   - [ ] Logo placement and size
   - [ ] Input field styling (borders, padding)
   - [ ] Button colors and hover states
   - [ ] Typography matches (Inter font, sizes)
   - [ ] Spacing between elements

---

#### 2. Sign Up Screen (`/sign-up`)

**Navigate:** Click "Sign up" on login screen

**Functional Verification:**
- [ ] Email field validates
- [ ] Password meets requirements
- [ ] Confirm password matches
- [ ] Terms checkbox present
- [ ] Form submits correctly

---

#### 3. Forgot Password (`/reset-password`)

**Navigate:** Click "Forgot password?" on login screen

**Functional Verification:**
- [ ] Email field validates
- [ ] Submit triggers password reset email
- [ ] Back to login link works

---

### Main Application Screens

#### 4. Ticket List (`/tickets/list`)

**Navigate:** Default authenticated route, or click "Tickets" in sidebar

**Figma Node:** Search for "Ticket List" or "Open Tickets"

**Functional Verification:**
- [ ] Page header displays "Open Tickets"
- [ ] Stat cards show metrics (Total, Avg Time to Close, Avg Response Time)
- [ ] Search bar filters tickets
- [ ] Filter bar works (type, status, assignee, location)
- [ ] Data table displays tickets with columns:
  - Task (title + description)
  - Location
  - Type (badge)
  - Assignee
  - Time in Queue
- [ ] Sorting works on each column
- [ ] Pagination controls work
- [ ] Row click opens detail drawer
- [ ] "Add Ticket" button opens create drawer

**Visual Verification (Desktop):**
- [ ] Sidebar menu present on left
- [ ] Stats cards row spacing
- [ ] Table header styling
- [ ] Row hover states
- [ ] Badge colors match type
- [ ] Pagination button styling

**Visual Verification (Mobile < 600px):**
- [ ] Bottom navigation replaces sidebar
- [ ] Card-based layout instead of table
- [ ] Horizontal scrolling stat cards

---

#### 5. Create Ticket Drawer

**Navigate:** Click "Add Ticket" on ticket list

**Functional Verification:**
- [ ] Title field required
- [ ] Description field (optional)
- [ ] Type dropdown (Maintenance, Service Request, Warranty, Other)
- [ ] Location dropdown populated
- [ ] Assignee dropdown populated
- [ ] Submit creates ticket
- [ ] Cancel closes drawer
- [ ] Success closes drawer and refreshes list

---

#### 6. Ticket Detail Drawer

**Navigate:** Click any ticket row in the list

**Functional Verification:**
- [ ] Header shows ticket title and ID
- [ ] Status badge and action buttons
- [ ] Details section (type, location, assignee, dates)
- [ ] Activity timeline (comments, status changes)
- [ ] Attachments section
- [ ] Comment input with mentions
- [ ] Status change updates ticket

---

#### 7. Asset List (`/assets/list`)

**Navigate:** Click "Assets" in sidebar or bottom nav

**Functional Verification:**
- [ ] Page title "Assets"
- [ ] Search button opens search dialog
- [ ] Filter button opens filter sheet
- [ ] Asset list displays with tiles
- [ ] Pull-to-refresh works
- [ ] Infinite scroll loads more
- [ ] Tile click navigates to detail
- [ ] FAB opens create dialog (TODO)

**Visual Verification:**
- [ ] App bar styling
- [ ] Asset tile layout
- [ ] Empty state styling
- [ ] Loading indicator styling

---

#### 8. Asset Detail (`/assets/:assetId`)

**Navigate:** Click any asset tile in the list

**Functional Verification:**
- [ ] Header shows asset name
- [ ] All asset fields displayed
- [ ] Location info shown
- [ ] Warranty status visible
- [ ] Related files section
- [ ] Edit capability (if implemented)

---

### Settings Screens

#### 9. Team Members (`/settings/members`)

**Navigate:** Click "Settings" in sidebar, default sub-route

**Functional Verification:**
- [ ] List of team members
- [ ] Invite member button
- [ ] Member row shows name, role, status
- [ ] Click opens member detail

---

#### 10. Roles (`/settings/roles`)

**Navigate:** Settings -> Roles tab/link

**Functional Verification:**
- [ ] List of roles
- [ ] Create role button
- [ ] Permissions matrix

---

### Admin Screens

#### 11. Admin Overview (`/admin/overview`)

**Navigate:** Click "Admin" in sidebar (requires admin role)

**Functional Verification:**
- [ ] System health metrics
- [ ] User activity summary
- [ ] Navigation to sub-sections

---

## Using Puppeteer MCP for Browser Automation

### Enable Semantics Mode

Flutter web renders on canvas. Enable semantics for element access:

```javascript
// Execute in browser console or via Puppeteer
document.querySelector('flt-glass-pane').shadowRoot
  .querySelector('flt-semantics-placeholder').click();
```

### Find Elements by ARIA Labels

After enabling semantics:

```javascript
// Find by aria-label
document.querySelector('flt-semantics[aria-label*="Open Tickets"]');

// Find button by text
document.evaluate(
  '//flt-semantics[contains(@aria-label, "Add Ticket")]',
  document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null
).singleNodeValue;
```

### Automated Navigation Flow

```
1. Navigate to http://localhost:3500
2. Enable semantics (click placeholder)
3. Take screenshot: login_screen.png
4. Enter credentials, click Sign In
5. Wait for redirect to /tickets/list
6. Take screenshot: ticket_list.png
7. Click "Add Ticket" button
8. Take screenshot: create_ticket_drawer.png
...
```

---

## Figma Design Verification

### Getting Design Context

Use Figma MCP to extract design specifications:

```
# Get structured design data
get_design_context(fileKey="bJ3BCImLsZPtODEnJscEhW", nodeId="1300:19409")

# Get design tokens (colors, spacing, typography)
get_variable_defs(fileKey="bJ3BCImLsZPtODEnJscEhW", nodeId="1300:19409")

# Get visual screenshot from Figma
get_screenshot(fileKey="bJ3BCImLsZPtODEnJscEhW", nodeId="1300:19409")
```

### Comparison Checklist

For each screen, compare:

| Aspect | Check |
|--------|-------|
| **Layout** | Element positions, spacing, alignment |
| **Typography** | Font family (Inter), sizes, weights, line heights |
| **Colors** | Background, text, borders, buttons |
| **Spacing** | Padding, margins, gaps |
| **Components** | Button styles, input styles, badges |
| **States** | Hover, active, disabled, error |
| **Responsive** | Mobile, tablet, desktop breakpoints |

---

## CI/CD Integration

### GitHub Actions Workflow

```yaml
name: Visual Regression Tests

on: [push, pull_request]

jobs:
  visual-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.0'

      - name: Install ChromeDriver
        uses: browser-actions/setup-chromedriver@latest

      - name: Install dependencies
        run: flutter pub get
        working-directory: frontend

      - name: Run integration tests
        run: |
          chromedriver --port=4444 &
          flutter drive \
            --driver=test_driver/integration_test.dart \
            --target=integration_test/screenshot_test.dart \
            -d web-server
        working-directory: frontend

      - name: Upload screenshots
        uses: actions/upload-artifact@v4
        with:
          name: screenshots
          path: frontend/screenshots/
```

---

## Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| ChromeDriver not found | Install: `brew install chromedriver` or `apt install chromium-chromedriver` |
| Port already in use | Use `--web-port=3501` or kill existing process |
| Semantics not enabled | Click the hidden placeholder or use `SemanticsBinding.instance.ensureSemantics()` |
| Screenshots black | Wait longer with `pumpAndSettle(Duration(seconds: 2))` |
| Auth tests fail | Set up Firebase Auth emulator or use mock auth |

### Debugging Semantics

```dart
// In MaterialApp
MaterialApp(
  showSemanticsDebugger: true,
  // ...
)
```

---

## Quick Reference Commands

```bash
# Start dev server
flutter run -d chrome --dart-define-from-file=dart_defines/dev.env --web-port=3500

# Run all integration tests
chromedriver --port=4444 &
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/screenshot_test.dart -d web-server

# Run specific test
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/screenshot_test.dart -d web-server --dart-define=TEST_NAME=01_login_screen

# Build web for testing
flutter build web --dart-define-from-file=dart_defines/dev.env

# Analyze code
flutter analyze

# Check for outdated packages
flutter pub outdated
```
