#!/usr/bin/env bash
set -euo pipefail

PREFIX="business-ops"
REMOTE="gis-ops"
BRANCH="main"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: run this script from inside the git repository." >&2
  exit 1
fi

if ! git remote get-url "$REMOTE" >/dev/null 2>&1; then
  echo "Error: remote '$REMOTE' is not configured." >&2
  echo "Add it first, for example:" >&2
  echo "  git remote add $REMOTE git@github.com:<org-or-user>/green-infrastructure-services-ops.git" >&2
  exit 1
fi

echo "Splitting '$PREFIX/' to '$REMOTE' ($BRANCH)..."
git subtree split --prefix="$PREFIX" -b "tmp/${PREFIX}-split"
git push "$REMOTE" "tmp/${PREFIX}-split:$BRANCH" --force
git branch -D "tmp/${PREFIX}-split"

echo "Done. '$PREFIX/' is now synced to '$REMOTE/$BRANCH'."
