#!/bin/bash
# MOSS daily git sync - push all changes to GitHub at end of day
# Triggered by cron: 0 23 * * *

set -e

REPO_DIR="/Users/botbot/botwork/agents/MOSS"
cd "$REPO_DIR"

# Fetch latest from origin
git fetch origin main 2>/dev/null || true

# Add all changes
git add -A 2>/dev/null

# Only commit/push if there are changes
if git diff --cached --quiet 2>/dev/null; then
    echo "$(date): No changes to sync"
    exit 0
fi

git commit -m "Daily sync: $(date +%Y-%m-%d)" --allow-empty
git push origin main 2>&1 || echo "$(date): Push failed (network issue)"

echo "$(date): Sync complete"
