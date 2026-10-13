#!/usr/bin/env bash
# Hook: check_bypass_interaction_layer.sh
# Targets realIssue: "Direct http.post bypasses Interaction layer" found in
# complain_record_bloc.dart:56 and consumption_index_detail_bloc.dart:114.
# New code in lib/presentation/ must NOT make raw http.post/http.get calls
# except through the allowed paths: http_connection.dart, utilities.dart,
# and complain_record_bloc.dart / consumption_index_detail_bloc.dart (legacy, already tracked).
#
# The Interaction layer (lib/domain/interaction/interaction.dart) provides:
#   - Bearer token injection
#   - 120s timeout
#   - 401 → refreshToken flow
#   - error dialog display
# Bypassing it means silent failures with no user feedback and no token refresh.

set -euo pipefail

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null || echo "/Users/mwang/WAO/Mobile/centralized_meter")"
LIB_PRESENTATION="$REPO_ROOT/lib/presentation"

# Files that are allowed legacy exceptions (already use raw http.post knowingly)
ALLOWED_LEGACY=(
  "complain_record_bloc.dart"
  "consumption_index_detail_bloc.dart"
)

VIOLATIONS=()

while IFS= read -r -d '' file; do
  basename_file="$(basename "$file")"
  is_legacy=false
  for legacy in "${ALLOWED_LEGACY[@]}"; do
    if [[ "$basename_file" == "$legacy" ]]; then
      is_legacy=true
      break
    fi
  done

  if $is_legacy; then
    continue
  fi

  # Look for raw http.post or http.get (both direct and via Globals.client)
  if grep -qE '\bhttp\.(post|get|put|delete|patch)\b|Globals\.client\.(post|get|put|delete|patch)\b' "$file" 2>/dev/null; then
    linenos=$(grep -nE '\bhttp\.(post|get|put|delete|patch)\b|Globals\.client\.(post|get|put|delete|patch)\b' "$file" | head -5 | awk -F: '{print $1}' | tr '\n' ',' | sed 's/,$//')
    VIOLATIONS+=("${file} — lines: ${linenos}")
  fi
done < <(find "$LIB_PRESENTATION" -name "*.dart" -print0)

if [[ ${#VIOLATIONS[@]} -gt 0 ]]; then
  echo ""
  echo "ERROR [check_bypass_interaction_layer]: Raw http.post/get calls found in lib/presentation/."
  echo ""
  echo "New HTTP calls must go through Repository (lib/domain/repository.dart) which delegates to"
  echo "Interaction (lib/domain/interaction/interaction.dart) for token injection, timeout, 401 refresh,"
  echo "and error dialogs."
  echo ""
  echo "Exception: calls targeting Globals.config.nhaBeSever (legacy cookie-auth server) may use"
  echo "Utilities.fetchDataList() / Utilities.fetchDataObject() / Utilities.onGetLatLong() defined in"
  echo "lib/common/utilities.dart — but still NOT raw http.post in presentation blocs."
  echo ""
  echo "Violations:"
  for v in "${VIOLATIONS[@]}"; do
    echo "  $v"
  done
  echo ""
  exit 1
fi

exit 0
