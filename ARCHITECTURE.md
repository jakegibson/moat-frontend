# Frontend Architecture

## Directory Structure

```
lib/
├── core/                    # Cross-cutting concerns
│   ├── di/                  # GetIt + Injectable setup
│   ├── routing/             # GoRouter configuration
│   ├── styles/              # Colors, text styles, sizes
│   └── utils/               # Result, AppError types
├── features/                # Feature modules
│   └── [feature]/
│       ├── data/            # API clients + models
│       ├── state/           # Signals state management
│       ├── screens/         # Full-page screens
│       └── widgets/         # Feature-specific widgets
├── common_widgets/          # Shared UI components
└── gen/                     # Generated proto code
```

## Adding a New Feature

### 1. Create Data Layer

```dart
// data/my_feature_client.dart
@lazySingleton
class MyFeatureClient {
  final MyFeatureServiceClient _rpc;

  MyFeatureClient(this._rpc);

  Future<Item> createItem({required String name}) async {
    final request = CreateItemRequest(name: name);
    final response = await _rpc.createItem(request);
    return _fromProto(response);
  }

  Item _fromProto(pb.Item proto) => Item(
    id: proto.id,
    name: proto.name,
  );
}
```

```dart
// data/my_feature_models.dart
class Item extends Equatable {
  final String id;
  final String name;

  const Item({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
```

### 2. Create State Layer

```dart
// state/my_feature_state.dart
@lazySingleton
class MyFeatureState {
  final MyFeatureClient _client;

  MyFeatureState(this._client);

  // Core signals
  final items = signal<List<Item>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);

  // Computed values
  late final itemCount = computed(() => items.value.length);

  // Operations
  Future<void> fetchItems() async {
    isLoading.value = true;
    error.value = null;

    final result = await _client.listItems().toResult();
    result.when(
      ok: (data) => items.value = data,
      error: (e) => error.value = e,
    );

    isLoading.value = false;
  }
}
```

### 3. Create Screen

```dart
// screens/my_feature_screen.dart
class MyFeatureScreen extends StatefulWidget {
  const MyFeatureScreen({super.key});

  @override
  State<MyFeatureScreen> createState() => _MyFeatureScreenState();
}

class _MyFeatureScreenState extends State<MyFeatureScreen> {
  late final MyFeatureState _state;

  @override
  void initState() {
    super.initState();
    _state = getIt<MyFeatureState>();
    _state.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Watch((context) {
        if (_state.isLoading.value) return const LoadingView();
        if (_state.error.value != null) return ErrorView(_state.error.value!);
        return ListView(
          children: _state.items.value.map((item) => Text(item.name)).toList(),
        );
      }),
    );
  }
}
```

### 4. Register Dependencies

Run after adding `@lazySingleton` decorators:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Add Routes

```dart
// core/routing/routes.dart
abstract class Routes {
  static const myFeature = '/my-feature';
}

extension AppRouterExtensions on BuildContext {
  void goToMyFeature() => go(Routes.myFeature);
}

// In appRouter configuration
GoRoute(
  path: Routes.myFeature,
  builder: (context, state) => const MyFeatureScreen(),
),
```

## Key Patterns

### State Management with Signals

All state classes follow a consistent pattern using the Signals library for reactivity.

#### Signal Access Pattern

**IMPORTANT**: All signals are public and accessed using `.value`:

```dart
// In state class - expose public signals
final items = signal<List<Item>>([]);
final isLoading = signal(false);
final error = signal<AppError?>(null);

// In widgets - always use .value
Watch((context) {
  final items = state.items.value;      // ✅ Correct
  final loading = state.isLoading.value; // ✅ Correct

  // The Watch widget detects .value accesses and rebuilds
  // when any accessed signal changes
});
```

#### Batch Updates

When updating multiple signals together, use `batch()` to trigger a single rebuild:

```dart
// Without batch - 3 rebuilds
items.value = newItems;
totalCount.value = total;
hasMore.value = moreAvailable;

// With batch - 1 rebuild
batch(() {
  items.value = newItems;
  totalCount.value = total;
  hasMore.value = moreAvailable;
});
```

**When to use batch:**
- Updating pagination state (items + offset + hasMore)
- Resetting filters (multiple filter signals)
- Loading data (set data + clear error + update loading)

See: `TaskListState.fetchTasks()` for a real example.

#### Computed Values

Use `computed()` for values derived from other signals:

```dart
// Automatically recomputes when dependencies change
late final itemCount = computed(() => items.value.length);

late final openItems = computed(
  () => items.value.where((i) => i.isOpen).toList(),
);

late final hasFilters = computed(
  () => statusFilter.value.isNotEmpty ||
        searchQuery.value.isNotEmpty,
);
```

**Note**: Use `late final` to ensure computed signals are created once.

#### Optimistic Updates

For better UX, update the UI before the API call completes:

```dart
Future<Result<Item>> updateItem(Item updated) async {
  // 1. Save current state for rollback
  final previousItems = items.value;

  // 2. Update UI immediately
  items.value = items.value.map((i) =>
    i.id == updated.id ? updated : i
  ).toList();

  // 3. Call API
  final result = await _client.updateItem(updated).toResult();

  result.when(
    ok: (item) {
      // 4. Confirm with server response
      items.value = items.value.map((i) =>
        i.id == item.id ? item : i
      ).toList();
    },
    error: (e) {
      // 5. Rollback on error
      items.value = previousItems;
      error.value = e;
    },
  );

  return result;
}
```

See: `AssetsState.updateAsset()` for a real example.

#### State Class Structure

All state classes follow this structure:

```dart
@lazySingleton
class MyFeatureState {
  final MyFeatureClient _client;

  MyFeatureState(this._client);

  // ==========================================================================
  // Core State
  // ==========================================================================

  final items = signal<List<Item>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);

  // ==========================================================================
  // Pagination (if applicable)
  // ==========================================================================

  final currentOffset = signal(0);
  final hasMore = signal(true);
  static const pageSize = 50;

  // ==========================================================================
  // Filters (if applicable)
  // ==========================================================================

  final statusFilter = signal<List<Status>>([]);
  final searchQuery = signal('');

  // ==========================================================================
  // Computed Values
  // ==========================================================================

  late final itemCount = computed(() => items.value.length);
  late final hasFilters = computed(() => statusFilter.value.isNotEmpty);

  // ==========================================================================
  // Operations
  // ==========================================================================

  Future<void> fetchItems({bool refresh = false}) async {
    // Implementation
  }
}
```

#### State Delegation Pattern

For large state classes (>400 lines), split into focused sub-states using delegation:

```dart
// Parent state delegates to child state
@lazySingleton
class AdminState {
  final AdminClient _client;
  final AdminOrgState _orgState;  // Injected child state

  AdminState(this._client, this._orgState);

  // Delegate signals (maintain backward compatibility)
  Signal<List<Member>> get members => _orgState.members;
  Signal<bool> get isLoadingMembers => _orgState.isLoadingMembers;

  // Delegate methods
  Future<void> fetchMembers({bool refresh = false}) =>
      _orgState.fetchMembers(refresh: refresh);

  // Keep unrelated concerns here (SSO, prompts, etc.)
  final ssoDomains = signal<List<SSODomain>>([]);
}

// Child state handles one cohesive domain
@lazySingleton
class AdminOrgState {
  final AdminClient _client;

  AdminOrgState(this._client);

  final members = signal<List<Member>>([]);
  final isLoadingMembers = signal(false);

  Future<void> fetchMembers({bool refresh = false}) async {
    // Implementation
  }
}
```

**Current delegated state classes:**
- `AdminState` → `AdminOrgState` (members, locations, roles, permissions)
- `ExploreState` → `DashboardState` (dashboards, saved queries)

### Error Handling

#### Result Type

All API calls return a `Result<T>` which forces explicit error handling:

```dart
final result = await _client.operation().toResult();

result.when(
  ok: (data) => items.value = data,
  error: (e) => error.value = e,
);
```

#### AppError

Errors are mapped to semantic types in `AppError`:

```dart
sealed class AppError {
  factory AppError.fromException(Object error) {
    if (error is ConnectException) {
      return switch (error.code) {
        Code.notFound => NotFoundError(error.message),
        Code.permissionDenied => PermissionError(error.message),
        // ...
      };
    }
    return UnknownError(error.toString());
  }
}
```

#### UI Error Display

Use `ErrorView` widget for consistent error display:

```dart
Watch((context) {
  final error = state.error.value;
  final items = state.items.value;

  if (error != null && items.isEmpty) {
    return ErrorView(
      error: error,
      onRetry: () => state.fetchItems(refresh: true),
    );
  }

  return ListView(...);
});
```

### UI Reactivity

#### Watch Widget

Use `Watch` to rebuild UI when signals change:

```dart
Watch((context) {
  // Any signal accessed with .value inside this callback
  // will cause a rebuild when it changes
  final items = state.items.value;
  final loading = state.isLoading.value;

  if (loading) return const CircularProgressIndicator();
  return ListView(children: items.map(...).toList());
});
```

#### Multiple Watch Widgets

Prefer multiple `Watch` widgets to minimize rebuilds:

```dart
Column(
  children: [
    // Only rebuilds when items change
    Watch((context) => Text('Count: ${state.items.value.length}')),

    // Only rebuilds when loading changes
    Watch((context) => state.isLoading.value
      ? const LinearProgressIndicator()
      : const SizedBox.shrink(),
    ),
  ],
)
```

### Styling

#### Semantic Tokens (Recommended)

Use semantic tokens from `semantic_tokens.dart` for easier style selection:

```dart
import 'package:moat/core/styles/semantic_tokens.dart';

// Text styles by purpose
Text('Page Title', style: Semantic.pageTitle),
Text('Card Title', style: Semantic.cardTitle),
Text('Description', style: Semantic.body),
Text('Caption', style: Semantic.caption),

// Colors by purpose
Container(color: SemanticColors.bgCard),
Text('Error', style: TextStyle(color: SemanticColors.error)),

// Spacing by purpose
Padding(padding: EdgeInsets.all(SemanticSpacing.cardPadding)),
SizedBox(height: SemanticSpacing.formGap),

// Border radius
borderRadius: BorderRadius.circular(SemanticRadius.card),
```

**Quick Reference:**

| Text Purpose | Semantic Token |
|--------------|----------------|
| Page titles | `Semantic.pageTitle` |
| Card/section titles | `Semantic.cardTitle` |
| Form labels | `Semantic.formLabel` |
| Body text | `Semantic.body` |
| Small text | `Semantic.bodySmall` |
| Buttons | `Semantic.buttonText` |
| Captions | `Semantic.caption` |
| Errors | `Semantic.error` |

#### Raw Tokens (When needed)

For cases not covered by semantic tokens:

**Colors** (`AppColors`):
```dart
AppColors.textPrimary    // Main text color
AppColors.textSecondary  // Secondary/muted text
AppColors.bgPrimary      // Main background
AppColors.bgSecondary    // Card/section backgrounds
```

**Text Styles** (`AppTextStyles`):
```dart
AppTextStyles.textMDSemiBold  // Medium body, semibold
AppTextStyles.textSM          // Small body
AppTextStyles.textXLSemibold  // Large headers
```

**Spacing** (`AppSizes`):
```dart
AppSizes.spacingSM   // 4px
AppSizes.spacingMD   // 8px
AppSizes.spacingLG   // 12px
AppSizes.spacingXL   // 16px
AppSizes.spacing2XL  // 24px
```

### Dependency Injection

#### Registration

All state and client classes use `@lazySingleton`:

```dart
@lazySingleton
class MyFeatureState {
  // Created once, reused everywhere
}
```

#### Access

Get dependencies via `getIt`:

```dart
final state = getIt<MyFeatureState>();
```

#### Regenerating

After adding/changing DI decorators:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Testing Strategy

### Test Types Overview

| Test Type | Location | Purpose | Speed |
|-----------|----------|---------|-------|
| Unit Tests | `test/` | State classes, utils, models | Fast |
| Widget Tests | `test/` | Individual widget behavior | Fast |
| Integration Tests | `integration_test/` | Full user flows with auth | Slow |

### Unit Tests

Test state classes by mocking the client:

```dart
// test/features/my_feature/state/my_feature_state_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMyFeatureClient extends Mock implements MyFeatureClient {}

void main() {
  late MockMyFeatureClient mockClient;
  late MyFeatureState state;

  setUp(() {
    mockClient = MockMyFeatureClient();
    state = MyFeatureState(mockClient);
  });

  group('fetchItems', () {
    test('updates items on success', () async {
      when(() => mockClient.listItems())
          .thenAnswer((_) async => [testItem]);

      await state.fetchItems();

      expect(state.items.value, [testItem]);
      expect(state.isLoading.value, false);
      expect(state.error.value, isNull);
    });

    test('sets error on failure', () async {
      when(() => mockClient.listItems())
          .thenThrow(Exception('Network error'));

      await state.fetchItems();

      expect(state.items.value, isEmpty);
      expect(state.error.value, isNotNull);
    });
  });
}
```

### Widget Tests

Test widgets in isolation with mock state:

```dart
// test/features/my_feature/widgets/item_card_test.dart
void main() {
  testWidgets('displays item name', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ItemCard(item: Item(id: '1', name: 'Test')),
      ),
    );

    expect(find.text('Test'), findsOneWidget);
  });
}
```

### Integration Tests

Full user flows with real auth and API:

```dart
// integration_test/ticket_list_test.dart
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture_ticket_list', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Login if needed
    if (find.text('Sign in').evaluate().isNotEmpty) {
      await tester.enterText(find.byType(TextField).first, testEmail);
      await tester.enterText(find.byType(TextField).at(1), testPassword);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
      await tester.pumpAndSettle(const Duration(seconds: 10));
    }

    await binding.takeScreenshot('ticket_list');
  });
}
```

### Running Tests

```bash
# Unit and widget tests
flutter test

# Specific test file
flutter test test/features/assets/state/assets_state_test.dart

# Integration tests (requires chromedriver)
chromedriver --port=4444 &
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/ticket_list_test.dart \
  --dart-define-from-file=dart_defines/test.env \
  -d web-server --web-port=3505
```

### Test Patterns

#### Testing Signals State

When testing state classes with signals:

```dart
test('batch updates signals correctly', () async {
  await state.fetchItems();

  // Verify all batch-updated signals
  expect(state.items.value, hasLength(5));
  expect(state.currentOffset.value, 0);
  expect(state.hasMore.value, true);
});
```

#### Testing Computed Values

```dart
test('computed value updates', () {
  state.items.value = [item1, item2, item3];

  expect(state.itemCount.value, 3);
  expect(state.hasItems.value, true);
});
```

#### Testing Optimistic Updates

```dart
test('optimistic update with rollback on error', () async {
  when(() => mockClient.updateItem(any()))
      .thenThrow(Exception('Network error'));

  state.items.value = [originalItem];
  await state.updateItem(updatedItem);

  // Should rollback to original
  expect(state.items.value.first, originalItem);
  expect(state.error.value, isNotNull);
});
```

### Visual Verification

For design verification against Figma, see `VERIFICATION.md`.

Key commands:
- `flutter drive ... --target=integration_test/screenshot_test.dart` - Capture all screens
- Screenshots saved to `frontend/screenshots/`
