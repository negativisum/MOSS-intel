#!/bin/bash
# MOSS daily git sync - push all changes to GitHub at end of day
# Cron: 0 23 * * * bash /Users/botbot/botwork/agents/MOSS/sync.sh >> /tmp/moss-git-sync.log 2>&1

set -e

REPO_DIR="/Users/botbot/botwork/agents/MOSS"
cd "$REPO_DIR"

# Fetch latest from origin (tolerate network failures)
git fetch origin main 2>/dev/null || true

# Stage all changes
git add .gitignore AGENTS.md SOUL.md IDENTITY.md TOOLS.md MEMORY.md HEARTBEAT.md USER.md GIT_SUMMARY.md knowledge/ memory/ sync.sh 2>/dev/null || true

# Only commit/push if there are changes
if git diff --cached --quiet 2>/dev/null; then
    echo "$(date): No changes to sync"
    exit 0
fi

git commit -m "Daily sync: $(date +%Y-%m-%d)" --allow-emptyestrationiert
git push origin main 2>&1 || echo "$(date): Push failed (network issue — will retry next run)"

echo "$(date): Sync complete"
