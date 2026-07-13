#!/usr/bin/env bash
# Hook: check_response_success_guard.sh
# Targets realIssue: "response.success never checked before fromJson() in ~20 blocs"
# Grep for .fromJson(response.data) or .fromJson(response.body) without a preceding
# if (response.success) guard in the same function body.

set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null || echo "/Users/mwang/WAO/centralized_meter")"
LIB_DIR="$REPO_ROOT/lib"

VIOLATIONS=()

while IFS= read -r -d '' file; do
  # Collect all line numbers where .fromJson(response. appears (captures calls like SomeModel.fromJson(response.data))
  while IFS= read -r match_line; do
    lineno="${match_line%%:*}"
    # Look back up to 15 lines for an if (response.success) guard
    start=$(( lineno > 15 ? lineno - 15 : 1 ))
    context=$(sed -n "${start},${lineno}p" "$file")
    if ! echo "$context" | grep -qE 'if\s*\(\s*response\.success'; then
      VIOLATIONS+=("${file}:${lineno}")
    fi
  done < <(grep -n '\.fromJson(response\.' "$file" 2>/dev/null || true)
done < <(find "$LIB_DIR" -name "*.dart" -not -path "*/localization/*" -print0)

if [[ ${#VIOLATIONS[@]} -gt 0 ]]; then
  echo ""
  echo "ERROR [check_response_success_guard]: fromJson called on response.data without if (response.success) guard."
  echo "Unguarded calls will silently emit empty/null data when the API returns an error."
  echo "Wrap each call: if (response.success) { stream.set(Model.fromJson(response.data)); }"
  echo ""
  echo "Violations found:"
  for v in "${VIOLATIONS[@]}"; do
    echo "  $v"
  done
  echo ""
  exit 1
fi

exit 0
