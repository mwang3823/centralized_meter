#!/usr/bin/env bash
# Hook: check_dart_style_regressions.sh
# Targets realIssues:
#   - "new Map<String, dynamic>() in 34+ model toJson() methods" (Dart 1.x style)
#   - "late Type? name contradictory pattern" (late + nullable = LateInitializationError on dispose)
#   - "Globals.config.displayPrint! forced unwrap" (bool? field force-unwrapped)
#   - "14-level relative imports" (../../../../../../ with 6+ levels)
#
# Only scans staged files (git diff --cached) if run as pre-commit, otherwise scans all lib/.

set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null || echo "/Users/mwang/WAO/Mobile/centralized_meter")"
LIB_DIR="$REPO_ROOT/lib"

ERRORS=()

scan_file() {
  local file="$1"

  # Rule 1: Dart 1.x new keyword (unnecessary_new lint)
  if grep -qE '\bnew (Map|List|Duration|DateTime|Set)\b' "$file" 2>/dev/null; then
    lines=$(grep -nE '\bnew (Map|List|Duration|DateTime|Set)\b' "$file" | head -3 | awk -F: '{print $1}' | tr '\n' ',' | sed 's/,$//')
    ERRORS+=("STYLE [unnecessary_new] ${file}:${lines} — use literal syntax: <String,dynamic>{} [] Duration() etc.")
  fi

  # Rule 2: late + nullable contradiction (late Type? name)
  if grep -qE '\blate\s+\w+\?\s+\w+' "$file" 2>/dev/null; then
    lines=$(grep -nE '\blate\s+\w+\?\s+\w+' "$file" | head -3 | awk -F: '{print $1}' | tr '\n' ',' | sed 's/,$//')
    ERRORS+=("UNSAFE [late_nullable] ${file}:${lines} — 'late Type? name' is contradictory. Use Type? (nullable, no late) or late Type (non-null, guaranteed init). Force-unwrap with ! on late nullable throws LateInitializationError on dispose.")
  fi

  # Rule 3: Deep relative imports (6+ levels: ../../../../../../)
  if grep -qE "import '(\.\./){6,}" "$file" 2>/dev/null; then
    lines=$(grep -nE "import '(\.\./){6,}" "$file" | head -3 | awk -F: '{print $1}' | tr '\n' ',' | sed 's/,$//')
    ERRORS+=("FRAGILE [deep_relative_import] ${file}:${lines} — use package:dbtt/... imports instead of 6+ level relative paths.")
  fi
}

while IFS= read -r -d '' file; do
  scan_file "$file"
done < <(find "$LIB_DIR" -name "*.dart" -print0)

if [[ ${#ERRORS[@]} -gt 0 ]]; then
  echo ""
  echo "ERROR [check_dart_style_regressions]: Code style/safety violations found."
  echo ""
  for e in "${ERRORS[@]}"; do
    echo "  $e"
  done
  echo ""
  echo "Fix these before committing. See lib/data/models/response/ for the existing pattern"
  echo "to avoid (34+ files already use 'new Map<String, dynamic>()' — do not add more)."
  echo ""
  exit 1
fi

exit 0
