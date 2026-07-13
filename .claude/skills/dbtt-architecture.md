# dbtt Architecture — Domain Knowledge for Claude Code

This file encodes non-obvious architectural facts about the `centralized_meter` Flutter plugin (package name: `dbtt`). Read this before modifying any bloc, adding an API call, or adding a new tab screen.

---

## Plugin vs App

`dbtt` is a **Flutter plugin**, not a standalone app. The public surface is static methods on `DbttPlugin` in `lib/dbtt.dart`:

```dart
DbttPlugin.init(config, context)       // must be called FIRST — stores JWT, sets Globals
DbttPlugin.pushLookupScreen(context)
DbttPlugin.pushContactDetail(context, danhBo, initialTabIndex: 3)
DbttPlugin.pushOverviewReport(context)
```

`DbttPlugin.init()` must complete before any `push*` method is called. It performs login, stores the JWT in `SharedPreferences` via `SharedPrefs`, and populates `Globals.config`, `Globals.model`, and `Globals.locale`.

---

## BaseBloc / BaseView Pattern

`BaseBloc<S extends BaseView>` **IS** `State<S>`. The bloc is the `State` object — not a separate class wired by StreamBuilder.

```dart
// Widget (BaseView subclass) only declares build():
class LookupScreen extends BaseView<LookupBloc> { ... }

// Bloc IS the State, can call setState directly:
class LookupBloc extends BaseBloc<LookupScreen> {
  @override
  void onInit() { /* runs in initState, sync */ }

  @override
  void onReady() { /* runs in addPostFrameCallback, safe for async */ }

  @override
  void onDispose() { /* MUST close all BehaviorSubjects here */ }
}
```

Lifecycle order: `onInit()` (sync) → `onReady()` (async-safe, use for API calls) → `onResumed()` (app resume) → `onDispose()`.

**Plain-Dart sub-blocs** (e.g., `PaymentHistoryBloc`, `OverviewSectionBloc`, `ComplaintRecordBloc`) are NOT `BaseBloc` subclasses. They receive `BuildContext` in their constructor and use `init()` / `dispose()` / `onRefresh()` convention.

---

## BehaviorSubject Rules

Use `.set()` extension (defined in `lib/presentation/base/base_view.dart`), never `.sink.add()` directly:

```dart
// CORRECT — guards against closed-sink errors:
streamUser.set(userModel);

// WRONG — throws StateError if sink is already closed:
streamUser.sink.add(userModel);
```

Every `BehaviorSubject` declared in a file **must** be closed in `onDispose()` (BaseBloc) or `dispose()` (plain-Dart blocs). Known leak: `LookupBloc.streamModel` is never closed (`lib/presentation/module/look_up_module/src/bloc/lookup_bloc.dart:76-80`).

---

## Two HTTP Servers — Critical Distinction

| Server | Config field | Auth | Route through |
|---|---|---|---|
| Main API | `Globals.config.server` | Bearer JWT (auto-injected) | `Repository` → `Interaction` |
| Legacy nhaBeSever | `Globals.config.nhaBeSever` | Cookie (`AspxAutoDetectCookieSupport=1`) | `Utilities.fetchDataList()` / `fetchDataObject()` / `onGetLatLong()` |

**Never** call `http.post` directly in a presentation bloc for the main API. `Repository` (static facade in `lib/domain/repository.dart`, 37 methods) is the only correct entry point. Each method constructs an `Interaction` which provides: Bearer injection, 120s timeout, 401 → `refreshToken` flow, error dialog display.

For `nhaBeSever` endpoints (coordinates, legacy meter data), use the existing helpers in `lib/common/utilities.dart`. Do not add `Interaction`-based calls for nhaBeSever — it uses cookie auth, not Bearer.

---

## ContactDetailScreen Tab Index Map

`ContactDetailBloc` (`lib/presentation/module/look_up_module/contact_detail_module/src/bloc/contact_detail_bloc.dart`) orchestrates 15+ plain-Dart sub-blocs. `DbttPlugin.pushContactDetail()` accepts `initialTabIndex`:

```
0  — Thông tin khách hàng (customer info)
1  — Lịch sử thanh toán (payment history)
2  — Tổng quan (overview section)
3  — Chỉ số (consumption index)
4  — Sự cố (complaints/incidents)
5  — Lịch sử cập nhật (update history)
6  — Công văn (official documents)
7  — Nợ xấu (bad debt)
... (see dbtt.dart:177-193 for full map)
```

`tabController` is declared `late TabController? tabController` — a contradictory nullable+late pattern. Never force-unwrap with `tabController!` before `onInitData()` completes.

---

## danhBo — Primary Customer Identifier

`danhBo` is a numeric string (account number). Search normalization:
- Type `danhbo`: strip all non-digit characters before querying
- Type text: call `String.removeAccents()` (extension in `lib/common/utils/extension.dart`)

Known bug: `BadDebtBloc.onGetBadDebt()` constructs `BadDebReqModel(danhBo: '')` (hardcoded empty string) at `contact_detail_bloc.dart:431`. The correct value is the class-level `danhBo` field.

---

## onRefresh Lazy-Load Gate

Plain-Dart sub-blocs use a `bool refresh = true` flag to avoid redundant fetches:

```dart
void onRefresh({bool isRefresh = false}) {
  if (!refresh && !isRefresh) return;
  refresh = false;
  // fetch data...
}
```

First tab visit triggers a fetch. Subsequent visits skip unless the caller passes `isRefresh: true`. Respect this pattern in any new sub-bloc.

---

## Asset Resolution

`Assets.packagePrefix` controls whether assets use `packages/dbtt/` prefix (plugin mode) or empty string (standalone). Always use `Assets.resolve('path/to/asset')` — never hardcode asset paths.

---

## Globals — Shared Mutable State Warning

`Globals.customerFilterType` is a `List<OptionModel>` mutated in-place during `LookupBloc.onInit()` (toggling `isSelected`). It is **global shared state**. If two `LookupScreen` instances coexist, they will race on this list. Do not store per-screen filter state in `Globals`.
