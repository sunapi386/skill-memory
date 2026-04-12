#!/usr/bin/env bash
# Wipe local skill-memory state so the demo starts from zero.
set -euo pipefail

rm -rf "$HOME/.skill-memory"
rm -rf "$HOME/.claude/skills/skill-memory"
rm -f "$HOME/.local/bin/skill-memory"

echo "✓ clean slate"
echo "  ~/.skill-memory — removed"
echo "  ~/.claude/skills/skill-memory — removed"
echo "  ~/.local/bin/skill-memory — removed"
