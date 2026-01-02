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

### State Management
- Use `signal<T>()` for reactive state
- Use `computed()` for derived values
- Use `batch()` to group updates
- All state classes are `@lazySingleton`

### Error Handling
```dart
final result = await _client.operation().toResult();
result.when(
  ok: (data) => { /* success */ },
  error: (e) => error.value = e,
);
```

### UI Reactivity
```dart
Watch((context) {
  // Rebuilds when accessed signals change
  return Text(_state.count.value.toString());
})
```

### Styling
- Use `AppColors` for colors
- Use `AppTextStyles` for typography
- Use `AppSizes` for spacing/padding
