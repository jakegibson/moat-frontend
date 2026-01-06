# Frontend Refactoring Plan

> Generated from codebase audit on 2026-01-05
> Goal: Improve maintainability for small teams (2-8) and low-context LLMs

---

## Overview

This plan addresses inconsistencies and code smells identified in the Flutter frontend. Changes are organized by priority and designed to be tackled incrementally without breaking functionality.

**Estimated Scope**: ~15-20 focused PRs over 2-4 sprints

---

## Phase 1: Critical Fixes (Do First)

These issues actively hurt productivity and should be fixed before adding new features.

### 1.1 Split `ticket_detail_drawer.dart` (3,247 lines)

**Current State**: One massive file containing 18+ private widget classes handling detail view, editing, activity, comments, attachments, and status changes.

**Target State**: 6 focused files, each <500 lines.

#### New File Structure

```
lib/features/tickets/widgets/
├── ticket_detail_drawer.dart        # Main drawer shell (~200 lines)
├── ticket_detail_header.dart        # Header with title, status, close button (~150 lines)
├── ticket_detail_info_tab.dart      # Info/details tab content (~400 lines)
├── ticket_detail_activity_tab.dart  # Activity feed tab (~400 lines)
├── ticket_detail_edit_form.dart     # Edit mode form fields (~350 lines)
├── ticket_comment_section.dart      # Comment input and list (~300 lines)
├── ticket_attachment_section.dart   # Attachment upload/display (~250 lines)
└── ticket_status_actions.dart       # Status change buttons/dialogs (~200 lines)
```

#### Extraction Steps

1. **Create `ticket_detail_header.dart`**
   - Extract: `_buildHeader()` method and related widgets
   - Includes: Close button, title, status badge, action menu

2. **Create `ticket_detail_info_tab.dart`**
   - Extract: `_DetailsTab` private class and its children
   - Includes: Field display, metadata, assignee info

3. **Create `ticket_detail_activity_tab.dart`**
   - Extract: `_ActivityItemWidget`, `_ActivityBubble`, activity list logic
   - Includes: Activity feed rendering, timeline display

4. **Create `ticket_detail_edit_form.dart`**
   - Extract: All TextEditingControllers, form fields, validation
   - Includes: Edit mode toggle, save/cancel actions

5. **Create `ticket_comment_section.dart`**
   - Extract: `_CommentInputSection`, comment list rendering
   - Includes: Mentionable input, comment threading

6. **Create `ticket_attachment_section.dart`**
   - Extract: Attachment upload, display, delete logic
   - Includes: Image viewer overlay

7. **Update `ticket_detail_drawer.dart`**
   - Keep: Main drawer shell, tab navigation, state coordination
   - Import and compose the extracted widgets

#### Dependencies to Preserve

```dart
// These state dependencies must be passed to child widgets:
late final TaskDetailState _state;
late final TaskListState _listState;
late final MembersState _membersState;
```

---

### 1.2 Split `admin_screens.dart` (1,958 lines)

**Current State**: 7 screen classes + 21 private widget classes in one file.

**Target State**: Separate file per screen, shared widgets extracted.

#### New File Structure

```
lib/features/admin/screens/
├── admin_overview_screen.dart           # Main dashboard (~200 lines)
├── admin_company_management_screen.dart # Company/org management (~300 lines)
├── admin_gap_analysis_screen.dart       # Gap analysis view (~350 lines)
├── admin_metrics_screen.dart            # Metrics/analytics (~250 lines)
├── admin_sso_screen.dart                # SSO configuration (~200 lines)
├── admin_prompts_screen.dart            # AI prompts management (~250 lines)
└── admin_generations_screen.dart        # Generation history (~200 lines)

lib/features/admin/widgets/
├── admin_nav_rail.dart                  # Side navigation rail (~100 lines)
├── company_row.dart                     # Company list item (~80 lines)
├── generation_card.dart                 # Generation display card (~100 lines)
├── field_completeness_card.dart         # Completeness indicator (~80 lines)
├── filter_sheet.dart                    # Filter bottom sheet (~120 lines)
└── info_row.dart                        # Key-value info display (~50 lines)
```

#### Extraction Steps

1. **Identify screen boundaries** in current file:
   - Look for `class _*Screen extends StatefulWidget` patterns
   - Each becomes its own file

2. **Extract shared widgets first**:
   - `_CompanyRow` → `company_row.dart`
   - `_GenerationCard` → `generation_card.dart`
   - `_FieldCompletenessCard` → `field_completeness_card.dart`
   - `_FilterSheet` → `filter_sheet.dart`
   - `_InfoRow` → `info_row.dart`

3. **Create screen files**:
   - Move each `_*Screen` class to its own file
   - Remove underscore prefix (make public)
   - Update imports

4. **Update routing**:
   - Update `lib/core/routing/app_router.dart` to import new screen files
   - Update `lib/core/routing/routes.dart` if needed

---

### 1.3 Move Ticket Drawers to Correct Directory

**Current State**: Drawers incorrectly placed in `screens/` directory.

**Target State**: All drawers in `widgets/` directory (consistent with assets feature).

#### Files to Move

```bash
# From:
lib/features/tickets/screens/create_ticket_drawer.dart
lib/features/tickets/screens/edit_ticket_drawer.dart
lib/features/tickets/screens/ticket_detail_drawer.dart

# To:
lib/features/tickets/widgets/create_ticket_drawer.dart
lib/features/tickets/widgets/edit_ticket_drawer.dart
lib/features/tickets/widgets/ticket_detail_drawer.dart
```

#### Steps

1. Move files using git mv (preserves history):
   ```bash
   git mv lib/features/tickets/screens/create_ticket_drawer.dart lib/features/tickets/widgets/
   git mv lib/features/tickets/screens/edit_ticket_drawer.dart lib/features/tickets/widgets/
   git mv lib/features/tickets/screens/ticket_detail_drawer.dart lib/features/tickets/widgets/
   ```

2. Update imports in:
   - `lib/features/tickets/screens/ticket_list_screen.dart`
   - `lib/features/tickets/screens/ticket_detail_screen.dart`
   - `lib/core/routing/app_router.dart`
   - Any other files importing these drawers

3. Run `flutter analyze` to catch any missed imports

---

### 1.4 Migrate AuthClient to ConnectRPC

**Current State**: Uses raw `http.post()` instead of ConnectRPC like all other clients.

**Target State**: Uses ConnectRPC transport layer consistently.

#### Current Implementation (to replace)

```dart
// lib/features/auth/data/auth_client.dart
class AuthClient {
  Future<models.User> getCurrentUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) throw Exception('Not authenticated');

    final idToken = await firebaseUser.getIdToken();
    final response = await http.post(
      Uri.parse('${AppConfig.apiBaseUrl}/moat.v1.AuthService/GetCurrentUser'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $idToken',
      },
      body: '{}',
    );
    // Manual JSON parsing...
  }
}
```

#### New Implementation

```dart
// lib/features/auth/data/auth_client.dart
@lazySingleton
class AuthClient {
  final AuthServiceClient _rpc;

  AuthClient(this._rpc);

  Future<User> getCurrentUser() async {
    final request = pb.GetCurrentUserRequest();
    final response = await _rpc.getCurrentUser(request);
    return _fromProtoUser(response.user);
  }

  User _fromProtoUser(pb.User proto) {
    return User(
      id: proto.id,
      email: proto.email,
      displayName: proto.displayName,
      // ... map all fields
    );
  }
}
```

#### Steps

1. **Create AuthServiceClient** in `lib/core/transport/auth_service_client.dart`:
   ```dart
   @lazySingleton
   class AuthServiceClient {
     final Client _client;
     AuthServiceClient(Transport transport) : _client = Client(transport);

     static const _service = '/moat.v1.AuthService';

     Future<pb.GetCurrentUserResponse> getCurrentUser(pb.GetCurrentUserRequest request) {
       return _client.unary(
         Spec<pb.GetCurrentUserRequest, pb.GetCurrentUserResponse>(
           '$_service/GetCurrentUser',
           StreamType.unary,
           pb.GetCurrentUserRequest.create,
           pb.GetCurrentUserResponse.create,
         ),
         request,
       );
     }
   }
   ```

2. **Update AuthClient** to inject `AuthServiceClient`

3. **Register in DI** - run `dart run build_runner build`

4. **Test authentication flow** thoroughly

---

## Phase 2: High Priority Fixes

These improve code quality and should be done within 1-2 sprints.

### 2.1 Add Proto Converters to AdminClient

**Current State**: Returns raw protobuf types, leaking implementation details.

**Target State**: Returns domain models like other clients.

#### Changes Required

```dart
// lib/features/admin/data/admin_client.dart

// Before:
Future<org.ListMembersResponse> listMembers({...})

// After:
Future<List<Member>> listMembers({...}) async {
  final response = await _orgClient.listMembers(request);
  return response.members.map(_fromProtoMember).toList();
}

Member _fromProtoMember(org.Member proto) {
  return Member(
    id: proto.id,
    email: proto.email,
    // ... map all fields
  );
}
```

#### Methods to Update

- `listMembers()` → return `List<Member>`
- `listRoles()` → return `List<Role>`
- `listLocations()` → return `List<Location>`
- `listSSODomains()` → return `List<SSODomain>`
- `listPrompts()` → return `List<Prompt>`
- `listGenerations()` → return `List<Generation>`

---

### 2.2 Rename Inconsistent Files

| Current | New | Reason |
|---------|-----|--------|
| `lib/features/explore/data/explore_service.dart` | `explore_client.dart` | Match `*_client.dart` pattern |

#### Steps

```bash
git mv lib/features/explore/data/explore_service.dart lib/features/explore/data/explore_client.dart
```

Update class name `ExploreService` → `ExploreClient` and all references.

---

### 2.3 Add State Disposal to AuthState

**Current State**: Stream subscription never cancelled.

**Target State**: Proper cleanup on disposal.

#### Implementation

```dart
// lib/features/auth/state/auth_state.dart

@lazySingleton
class AuthState {
  late final StreamSubscription<fb.User?> _authSubscription;

  AuthState(this._firebaseAuth, this._authClient, this._membersClient) {
    _authSubscription = _firebaseAuth.authStateChanges.listen(_onAuthStateChanged);
  }

  void dispose() {
    _authSubscription.cancel();
  }
}
```

**Note**: Since this is a singleton, `dispose()` is only called on app termination. However, it's good practice and helps with testing.

---

### 2.4 Fix Mixed State Management in ForgotPasswordScreen

**Current State**: Uses `setState()` alongside Signals.

**Target State**: Pure Signals.

#### Implementation

```dart
// lib/features/auth/screens/forgot_password_screen.dart

// Before:
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _emailSent = false;

  void _handleSubmit() {
    // ...
    setState(() { _emailSent = true; });
  }
}

// After:
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailSent = signal(false);

  void _handleSubmit() {
    // ...
    _emailSent.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Watch((context) {
      if (_emailSent.value) {
        return _buildSuccessView();
      }
      return _buildFormView();
    });
  }
}
```

---

## Phase 3: Medium Priority Improvements

These improve consistency and can be done opportunistically.

### 3.1 Standardize Error Types

**Goal**: Use `AppError?` everywhere instead of mixed `String?`/`AppError?`.

#### Files to Update

| File | Current | Change To |
|------|---------|-----------|
| `notification_state.dart` | `signal<String?>(null)` | `signal<AppError?>(null)` |
| `reports_state.dart` | `signal<String?>(null)` | `signal<AppError?>(null)` |

---

### 3.2 Add `batch()` to ReportsState

**Goal**: Prevent multiple rebuilds when updating many signals.

```dart
// lib/features/reports/state/reports_state.dart

// Before:
facilityMetrics.value = results[0];
assetsByDivision.value = results[1];
assetsByLocation.value = results[2];
// ... 7 more

// After:
batch(() {
  facilityMetrics.value = results[0];
  assetsByDivision.value = results[1];
  assetsByLocation.value = results[2];
  // ... 7 more
});
```

---

### 3.3 Extract ExploreService Models

**Goal**: Move inline model classes to separate file.

#### Create New File

```dart
// lib/features/explore/data/explore_models.dart

import 'package:equatable/equatable.dart';

class NLQueryResult extends Equatable {
  final CubeQuerySpec query;
  final String explanation;

  const NLQueryResult({required this.query, required this.explanation});

  @override
  List<Object?> get props => [query, explanation];
}

class CubeQuerySpec extends Equatable {
  // ... existing implementation
}

// Move all 8 model classes here
```

---

### 3.4 Replace Direct Firebase Access

**Goal**: Use injected `FirebaseAuthService` instead of `FirebaseAuth.instance`.

#### Files to Update

| File | Line | Change |
|------|------|--------|
| `auth_client.dart` | 25 | Inject `FirebaseAuthService` |
| `task_detail_state.dart` | varies | Use `_authState.firebaseUser.value` |
| `create_ticket_drawer.dart` | varies | Use injected auth state |

---

### 3.5 Fix Constructor Injection in Router

**Goal**: Consistent `getIt<T>()` access pattern.

```dart
// lib/core/routing/app_router.dart

// Before (line ~103):
GoRoute(
  path: '/assets',
  builder: (context, state) => AssetsScreen(state: getIt<AssetsState>()),
)

// After:
GoRoute(
  path: '/assets',
  builder: (context, state) => const AssetsScreen(),
)

// lib/features/assets/screens/assets_screen.dart
// Update to get state in initState():
class _AssetsScreenState extends State<AssetsScreen> {
  late final AssetsState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<AssetsState>();
  }
}
```

---

## Phase 4: Low Priority / Nice to Have

These are improvements for the future.

### 4.1 Create Shared Drawer Base Class

```dart
// lib/common_widgets/base_drawer.dart

abstract class BaseDrawer<T> extends StatefulWidget {
  final T? initialValue;
  final void Function(T result)? onComplete;

  const BaseDrawer({this.initialValue, this.onComplete, super.key});

  static Future<T?> show<T>(BuildContext context, BaseDrawer<T> drawer) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      pageBuilder: (context, animation, secondaryAnimation) => drawer,
    );
  }
}
```

### 4.2 Create AppTextFormField Widget

```dart
// lib/common_widgets/app_text_form_field.dart

class AppTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLines;

  const AppTextFormField({
    required this.label,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelMedium),
        const SizedBox(height: AppSizes.xs),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          decoration: AppDecorations.inputDecoration,
        ),
      ],
    );
  }
}
```

### 4.3 Split Large State Classes

| Current | Split Into |
|---------|------------|
| `ExploreState` (836 lines) | `ExploreState`, `SavedQueryState` |
| `AdminState` (600+ lines) | `AdminMembersState`, `AdminLocationsState`, `AdminSSOState` |
| `TaskDetailState` (448 lines) | `TaskDetailState`, `TaskCommentState` |

---

## Validation Checklist

After each phase, run:

```bash
# Type checking
flutter analyze

# Build check
flutter build web --dart-define-from-file=dart_defines/dev.env

# Run tests (when available)
flutter test
```

---

## File Size Guidelines (Going Forward)

| Type | Max Lines | Rationale |
|------|-----------|-----------|
| Screens | 500 | Easy to understand, fits in LLM context |
| Widgets | 300 | Single responsibility |
| State classes | 400 | Focused domain logic |
| Clients | 500 | OK if more for complex domains |
| Models | 200 | Pure data, minimal logic |

When a file exceeds these limits, split proactively.

---

## Naming Conventions (Reference)

| Type | Pattern | Example |
|------|---------|---------|
| Screens | `*_screen.dart` | `ticket_list_screen.dart` |
| Drawers | `*_drawer.dart` (in widgets/) | `edit_ticket_drawer.dart` |
| Dialogs | `*_dialog.dart` (in widgets/) | `confirm_dialog.dart` |
| State | `*_state.dart` | `task_list_state.dart` |
| Clients | `*_client.dart` | `task_client.dart` |
| Models | `*_models.dart` | `task_models.dart` |
| Service Clients | `*_service_client.dart` | `task_service_client.dart` |

---

## Summary

| Phase | Items | Complexity | Impact |
|-------|-------|------------|--------|
| Phase 1 | 4 | High | Critical - unblocks productivity |
| Phase 2 | 4 | Medium | High - improves consistency |
| Phase 3 | 5 | Low-Medium | Medium - cleaner code |
| Phase 4 | 3 | Low | Nice to have |

Start with Phase 1, especially splitting `ticket_detail_drawer.dart` and `admin_screens.dart`. These will have the biggest impact on maintainability.
