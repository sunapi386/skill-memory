# skill-memory

**Append-only lesson log for AI agents. Give your agent compounding memory across sessions.**

Agents are stateless. Every session starts from zero. `skill-memory` is a tiny CLI + OpenClaw/Claude Code skill that teaches your agent to *read before it acts* and *write after it learns* — turning every run into a deposit in a growing lesson bank.

No server. No database. No config. One file: `~/.skill-memory/lessons.jsonl`.

## Install (one line)

**bash / zsh:**

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/sunapi386/skill-memory/main/install.sh)
```

**fish:**

```fish
curl -fsSL https://raw.githubusercontent.com/sunapi386/skill-memory/main/install.sh | bash
```

This installs:

- `skill-memory` CLI to `~/.local/bin/skill-memory`
- `SKILL.md` to `~/.claude/skills/skill-memory/SKILL.md` — auto-loaded by OpenClaw / Claude Code

## Usage

```bash
# Agent recalls before acting
skill-memory recall "supabase rls"

# Agent learns after finishing
skill-memory learn "When writing Supabase queries, always use .throwOnError() instead of manual error checks. Because it's cleaner and matches the codebase style."

# Housekeeping
skill-memory list          # dump everything
skill-memory count         # how many lessons
```

## Why this wins the hackathon prompt

The track asked for: *memory systems that let agents compound knowledge across sessions* and *self-improvement loops that help agents reflect, upgrade, and evolve autonomously*.

This is the smallest possible thing that actually does both:

- **Memory across sessions** — lessons persist in a plain JSONL file the agent owns
- **Self-improvement loop** — the protocol in `SKILL.md` tells the agent *when* to read and *when* to write, so it improves without supervision
- **Compounds across agents** — JSONL is trivially shareable. One agent's mistake becomes another agent's shortcut.

## The lesson format

```json
{"ts":"2026-04-12T23:15:00Z","cwd":"/home/jason/project","lesson":"When X, do Y. Because Z."}
```

The `Because Z.` is the load-bearing part. A rule without a reason rots the first time you hit an edge case. A rule *with* a reason lets future-you judge whether it still applies.

## The protocol (in `SKILL.md`)

Full content in [`SKILL.md`](./SKILL.md). Summary:

| When | Do this |
|---|---|
| Before any non-trivial task | `skill-memory recall <keywords>` |
| After any surprising outcome | `skill-memory learn "..."` |
| Before picking a tool | recall first — you may have decided before |

**Log**: test failures that took >1 try, library quirks, user corrections, patterns that worked, dead ends.
**Don't log**: things already in code/CLAUDE.md, one-off trivia, ephemeral task state.

## Why not just use conversation memory / context?

- Conversation memory dies with the session
- Vector DBs are overkill for <10K lessons and hide what's in them
- `~/.skill-memory/lessons.jsonl` is human-readable, greppable, versionable, and yours

## Roadmap

- [ ] `skill-memory export --format botcord` — publish a lesson bundle as a Botcord subscription
- [ ] `skill-memory import <url>` — pull a community lesson bank from another agent
- [ ] Embedding-based recall for fuzzy matches
- [ ] Lesson decay / voting — surface the lessons that actually keep getting reused

## License

MIT
