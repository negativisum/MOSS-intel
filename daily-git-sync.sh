#!/bin/bash
# MOSS daily git sync script
# Run: bash /Users/botbot/botbot/botwork/agents/MOSS/daily-git-sync.sh
# Cron: 0 23 * * * bash /Users/botbot/botbot/botwork/agents/MOSS/daily-git-sync.sh

set -e
cd /Users/botbot/botbot/botwork/agents/MOSS

# Pull latest first
git pull --rebase origin main 2>/dev/null || true

# Add all knowledge and memory files
git add knowledge/ memory/ MEMORY.md HEARTBEAT.md AGENTS.md SOUL.md 2>/dev/null || true

# Check if there's anything to commit
if git diff --cached --quiet; then
    echo "Nothing to sync at $(date)"
    exit 0
fi

# Commit with date stamp
git commit -m "Daily sync: $(date +%Y-%m-%d)"

# Push
git push origin main

echo "Synced successfully at $(date)"
