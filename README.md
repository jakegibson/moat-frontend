# Moat v1 Flutter Frontend

Flutter application using Signals for state management and ConnectRPC for API communication.

## Project Structure

```
lib/
├── core/                    # Shared infrastructure
│   ├── config/              # Environment configuration
│   ├── di/                  # Dependency injection (get_it + injectable)
│   │   └── modules/         # DI module definitions
│   ├── routing/             # GoRouter configuration
│   ├── theme/               # Material 3 theming
│   ├── utils/               # Helpers (Result, AppError, AsyncState)
│   └── widgets/             # Shared widgets (ErrorView, LoadingView)
│
├── features/                # Feature modules
│   ├── auth/                # Authentication feature
│   │   ├── data/            # AuthClient (API calls)
│   │   ├── state/           # AuthState (signals)
│   │   ├── screens/         # LoginScreen
│   │   └── widgets/         # Auth-specific widgets
│   │
│   └── assets/              # Assets feature
│       ├── data/            # AssetsClient
│       ├── state/           # AssetsState
│       ├── screens/         # AssetsScreen, AssetDetailScreen
│       └── widgets/         # AssetTile, etc.
│
├── gen/                     # Generated code
│   └── proto/               # ConnectRPC generated Dart
│
└── main.dart                # App entry point
```

## Key Patterns

### State Management (Signals)

```dart
// State class with signals
class AssetsState {
  final assets = signal<List<Asset>>([]);
  final isLoading = signal(false);
  final error = signal<AppError?>(null);

  // Computed values
  late final activeAssets = computed(
    () => assets.value.where((a) => a.status == 'active').toList(),
  );

  // Actions
  Future<void> fetchAssets() async {
    isLoading.value = true;
    // ...
  }
}
```

### Widget Integration

```dart
// In widgets, use Watch to react to signal changes
Watch((context) {
  final isLoading = state.isLoading.value;
  final assets = state.assets.value;

  if (isLoading) return LoadingView();
  return ListView.builder(...);
});
```

### Error Handling (Result Type)

```dart
// Convert futures to Result
final result = await client.listAssets().toResult();

result.when(
  ok: (assets) => state.assets.value = assets,
  error: (e) => state.error.value = e,
);
```

### Dependency Injection

```dart
// Access dependencies via getIt
final assetsState = getIt<AssetsState>();

// Or inject in constructors with @lazySingleton
@lazySingleton
class AssetsState {
  final AssetsClient _client;
  AssetsState(this._client);
}
```

## Environment Configuration

Create environment files in `dart_defines/`:

```env
# dart_defines/dev.env
API_BASE_URL=http://localhost:8080
FIREBASE_PROJECT=moat-dev
ENVIRONMENT=dev
```

Run with environment:

```bash
flutter run --dart-define-from-file=dart_defines/dev.env
```

## Code Generation

Generate injectable config:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Generate proto clients (run from monorepo root):

```bash
buf generate
```

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Generate code:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. Create environment file:
   ```bash
   mkdir dart_defines
   echo "API_BASE_URL=http://localhost:8080" > dart_defines/dev.env
   echo "ENVIRONMENT=dev" >> dart_defines/dev.env
   ```

4. Run the app:
   ```bash
   flutter run --dart-define-from-file=dart_defines/dev.env
   ```

## Documentation

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Detailed patterns, state management, styling, and how to add new features
- **[FEATURE_AUDIT.md](FEATURE_AUDIT.md)** - Feature implementation status and completion tracking
- **[VERIFICATION.md](VERIFICATION.md)** - Screen navigation and design verification guide
