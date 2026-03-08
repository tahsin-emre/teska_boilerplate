# Teska Boilerplate

Clean architecture, feature-first organizasyon ve ölçeklenebilir uygulamalar için hazır varsayılanlarla gelen, production-ready Flutter boilerplate.

**Dart SDK**: `^3.11.0` · **State**: Cubit (flutter_bloc) · **Routing**: GoRouter (typed) · **DI**: GetIt · **Network**: Dio

---

## Mimari

```
lib/
├── main.dart                          # Bootstrap & başlatma
├── app.dart                           # MaterialApp.router yapılandırması
├── feature/                           # Feature modülleri
│   ├── base/view/base_layout.dart     # Responsive layout iskeleti
│   ├── splash/                        # Splash feature (cubit, view, mixin, model, service)
│   └── home/                          # Responsive layout'lu home feature
├── product/                           # Paylaşılan altyapı
│   ├── init/
│   │   ├── di/                        # GetIt service locator
│   │   ├── router/                    # GoRouter + typed route'lar
│   │   ├── theme/                     # Light/dark tema, renkler, color scheme
│   │   ├── network/                   # Dio client, interceptor'lar, modeller
│   │   ├── localization/              # EasyLocalization yapılandırması + üretilen key'ler
│   │   └── guard/                     # Routing için uygulama başlatma guard'ı
│   ├── packages/                      # Üçüncü parti paketler için ince wrapper'lar
│   │   ├── logger/                    # Sadece debug logger
│   │   ├── responsive/               # Breakpoint yöneticisi (mobile/tablet/desktop)
│   │   ├── storage/                   # Güvenli depolama + token yöneticisi
│   │   ├── toastification/           # Önceden yapılandırılmış toast bildirimleri
│   │   ├── skeletonizer/             # Skeleton loading wrapper
│   │   └── preview/                  # Device preview (sadece dev)
│   ├── utils/
│   │   ├── constants/                 # Size'lar, padding'ler, radius, API yapılandırması
│   │   ├── enums/                     # Uygulama ortamı (dev/prod)
│   │   ├── extensions/               # Context, widget, color extension'ları
│   │   └── helpers/                   # Scroll davranışı vb.
│   ├── widget/                        # Paylaşılan widget'lar
│   └── entities/                      # Domain entity'leri
└── gen/                               # Üretilen asset referansları (flutter_gen)
```

### Feature Modül Konvansiyonu

Her feature aynı iç yapıyı takip eder:

```
feature/
└── feature_name/
    ├── cubit/          # Cubit + freezed state
    ├── view/           # View + platforma özel layout'lar
    ├── mixin/          # View seviyesinde mixin'ler (lifecycle, logic)
    ├── model/          # Feature'a özel modeller
    └── service/        # Feature'a özel API servisleri
```

### Product Katmanı

`product/` dizini paylaşılan çekirdektir. Feature'lar ona bağlıdır; o `feature/` içindeki hiçbir şeye bağlı değildir.

- **`init/`** — Tek seferlik kurulum: DI container, router, tema, network client, lokalizasyon, guard'lar.
- **`packages/`** — Üçüncü parti bağımlılıkları izole eden wrapper sınıflar. Feature koduna dokunmadan implementasyon değiştirilebilir.
- **`utils/`** — Feature'lar arasında kullanılan sabitler, extension'lar, helper'lar.

---

## Başlarken

```bash
# Bağımlılıkları yükle
flutter pub get

# Kod üreticilerini çalıştır (route'lar, freezed, json, asset'ler)
dart run build_runner build --delete-conflicting-outputs

# Lokalizasyon key'lerini üret
dart run easy_localization:generate \
  -O lib/product/init/localization \
  -f keys -o locale_keys.g.dart \
  --source-dir assets/localization

# Uygulamayı çalıştır
flutter run
```

Ya da paketlenmiş [rps](https://pub.dev/packages/rps) script'lerini kullanın:

```bash
rps pub_reload       # flutter clean && flutter pub get
rps build_runner     # build_runner build
rps build_watch      # build_runner watch
rps lang             # lokalizasyon key'lerini üret
```

### Ortam

Ortamı derleme zamanında ayarlayın:

```bash
flutter run --dart-define=ENV=dev        # varsayılan
flutter run --dart-define=ENV=prod
flutter run --dart-define=VERSION=101
```

`AppEnvironment.current` aktif ortamı çözümler. API base URL'leri, device preview ve diğer flag'ler buna göre değişir.

---

## Temel Kararlar

### State Yönetimi — Cubit + Freezed

State'ler immutable freezed sınıflarıdır. Cubit'ler method'lar sunar, `copyWith()` ile yeni state'ler emit eder. Event yok, boilerplate yok.

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

Route'lar `@TypedGoRoute` ile tanımlanır ve kod üretilir. Navigasyon type-safe'dir:

```dart
@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData { ... }

// Navigasyon
const HomeRoute().go(context);
```

`AppInitializationGuard`, başlatma tamamlanana kadar tüm route'ları splash'e yönlendirir.

### Dependency Injection — GetIt

`BaseContainer` (`BC` olarak alias) lazy singleton'lar kaydeder. Statik getter'lar ile erişilir:

```dart
BC.setupLocator();

// Kullanım
BC.networkManager;
BC.tokenStorageManager;
BC.splashCubit;
```

### Network — Dio

`NetworkManager`, generic ve type-safe method'lara sahip singleton Dio wrapper'dır:

```dart
final response = await NetworkManager.instance.get<RequestModel, ResponseModel>(
  ApiEndpoints.users.withPathParams([PathParameterModel(key: 'id', value: '1')]),
  model: ResponseModel(),
);
```

- `NetworkInterceptor` güvenli depolamadan Bearer token'ı otomatik ekler.
- `BaseResponseModel` tüm yanıtları sarar.
- `INetworkModel<T>` arayüzü modellerde `toJson()`/`fromJson()` zorunlu kılar.
- Timeout'lar: 15sn bağlantı, 15sn alma.

### Responsive Tasarım

`ResponsiveManager` ile üç breakpoint:

| Layout  | Genişlik   |
|---------|------------|
| Mobile  | 0–800px    |
| Tablet  | 801–1024px |
| Desktop | 1025px+    |

`BaseLayout` uygun child'ı render eder. Fallback sırası: desktop → tablet → mobile.

```dart
BaseLayout(
  mobile: (context) => MobileLayout(),
  tablet: (context) => TabletLayout(),   // opsiyonel
  desktop: (context) => DesktopLayout(), // opsiyonel
)
```

### Tasarım Token'ları

**Spacing** (`AppSizes`): 0, 1, 2, 4, 6, 8, 10, 12, 16, 20, 24, 28, 32, 36, 40, 48, 56, 60, 64, 72, 80, 88, 96, 100

**Padding** (`AppPaddings`): Hazır `EdgeInsets` — `all8`, `hor16`, `ver12`, `top24`, `bottom32`, vb.

**Radius** (`AppRadius`): Hazır `BorderRadius` — `all8`, `topLeft16`, `bottomRight12`, vb.

Tutarlılık için ham literal'ler yerine bunları kullanın.

### Extension'lar

Context:
```dart
context.teska.screenWidth
context.teska.h(50)           // Ekran yüksekliğinin %50'si
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

## Kod Üretimi

Bu proje route'lar, modeller, lokalizasyon key'leri ve asset referansları için kod üretimine dayanır.

| Üretici                | Çıktı                   | Amaç                          |
|-------------------------|-------------------------|--------------------------------|
| `go_router_builder`     | `app_routes.g.dart`     | Typed route sınıfları          |
| `freezed`               | `*.freezed.dart`        | Immutable state/model sınıfları|
| `json_serializable`     | `*.g.dart`              | JSON serializasyon             |
| `flutter_gen_runner`    | `gen/assets.gen.dart`   | Type-safe asset referansları   |
| `easy_localization`     | `locale_keys.g.dart`    | Çeviri key sabitleri           |

Annotated sınıfları, route'ları, asset'leri veya çevirileri değiştirdikten sonra:

```bash
rps build_runner   # veya: dart run build_runner build --delete-conflicting-outputs
rps lang           # sadece lokalizasyon key'leri için
```

---

## Yeni Feature Ekleme

1. `lib/feature/feature_adi/` altında `cubit/`, `view/`, `model/`, `service/`, `mixin/` alt dizinleriyle dizini oluşturun.
2. State'i `@freezed` ile tanımlayın ve cubit'i oluşturun.
3. Paylaşılması gerekiyorsa cubit'i `BaseContainer`'a kaydedin.
4. `app_routes.dart`'a bir `@TypedGoRoute` ekleyin ve `rps build_runner` çalıştırın.
5. Responsive destek için `BaseLayout` kullanarak view'ı oluşturun.

---

## Lokalizasyon

Çeviriler `assets/localization/` dizininde bulunur. Şu anda `en.json` ile gelir.

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

Yeni dil ekleme:
1. `assets/localization/tr.json` oluşturun.
2. `LocalizationManager.supportedLocales`'a `Locale('tr')` ekleyin.
3. Key'leri yeniden üretmek için `rps lang` çalıştırın.
4. Kullanım: `LocaleKeys.common_yes.tr()`

---

## Bağımlılıklar

### Runtime
| Paket                    | Amaç                            |
|--------------------------|----------------------------------|
| `flutter_bloc`           | State yönetimi (Cubit)           |
| `get_it`                 | Service locator / DI             |
| `go_router`              | Deklaratif routing               |
| `dio`                    | HTTP client                      |
| `freezed_annotation`     | Immutable data class annotation  |
| `json_annotation`        | JSON serializasyon annotation    |
| `easy_localization`      | i18n                             |
| `flutter_secure_storage` | Şifreli key-value depolama       |
| `responsive_framework`   | Responsive breakpoint'ler        |
| `skeletonizer`           | Skeleton loading UI              |
| `toastification`         | Toast bildirimleri               |
| `logger`                 | Formatlanmış konsol loglama      |
| `equatable`              | Değer eşitliği                   |
| `device_preview`         | Device preview overlay (dev)     |
| `flutter_svg`            | SVG render                       |
| `lottie`                 | Lottie animasyon render          |
| `flutter_gen`            | Asset kod üretimi runtime        |

### Dev
| Paket                  | Amaç                            |
|------------------------|----------------------------------|
| `build_runner`         | Kod üretim orkestratörü          |
| `go_router_builder`    | Typed route üretimi              |
| `freezed`              | Immutable sınıf üretimi          |
| `json_serializable`    | JSON serializasyon üretimi       |
| `flutter_gen_runner`   | Asset referans üretimi           |
| `very_good_analysis`   | Lint kuralları                   |
| `rps`                  | Script çalıştırıcı              |

---

## Linting

Sıkı lint kuralları için [very_good_analysis](https://pub.dev/packages/very_good_analysis) kullanır. Override'lar için `analysis_options.yaml`'ı kontrol edin.

```bash
dart analyze
```
