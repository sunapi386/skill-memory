#!/usr/bin/env bash
# Seed three demo lessons via the installed CLI.
# Requires skill-memory to be installed first — run the installer in Beat 2.
set -euo pipefail

if ! command -v skill-memory >/dev/null 2>&1; then
  echo "✗ skill-memory not installed"
  echo "  install first:"
  echo "    bash <(curl -fsSL https://raw.githubusercontent.com/sunapi386/skill-memory/main/install.sh)"
  exit 1
fi

skill-memory learn "When writing Supabase queries in TypeScript, use .throwOnError() instead of manual error checks. Because the generated types assume success and manual checks are redundant noise."

skill-memory learn "When a Next.js dev server seems stale, check for zombie processes on port 3000 before restarting. Because Next.js processes outlive their parent terminal session."

skill-memory learn "When an agent hits a flaky test, grep the test name in ~/.skill-memory/lessons.jsonl before retrying. Because the same flake has probably been logged before."

echo ""
echo "✓ 3 lessons seeded"
