#!/usr/bin/env bash
# register_safe_directories.sh
#
# Add every <org>/<repo> directory under the Defects4J GitHub mirror
# to the current user's global Git configuration as a safe directory.
# This avoids "unsafe repository" errors when the repository owner UID
# differs from the current user.
#
# Usage:
#   bash register_safe_directories.sh
#
# The script is idempotent: running it multiple times simply adds the same
# paths again; Git ignores duplicates.

set -euo pipefail

# Root directory that contains cloned repositories in the form <org>/<repo>
ROOT="/local2/i-kondo/szz/majority-voting-szz-replication-package/dataset/repositories/defects4j/github.com"

if [[ ! -d "$ROOT" ]]; then
  echo "Error: ROOT directory $ROOT does not exist" >&2
  exit 1
fi

# Register each repository (depth=2) as a safe directory
find "$ROOT" -mindepth 2 -maxdepth 2 -type d | while read -r dir; do
  git config --global --add safe.directory "$dir"
  echo "Registered $dir as safe.directory"
done

echo "✅ All repositories under $ROOT have been registered as safe directories."
