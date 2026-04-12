#!/usr/bin/env bash
# skill-memory one-line installer
# Usage: bash <(curl -fsSL https://raw.githubusercontent.com/sunapi386/skill-memory/main/install.sh)
set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/sunapi386/skill-memory/main"
BIN_DIR="${SKILL_MEMORY_BIN:-$HOME/.local/bin}"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills/skill-memory}"

mkdir -p "$BIN_DIR" "$SKILLS_DIR"

echo "→ installing skill-memory CLI to $BIN_DIR/skill-memory"
curl -fsSL "$REPO_RAW/bin/skill-memory" -o "$BIN_DIR/skill-memory"
chmod +x "$BIN_DIR/skill-memory"

echo "→ installing SKILL.md to $SKILLS_DIR/SKILL.md"
curl -fsSL "$REPO_RAW/SKILL.md" -o "$SKILLS_DIR/SKILL.md"

echo ""
echo "✓ skill-memory installed"
echo ""
echo "  CLI:   $BIN_DIR/skill-memory"
echo "  Skill: $SKILLS_DIR/SKILL.md"
echo ""

case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *)
    echo "⚠ $BIN_DIR is not on your PATH"
    echo "  Add this to your shell rc:"
    echo "      export PATH=\"$BIN_DIR:\$PATH\""
    echo ""
    ;;
esac

echo "Try it:"
echo "  skill-memory learn \"When I install new CLIs, I should check PATH. Because otherwise the command is not found.\""
echo "  skill-memory recall PATH"
