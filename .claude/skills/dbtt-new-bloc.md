# dbtt: Adding a New Bloc or Tab Screen

Use this skill whenever you need to add a new tab screen to `ContactDetailScreen`, create a new `BaseBloc` screen, or add a new plain-Dart sub-bloc.

---

## Checklist: New Plain-Dart Sub-Bloc (tab child inside ContactDetailBloc)

Plain-Dart sub-blocs receive `BuildContext` in their constructor and are NOT `BaseBloc` subclasses. Follow `PaymentHistoryBloc` / `OverviewSectionBloc` as the reference pattern.

### 1. Declare BehaviorSubjects — one per UI state

```dart
final streamLoading = BehaviorSubject<bool>();
final streamData    = BehaviorSubject<List<MyModel>>();
```

### 2. init() — called from ContactDetailBloc.onInit() or onReady()

```dart
void init() {
  // synchronous setup only — no async here
}
```

### 3. onRefresh() — lazy-load gate (required)

```dart
bool _refresh = true;

void onRefresh({bool isRefresh = false}) {
  if (!_refresh && !isRefresh) return;
  _refresh = false;
  fetchData();
}

Future<void> fetchData() async {
  streamLoading.set(true);
  final response = await Repository.myMethod(context, MyReqModel(...));
  streamLoading.set(false);

  // ALWAYS check response.success before fromJson
  if (response.success) {
    streamData.set(MyModel.fromJson(response.data));
  }
  // If !response.success, Interaction already showed an error dialog — do nothing extra
}
```

### 4. dispose() — close every BehaviorSubject (no exceptions)

```dart
void dispose() {
  streamLoading.close();
  streamData.close();
}
```

### 5. Wire into ContactDetailBloc

In `contact_detail_bloc.dart`:
```dart
late MyNewBloc myNewBloc;

@override
void onInit() {
  ...
  myNewBloc = MyNewBloc(context);
  myNewBloc.init();
}

@override
void onDispose() {
  ...
  myNewBloc.dispose();
}
```

### 6. Register in ContactDetailScreen tab list

Add the tab screen widget to the `TabBarView` children list and increment `_tabCount`. Update `dbtt.dart` comment block at lines 177-193 with the new `initialTabIndex` entry.

---

## Checklist: New BaseBloc Screen (top-level screen, not a tab child)

Follow `LookupScreen` + `LookupBloc` as the reference pattern.

### File structure

```
lib/presentation/module/my_feature/
  src/
    bloc/my_feature_bloc.dart   — extends BaseBloc<MyFeatureScreen>
    ui/my_feature_screen.dart   — extends BaseView<MyFeatureBloc>
```

Use **package imports**, not relative:
```dart
// CORRECT:
import 'package:dbtt/data/models/base/response_model.dart';

// WRONG (deep relative — flagged by hook):
import '../../../../../../data/models/base/response_model.dart';
```

### BehaviorSubject lifecycle

```dart
class MyFeatureBloc extends BaseBloc<MyFeatureScreen> {
  final streamItems = BehaviorSubject<List<ItemModel>>();

  @override
  void onInit() { /* sync setup */ }

  @override
  void onReady() { fetchItems(); }   // async-safe

  @override
  void onDispose() {
    streamItems.close();             // MUST close every subject
  }
}
```

### Repository call pattern

```dart
Future<void> fetchItems() async {
  final response = await Repository.getMyItems(context, MyReqModel(danhBo: danhBo));
  if (response.success) {
    streamItems.set(ItemModel.fromJson(response.data));
  }
  // No else needed — Interaction shows error dialog automatically
}
```

---

## API Call Rules

1. Main API calls: use `Repository.methodName(context, model)` only.
2. nhaBeSever calls (coordinates, legacy meter data): use `Utilities.fetchDataList()` / `Utilities.fetchDataObject()` / `Utilities.onGetLatLong()` from `lib/common/utilities.dart`. These use cookie auth (`AspxAutoDetectCookieSupport=1`), not Bearer.
3. Never write `http.post(...)` or `Globals.client.post(...)` directly in a presentation bloc.

---

## toJson / fromJson Style

Use Dart 2.x literal syntax (not `new` keyword):

```dart
// CORRECT:
Map<String, dynamic> toJson() => <String, dynamic>{ 'key': value };

// WRONG (flagged by hook):
Map<String, dynamic> toJson() { var map = new Map<String, dynamic>(); ... }
```

---

## CustomLoading Usage

`CustomLoading` stores a static `BuildContext`. Always call `hide()` in a `finally` block or after checking `mounted`:

```dart
CustomLoading.show(context);
try {
  await doWork();
} finally {
  CustomLoading.hide();
}
```

Never store `CustomLoading` show/hide across navigation boundaries — the context will be stale.
