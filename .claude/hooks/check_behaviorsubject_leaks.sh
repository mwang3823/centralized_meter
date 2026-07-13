#!/usr/bin/env bash
# Hook: check_behaviorsubject_leaks.sh
# Targets realIssue: "BehaviorSubject leaks in LookupBloc — streamModel never closed"
# For every .dart file under lib/, counts BehaviorSubject declarations and .close() calls.
# Files that declare more subjects than they close are flagged.
# Plain-Dart sub-blocs (non-BaseBloc) must close subjects in their dispose() method.

set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null || echo "/Users/mwang/WAO/centralized_meter")"
LIB_DIR="$REPO_ROOT/lib"

VIOLATIONS=()

while IFS= read -r -d '' file; do
  decl_count=$(grep -c 'BehaviorSubject<' "$file" 2>/dev/null || echo 0)
  close_count=$(grep -c '\.close()' "$file" 2>/dev/null || echo 0)

  if [[ "$decl_count" -gt 0 && "$close_count" -lt "$decl_count" ]]; then
    VIOLATIONS+=("${file} — declares ${decl_count} BehaviorSubject(s), closes ${close_count}")
  fi
done < <(find "$LIB_DIR" -name "*.dart" -print0)

if [[ ${#VIOLATIONS[@]} -gt 0 ]]; then
  echo ""
  echo "ERROR [check_behaviorsubject_leaks]: Files with unclosed BehaviorSubjects detected."
  echo "Every BehaviorSubject declared in a bloc must be closed in onDispose() (BaseBloc)"
  echo "or dispose() (plain-Dart sub-blocs like PaymentHistoryBloc, OverviewSectionBloc, etc.)."
  echo "Unclosed sinks cause stream-subscription leaks on navigation pop."
  echo ""
  echo "Violations (declarations > close() calls):"
  for v in "${VIOLATIONS[@]}"; do
    echo "  $v"
  done
  echo ""
  exit 1
fi

exit 0
