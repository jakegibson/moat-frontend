# Remaining Refactoring Tasks

This document details the three deferred tasks from the refactoring plan.

## Progress Summary

**Completed: 13/16 tasks**

| Phase | Task | Status |
|-------|------|--------|
| 1.1 | Split ticket_detail_drawer.dart (3,247 → 6 files) | Done |
| 1.2 | Split admin_screens.dart (1,958 → 7 files) | Done |
| 1.3 | Move ticket drawers to widgets/ | Done |
| 1.4 | Migrate AuthClient to ConnectRPC | Done |
| 2.2 | Rename explore_service.dart to explore_client.dart | Done |
| 2.3 | Add dispose() to AuthState | Done |
| 2.4 | Fix mixed state in ForgotPasswordScreen | Done |
| 3.2 | Add batch() to ReportsState | Done |
| 3.3 | Extract ExploreService Models | Done |
| 3.4 | Replace Direct Firebase Access | Done |
| 3.5 | Fix Constructor Injection in Router | Done |
| 4.1 | Shared Drawer Base Class (DrawerShell exists) | Done |
| 4.2 | Create AppTextFormField Widget | Done |

---

## 1. Phase 2.1: Add Proto Converters to AdminClient

### Current Issue

The `AdminClient` returns raw protobuf types directly to the UI layer:

```dart
// Current: Returns protobuf types
Future<org.ListMembersResponse> listMembers(...) {
  return _orgClient.listMembers(org.ListMembersRequest(...));
}
```

This means UI code must work with generated protobuf objects (`org.Member`, `admin.Prompt`, etc.) instead of clean domain models. The protobuf types:
- Have verbose naming (`proto.hasField()` checks)
- Lack domain-specific helper methods
- Couple UI to transport layer

### Task Scope

**6 methods to convert**, each requiring:
- A domain model class (e.g., `Member`, `Role`, `Location`, `SSODomain`, `Prompt`, `Generation`)
- A `_fromProto*()` converter function
- Updated return types

| Method | Current Return | Target Return |
|--------|----------------|---------------|
| `listMembers()` | `org.ListMembersResponse` | `List<Member>` |
| `listRoles()` | `org.ListRolesResponse` | `List<Role>` |
| `listLocations()` | `org.ListLocationsResponse` | `List<Location>` |
| `listSSODomains()` | `admin.ListSSODomainsResponse` | `List<SSODomain>` |
| `listPrompts()` | `admin.ListPromptsResponse` | `List<Prompt>` |
| `listGenerations()` | `admin.ListGenerationsResponse` | `List<Generation>` |

### Implementation

```dart
// lib/features/admin/data/admin_models.dart (create new file)

class Member {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final List<String> roleIds;
  final List<String> locationIds;
  // ... other fields

  Member({required this.id, required this.email, ...});
}

// Similar for Role, Location, SSODomain, Prompt, Generation
```

```dart
// lib/features/admin/data/admin_client.dart (update)

Future<List<Member>> listMembers(...) async {
  final response = await _orgClient.listMembers(request);
  return response.members.map(_fromProtoMember).toList();
}

Member _fromProtoMember(org.Member proto) {
  return Member(
    id: proto.id,
    email: proto.email,
    firstName: proto.firstName,
    lastName: proto.lastName,
    roleIds: proto.roleIds.toList(),
    locationIds: proto.locationIds.toList(),
  );
}
```

### Benefits

- **Cleaner UI code**: Widgets work with simple Dart classes, not protobuf types
- **Encapsulation**: Transport layer details hidden from feature code
- **Consistency**: Matches pattern already used in `AuthClient`, `TaskClient`, `AssetsClient`
- **Testability**: Domain models are easier to mock than protobuf types

---

## 2. Phase 3.1: Standardize Error Types

### Current Issue

Error signals use inconsistent types across state classes:

```dart
// Some use String?
final error = signal<String?>(null);  // auth_state.dart, reports_state.dart,
                                       // notification_state.dart, explore_state.dart

// Others use AppError?
final error = signal<AppError?>(null); // assets_state.dart, task_list_state.dart,
                                        // members_state.dart, roles_state.dart, etc.
```

This inconsistency means:
- Error widgets must handle both types differently
- No structured error codes for retry logic or analytics
- String errors lose context (was it a network error? auth error? validation error?)

### Task Scope

**4 files to update**:

| File | Current | Change To |
|------|---------|-----------|
| `auth_state.dart` | `signal<String?>(null)` | `signal<AppError?>(null)` |
| `reports_state.dart` | `signal<String?>(null)` | `signal<AppError?>(null)` |
| `notification_state.dart` | `signal<String?>(null)` | `signal<AppError?>(null)` |
| `explore_state.dart` | `signal<String?>(null)` | `signal<AppError?>(null)` |

### Implementation

```dart
// Before:
} catch (e) {
  error.value = e.toString();
}

// After:
} catch (e) {
  error.value = AppError.from(e);
}
```

Each change requires updating:
- Error assignment sites
- UI error display logic (if checking `.message` vs direct string)

### Benefits

- **Unified error handling**: Single pattern across all features
- **Structured errors**: `AppError` has `code`, `message`, `cause` fields for programmatic handling
- **Better UX**: Can show retry buttons for network errors, different messaging for auth errors
- **Analytics**: Can track error types systematically

---

## 3. Phase 4.3: Split Large State Classes

### Current Issue

Three state classes exceed recommended size limits (300-400 lines):

| File | Lines | Responsibility Overload |
|------|-------|-------------------------|
| `explore_state.dart` | **836** | NL queries + saved queries + templates + chart data + cube schema |
| `admin_state.dart` | **741** | Members + roles + locations + SSO + prompts + generations + stats |
| `task_detail_state.dart` | **448** | Task data + comments + activity + attachments + status updates |

Large state classes:
- Are harder for new developers to understand
- Mix unrelated concerns (e.g., saved queries vs NL translation)
- Make testing more complex
- Increase cognitive load when debugging

### Task Scope

| Current | Split Into | Reason |
|---------|------------|--------|
| `ExploreState` (836 lines) | `ExploreState` + `SavedQueryState` | Saved queries are distinct feature |
| `AdminState` (741 lines) | `AdminMembersState` + `AdminLocationsState` + `AdminSSOState` | Each admin tab is independent |
| `TaskDetailState` (448 lines) | `TaskDetailState` + `TaskCommentState` | Comments have separate lifecycle |

### Implementation Steps

For each split:

1. **Create new state class file**
   ```dart
   // lib/features/explore/state/saved_query_state.dart
   @lazySingleton
   class SavedQueryState {
     // Move saved query signals and methods here
   }
   ```

2. **Move relevant signals and methods** from parent class

3. **Update DI registration** - run `flutter pub run build_runner build`

4. **Update screen imports** to use new state classes

5. **Inject new state** where needed (screens may need both states)

### Benefits

- **Single Responsibility**: Each class handles one cohesive concern
- **Easier onboarding**: New devs can understand smaller, focused classes
- **Better testability**: Test comment logic without loading full task state
- **LLM-friendly**: Smaller files fit in context windows, enabling better AI assistance
- **Team scaling**: Different devs can work on different state classes without conflicts

---

## Effort Estimates

| Task | Effort | Risk | Impact |
|------|--------|------|--------|
| 2.1 Proto Converters | Medium (6 models + converters) | Low | High - cleaner architecture |
| 3.1 Error Types | Low (4 files) | Medium - UI changes needed | Medium - consistency |
| 4.3 Split State | High (3 classes, ~2000 lines total) | Medium - many touchpoints | High - maintainability |

---

## Recommended Order

1. **Phase 3.1** (Error Types) - Lowest effort, improves consistency
2. **Phase 2.1** (Proto Converters) - Medium effort, high architectural value
3. **Phase 4.3** (Split State) - Highest effort, do incrementally (one class at a time)
