# Teska Boilerplate

A production-ready Flutter boilerplate with clean architecture, feature-first organization, and opinionated defaults for scalable applications.

**Dart SDK**: `^3.11.0`
**State**: Cubit (flutter_bloc)
**Routing**: GoRouter (typed)
**DI**: GetIt
**Network**: Dio

---

## Architecture

```
lib/
├── main.dart                          # Bootstrap & initialization
├── app.dart                           # MaterialApp.router configuration
├── feature/                           # Feature modules
│   ├── base/view/base_layout.dart     # Responsive layout scaffold
│   ├── splash/                        # Splash feature (cubit, view, mixin, model, service)
│   └── home/                          # Home feature with responsive layouts
├── product/                           # Shared infrastructure
│   ├── init/
│   │   ├── di/                        # GetIt service locator
│   │   ├── router/                    # GoRouter + typed routes
│   │   ├── theme/                     # Light/dark themes, colors, color scheme
│   │   ├── env/                       # Environment config (envied + .env files)
│   │   ├── network/                   # Dio client, interceptors, models
│   │   ├── localization/              # EasyLocalization config + generated keys
│   │   └── guard/                     # App initialization guard for routing
│   ├── packages/                      # Thin wrappers around third-party packages
│   │   ├── logger/                    # Debug-only logger
│   │   ├── responsive/               # Breakpoint manager (mobile/tablet/desktop)
│   │   ├── storage/                   # Secure storage + token manager
│   │   ├── toastification/           # Pre-configured toast notifications
│   │   ├── skeletonizer/             # Skeleton loading wrapper
│   │   └── preview/                  # Device preview (dev only)
│   ├── utils/
│   │   ├── constants/                 # Sizes, paddings, radius, API config
│   │   ├── extensions/               # Context, widget, color extensions
│   │   └── helpers/                   # Scroll behavior, etc.
│   ├── widget/                        # Shared widgets
│   └── entities/                      # Domain entities
└── gen/                               # Generated asset references (flutter_gen)
```

### Feature Module Convention

Each feature follows the same internal structure:

```
feature/
└── feature_name/
    ├── cubit/          # Cubit + freezed state
    ├── view/           # View + platform-specific layouts
    ├── mixin/          # View-level mixins (lifecycle, logic)
    ├── model/          # Feature-specific models
    └── service/        # Feature-specific API services
```

### Product Layer

The `product/` directory is the shared kernel. Features depend on it; it depends on nothing in `feature/`.

- **`init/`** — One-time setup: DI container, router, theme, network client, localization, guards, environment configuration.
- **`packages/`** — Wrapper classes isolating third-party dependencies. Swap implementations without touching feature code.
- **`utils/`** — Constants, extensions, helpers used across features.

---

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run code generators (routes, freezed, json, assets)
dart run build_runner build --delete-conflicting-outputs

# Generate localization keys
dart run easy_localization:generate \
  -O lib/product/init/localization \
  -f keys -o locale_keys.g.dart \
  --source-dir assets/localization

# Run the app
flutter run
```

Or use the bundled [rps](https://pub.dev/packages/rps) scripts:

```bash
rps pub_reload       # flutter clean && flutter pub get
rps build_runner     # build_runner build
rps build_watch      # build_runner watch
rps lang             # generate localization keys
```

### Environment

Environment variables are managed via [envied](https://pub.dev/packages/envied) with `.env` files. Values are obfuscated in the compiled binary for security.

```
.env.dev          # Development environment variables
.env.prod         # Production environment variables
.env.example      # Template for required variables (committed to git)
```

```
lib/product/init/env/
├── env_model.dart          # Abstract contract — all env variables defined here
├── app_environment.dart    # Enum: resolves current env + provides EnvModel
├── dev_env.dart            # Reads .env.dev via envied (obfuscated)
├── prod_env.dart           # Reads .env.prod via envied (obfuscated)
├── dev_env.g.dart          # Generated
└── prod_env.g.dart         # Generated
```

Set the environment at build time:

```bash
flutter run --dart-define=ENV=dev        # default
flutter run --dart-define=ENV=prod
flutter run --dart-define=VERSION=101
```

Access env values anywhere:

```dart
AppEnvironment.current.envModel.baseUrl;   // environment-aware base URL
AppEnvironment.current.isDev;              // environment check
AppEnvironment.current.displayName;        // "Development" / "Production"
```

**Adding a new variable:**

1. Add `KEY=VALUE` to `.env.dev` and `.env.prod`
2. Add an abstract getter to `EnvModel`
3. Add `@EnviedField(varName: 'KEY')` to `DevEnv` and `ProdEnv`
4. Run `dart run build_runner build`

**Adding a new environment (e.g. staging):**

1. Create `.env.staging`
2. Create `StagingEnv` class implementing `EnvModel`
3. Add `staging('.env.staging', 'Staging')` to `AppEnvironment` enum
4. Add the case to `envModel` getter
5. Run `dart run build_runner build`

---

## Key Decisions

### State Management — Cubit + Freezed

States are immutable freezed classes. Cubits expose methods, emit new states via `copyWith()`. No events, no boilerplate.

```dart
@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
  }) = _HomeState;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
}
```

### Routing — Typed GoRouter

Routes are declared with `@TypedGoRoute` and code-generated. Navigation is type-safe:

```dart
@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData { ... }

// Navigate
const HomeRoute().go(context);
```

An `AppInitializationGuard` redirects all routes to splash until initialization completes.

### Dependency Injection — GetIt

`BaseContainer` (aliased `BC`) registers lazy singletons. Access via static getters:

```dart
BC.setupLocator();

// Usage
BC.networkManager;
BC.tokenStorageManager;
BC.splashCubit;
```

### Network — Dio

`NetworkManager` is a singleton Dio wrapper with generic, type-safe methods:

```dart
final response = await NetworkManager.instance.get<RequestModel, ResponseModel>(
  ApiEndpoints.users.withPathParams([PathParameterModel(key: 'id', value: '1')]),
  model: ResponseModel(),
);
```

- `NetworkInterceptor` auto-attaches Bearer tokens from secure storage.
- `BaseResponseModel` wraps all responses.
- `INetworkModel<T>` interface enforces `toJson()`/`fromJson()` on models.
- Timeouts: 15s connect, 15s receive.

### Responsive Design

Three breakpoints via `ResponsiveManager`:

| Layout  | Width      |
|---------|------------|
| Mobile  | 0–800px    |
| Tablet  | 801–1024px |
| Desktop | 1025px+    |

`BaseLayout` renders the appropriate child. Falls back: desktop → tablet → mobile.

```dart
BaseLayout(
  mobile: (context) => MobileLayout(),
  tablet: (context) => TabletLayout(),   // optional
  desktop: (context) => DesktopLayout(), // optional
)
```

### Design Tokens

**Spacing** (`AppSizes`): 0, 1, 2, 4, 6, 8, 10, 12, 16, 20, 24, 28, 32, 36, 40, 48, 56, 60, 64, 72, 80, 88, 96, 100

**Padding** (`AppPaddings`): Pre-built `EdgeInsets` — `all8`, `hor16`, `ver12`, `top24`, `bottom32`, etc.

**Radius** (`AppRadius`): Pre-built `BorderRadius` — `all8`, `topLeft16`, `bottomRight12`, etc.

Use these instead of raw literals for consistency.

### Extensions

Context:
```dart
context.teska.screenWidth
context.teska.h(50)           // 50% of screen height
context.teska.isDarkMode
context.teska.isMobileLayout
context.textTheme
```

Widget:
```dart
widget.teska.center
widget.teska.expanded
widget.teska.sliverAdapter
widget.teska.toDisable(isDisabled: true)
```

Color:
```dart
color.teska.opacity(0.5)
```

---

## Code Generation

This project relies on code generation for routes, models, localization keys, and asset references.

| Generator             | Output                  | Purpose                        |
|-----------------------|-------------------------|--------------------------------|
| `go_router_builder`   | `app_routes.g.dart`     | Typed route classes            |
| `freezed`             | `*.freezed.dart`        | Immutable state/model classes  |
| `json_serializable`   | `*.g.dart`              | JSON serialization             |
| `envied_generator`    | `*_env.g.dart`          | Obfuscated env variable access |
| `flutter_gen_runner`  | `gen/assets.gen.dart`   | Type-safe asset references     |
| `easy_localization`   | `locale_keys.g.dart`    | Translation key constants      |

After modifying annotated classes, routes, assets, or translations:

```bash
rps build_runner   # or: dart run build_runner build --delete-conflicting-outputs
rps lang           # for localization keys only
```

---

## Adding a New Feature

1. Create the directory under `lib/feature/your_feature/` with `cubit/`, `view/`, `model/`, `service/`, `mixin/` subdirectories.
2. Define the state with `@freezed` and create the cubit.
3. Register the cubit in `BaseContainer` if it needs to be shared.
4. Add a `@TypedGoRoute` in `app_routes.dart` and run `rps build_runner`.
5. Build the view using `BaseLayout` for responsive support.

---

## Localization

Translations live in `assets/localization/`. Currently ships with `en.json`.

```json
{
  "common": {
    "yes": "Yes",
    "no": "No"
  },
  "feature_name": {
    "title": "..."
  }
}
```

Add a new locale:
1. Create `assets/localization/tr.json`.
2. Add `Locale('tr')` to `LocalizationManager.supportedLocales`.
3. Run `rps lang` to regenerate keys.
4. Use: `LocaleKeys.common_yes.tr()`

---

## Dependencies

### Runtime
| Package                  | Purpose                          |
|--------------------------|----------------------------------|
| `envied`                 | Obfuscated .env file reader      |
| `flutter_bloc`           | State management (Cubit)         |
| `get_it`                 | Service locator / DI             |
| `go_router`              | Declarative routing              |
| `dio`                    | HTTP client                      |
| `freezed_annotation`     | Immutable data class annotations |
| `json_annotation`        | JSON serialization annotations   |
| `easy_localization`      | i18n                             |
| `flutter_secure_storage` | Encrypted key-value storage      |
| `responsive_framework`   | Responsive breakpoints           |
| `skeletonizer`           | Skeleton loading UI              |
| `toastification`         | Toast notifications              |
| `logger`                 | Formatted console logging        |
| `equatable`              | Value equality                   |
| `device_preview`         | Device preview overlay (dev)     |
| `flutter_svg`            | SVG rendering                    |
| `lottie`                 | Lottie animation rendering       |
| `flutter_gen`            | Asset code generation runtime    |

### Dev
| Package                | Purpose                          |
|------------------------|----------------------------------|
| `build_runner`         | Code generation orchestrator     |
| `envied_generator`     | Env variable code generation     |
| `go_router_builder`    | Typed route generation           |
| `freezed`              | Immutable class generation       |
| `json_serializable`    | JSON serialization generation    |
| `flutter_gen_runner`   | Asset reference generation       |
| `very_good_analysis`   | Lint rules                       |
| `rps`                  | Script runner                    |

---

## Linting

Uses [very_good_analysis](https://pub.dev/packages/very_good_analysis) for strict lint rules. Check `analysis_options.yaml` for overrides.

```bash
dart analyze
```
