#!/usr/bin/env bash
# Bootstrap a repo with the projectflow method.
# Idempotent: safe to re-run to reconcile an existing repo.
#
# Usage:
#   scripts/bootstrap-repo.sh <owner>/<repo> [target-dir]
#
# Config via env (defaults shown):
#   AREAS="frontend backend mobile devops"
#
# Requires: gh (authenticated), jq.
set -euo pipefail

REPO="${1:?usage: bootstrap-repo.sh <owner>/<repo> [target-dir]}"
TARGET="${2:-.}"
AREAS="${AREAS:-frontend backend mobile devops}"
SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"

say() { printf '\033[1;36m▶ %s\033[0m\n' "$*"; }

# --- 1. Files: copy templates into the target repo (never overwrite living docs) ---
say "Copying templates into $TARGET"
mkdir -p "$TARGET/.github" "$TARGET/docs"
cp -R "$SKILL_DIR/templates/.github/." "$TARGET/.github/"
cp -n "$SKILL_DIR/commitlint.config.js" "$TARGET/commitlint.config.js" 2>/dev/null || true
cp -n "$SKILL_DIR/CLAUDE.md" "$TARGET/CLAUDE.md" 2>/dev/null || true
# Living docs + ADRs: copy only if absent so we don't clobber real content.
for f in BLUEPRINT.md ARCHITECTURE.md PROGRESS.md; do
  cp -n "$SKILL_DIR/templates/docs/$f" "$TARGET/docs/$f" 2>/dev/null || true
done
mkdir -p "$TARGET/docs/adr"
cp -n "$SKILL_DIR/templates/docs/adr/"*.md "$TARGET/docs/adr/" 2>/dev/null || true

# --- 2. Labels (idempotent: create or update) ---
label() { gh label create "$1" -c "$2" -d "$3" -R "$REPO" 2>/dev/null \
            || gh label edit "$1" -c "$2" -d "$3" -R "$REPO" >/dev/null; }
say "Creating labels on $REPO"
for a in $AREAS; do label "area: $a" "5319E7" "About $a"; done
label "priority: high"   "e80707" "Needed this milestone"
label "priority: medium" "f3ff47" "By next milestone"
label "priority: low"    "4fe647" "Anytime before final"
label "feat"             "0075ca" "New feature"
label "testing"          "0E8A16" "Test coverage and verification"
# bug / enhancement / documentation exist by default; ensure they're present:
label "bug"              "d73a4a" "Something isn't working"
label "enhancement"      "a2eeef" "Improvement to existing functionality"
label "documentation"    "0075ca" "Docs and decision records"

# --- 3. Milestones (idempotent: skip if the title already exists) ---
ms() {
  local title="$1"
  if gh api "repos/$REPO/milestones?state=all" --jq '.[].title' | grep -Fxq "$title"; then
    echo "  = milestone exists: $title"
  else
    gh api "repos/$REPO/milestones" -f title="$title" >/dev/null && echo "  + milestone: $title"
  fi
}
say "Creating starter milestones"
ms "Milestone 1"
ms "MVP"
ms "Integration, QA & Demo"
ms "Tech Debt & Fixes"

# --- 4. Branch ruleset on the default branch (skip if already present) ---
say "Applying main branch ruleset"
if gh api "repos/$REPO/rulesets" --jq '.[].name' 2>/dev/null | grep -Fxq "main protection"; then
  echo "  = ruleset 'main protection' already exists"
else
  gh api "repos/$REPO/rulesets" --method POST \
    --input "$SKILL_DIR/templates/.github/rulesets/main.json" >/dev/null \
    && echo "  + ruleset 'main protection'" \
    || echo "  ! ruleset skipped (needs admin + a paid plan for private repos)"
fi

# --- 5. Projects v2 board (best-effort; needs the 'project' gh scope) ---
say "Creating a Projects v2 board (best-effort)"
owner="${REPO%%/*}"
gh project create --owner "$owner" --title "$(basename "$REPO")" >/dev/null 2>&1 \
  && echo "  + project board" \
  || echo "  ! project skipped — run: gh auth refresh -s project,read:project"

say "Done. Next: edit docs/BLUEPRINT.md, docs/ARCHITECTURE.md, commitlint.config.js (areas),"
echo  "  and the Discussions URL in .github/ISSUE_TEMPLATE/config.yml."
