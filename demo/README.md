# Demo — 5-min terminal walkthrough

This is the live demo script for the OpenClaw Hack Day submission.
Everything is terminal-only. No slides.

## Setup before recording

1. Open two terminals side-by-side. Font ~18pt.
   - **Left** = "Agent 1 · Session 1"
   - **Right** = "Agent 2 · Session 2"
2. In both terminals, from the repo root:
   ```bash
   ./demo/reset.sh
   ```
3. Start recording. Begin with the left terminal.

## Beat 1 · The problem (0:00–0:30)

> "Agents are powerful but stateless. Every session starts from zero.
> Yesterday's hard-won lesson dies with the conversation.
> skill-memory fixes that in 50 lines of bash."

**Left terminal:**
```bash
cat ~/.skill-memory/lessons.jsonl
```

Shows `No such file or directory`. That's the problem — empty brain.

## Beat 2 · One-line install (0:30–1:00)

> "One command. Installs the CLI and the OpenClaw skill definition."

**Left:**
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/sunapi386/skill-memory/main/install.sh)
```

```bash
ls ~/.claude/skills/skill-memory/
skill-memory help
```

## Beat 3 · Session 1 — agent learns (1:00–2:30)

> "Imagine an agent just debugged a gnarly Supabase issue.
> It finishes the task and logs the lesson."

**Left** — run the seed script (or type lessons live if you want the drama):
```bash
./demo/seed.sh
```

> "Three lessons. Each structured as situation → action → reason.
> The reason is load-bearing — it lets the next agent judge edge cases
> instead of cargo-culting."

**Show the raw file:**
```bash
cat ~/.skill-memory/lessons.jsonl
```

One JSON line per lesson. Greppable. Human-readable. No server.

## Beat 4 · Session 2 — different agent, same brain (2:30–3:45)

**Switch to right terminal.** Fresh shell, no context.

> "Brand new agent, brand new session. Different task, different codebase.
> Let's see if the lessons carry over."

**Right:**
```bash
skill-memory recall supabase
skill-memory recall "port 3000"
skill-memory recall flaky
```

> "Three minutes ago this agent knew nothing about Supabase quirks or
> Next.js zombies. Now it does. Zero conversation context transferred —
> just the file."

**Show the OpenClaw skill definition:**
```bash
head -25 ~/.claude/skills/skill-memory/SKILL.md
```

> "This is the protocol. OpenClaw loads it automatically. The agent
> reads it once and knows when to recall and when to log — without me
> telling it."

## Beat 5 · Compounding + Botcord (3:45–4:30)

> "One agent's lessons is a notepad. A team's is a playbook.
> A community's is a second brain."

```bash
skill-memory count
```

> "JSONL is trivially mergeable. `cat` two files and you have a shared
> brain. Which is exactly what Botcord is for — the public room is the
> community lesson exchange."

```bash
botcord room list | grep -A1 skill-memory
```

Shows `rm_74fe05faef6c` — the public room.

> "Room is live. Any agent running skill-memory can publish its lesson
> bank here and subscribe to others'. Every agent's mistakes become the
> next agent's shortcuts. That's the self-improvement loop."

## Beat 6 · Close (4:30–5:00)

**Switch browser to the GitHub repo.**

> "One-line install. MIT licensed. github.com/sunapi386/skill-memory.
> Botcord room rm_74fe05faef6c. And in the spirit of dogfooding — the
> agent that built this is already using skill-memory on my real
> codebase right now."

**Back to terminal:**
```bash
skill-memory learn "When shipping a hackathon submission in under 30 minutes, the repo is the demo. Because polish is for V2."
skill-memory recall hackathon
```

Fade out on the recall output.

## Files in this folder

| File | Purpose |
|---|---|
| `README.md` | This script — read it before you hit record |
| `reset.sh` | Wipe `~/.skill-memory/` and the installed skill. Run in both terminals before taking 1. |
| `seed.sh` | Log the three demo lessons in one go. Use in Beat 3 if you don't want to type them live. |
| `lessons.jsonl` | The raw lessons seed loads — human-readable reference. |

## What NOT to do on camera

- **No slides.** Track C said terminal not slides. Honor it.
- **Don't explain the JSON format.** Show the file, say "one line per lesson," move on.
- **Don't oversell Botcord.** Room exists, auto-publish is V2. Say "exchange is live, auto-sync is next."
- **Don't type commands into a fresh history** — pre-load them with reverse-search (`Ctrl+R`) ready, or use the seed script.
