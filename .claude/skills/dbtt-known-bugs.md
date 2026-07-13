# dbtt: Known Bugs and Risky Patterns — Do Not Repeat

This skill documents confirmed bugs and dangerous patterns in the `centralized_meter` codebase. When modifying related files, fix the existing instance rather than replicating it.

---

## CONFIRMED BUG 1 — Double API call in ConsumptionIndexDetailBloc

**File:** `lib/presentation/module/look_up_module/contact_detail_module/module/detail_module/bloc/consumption_index_detail_bloc.dart:54-55`

```dart
// CURRENT (BROKEN):
void onReady() {
  onGetDetail();                                    // fires once
  Future.wait([fetchIncidents(), onGetDetail()]);   // fires a SECOND time
}
```

`onGetDetail()` is called twice concurrently on every screen open. Fix: remove the bare `onGetDetail()` call, keep it only inside `Future.wait`.

---

## CONFIRMED BUG 2 — BehaviorSubject leak in LookupBloc

**File:** `lib/presentation/module/look_up_module/src/bloc/lookup_bloc.dart:76-80`

`streamModel` is declared but `onDispose()` only closes `streamOptionModels`. `streamModel` is never closed. Fix: add `streamModel.close()` to `onDispose()`.

---

## CONFIRMED BUG 3 — BadDebtBloc sends empty danhBo

**File:** `lib/presentation/module/look_up_module/contact_detail_module/src/bloc/contact_detail_bloc.dart:431`

```dart
// CURRENT (BROKEN):
BadDebReqModel(danhBo: '')   // hardcoded empty string

// CORRECT:
BadDebReqModel(danhBo: danhBo)   // use the class-level field
```

Every bad-debt API request currently sends an empty account identifier.

---

## DANGEROUS PATTERN — response.success not checked (~20 files)

**Affected files (non-exhaustive):** `overview_bloc.dart`, `payment_history_bloc.dart`, `move_meter_bloc.dart`, `offical_document_bloc.dart`, `update_history_bloc.dart`, `meter_replacement_bloc.dart`

```dart
// CURRENT (DANGEROUS — silently emits empty data on API failure):
final model = SomeModel.fromJson(response.data);
streamData.set(model);

// CORRECT:
if (response.success) {
  streamData.set(SomeModel.fromJson(response.data));
}
```

When the API returns an error, `response.data` is `{}`. Calling `fromJson` on it silently produces null/default fields and the stream emits empty data with no user feedback. The `pre-commit` hook `check_response_success_guard.sh` will catch new instances.

---

## DANGEROUS PATTERN — tabController! force-unwrap on contradictory late nullable

**File:** `lib/presentation/module/look_up_module/contact_detail_module/src/bloc/contact_detail_bloc.dart`

```dart
late TabController? tabController;   // contradictory: late + nullable
```

Force-unwrapping with `tabController!` before `onInitData()` completes throws `LateInitializationError`. When working in `ContactDetailBloc`:
- Never access `tabController` before `onReady()` completes
- Add null check: `if (tabController != null) tabController!.dispose();`
- Long-term fix: change to `TabController? tabController;` (remove `late`)

---

## DANGEROUS PATTERN — Static BuildContext in CustomLoading

**File:** `lib/common/utils/custom_loading.dart`

`CustomLoading._context` is static. If the widget is disposed before `hide()` is called, `Navigator.of(_context!)` throws on a detached navigator. Never call `CustomLoading.show()` without a guaranteed `hide()` in `finally`.

---

## DANGEROUS PATTERN — Globals.config.displayPrint! forced unwrap

**File:** `lib/common/utilities.dart:64`

`displayPrint` is typed `bool?` in `Config` but is force-unwrapped with `!`. Will throw if `Config` is constructed without setting `displayPrint`. Fix: use `Globals.config.displayPrint == true`.

---

## STALE DEPENDENCY — dio declared but unused

`pubspec.yaml` lists `dio: 5.8.0+1` but no source file imports it. The HTTP client is `http` (via `Globals.client`). Do not add `dio` imports — remove the dependency instead.

---

## STRUCTURAL ISSUE — Directories named with .dart extension

`lib/presentation/module/comparison_report.dart/` and `lib/presentation/module/overview_report_module.dart/` are **filesystem directories**, not files. Import paths look like:

```dart
import 'comparison_report.dart/ui/comparison_report_screen.dart';
```

Do not create new directories with `.dart` in their name. Do not rename these directories without updating all import paths throughout the project.

---

## FRAGILE — Hardcoded Vietnamese unit strings in money formatter

**File:** `lib/common/utilities.dart:145-170`

`Utilities.caculateUnitMoney()` returns `'Ty'`, `'Trieu'`, `'Tram nghin'`, `'Nghin'` as raw strings. `getDivisorForUnit()` switches on these same strings. Adding a locale or renaming any string breaks the switch and divisor always returns 1. Do not add new unit strings without updating both methods simultaneously.
