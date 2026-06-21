# AI Worktree Hygiene

AI Worktree Hygiene is a lightweight checkpoint skill for AI-assisted coding projects.
It helps Codex, Claude Code, Cursor, and other coding agents stop before a repository
becomes impossible to review.

Use it when tests pass but the project still feels messy:

- dirty git status
- ignored `dist/`, `coverage/`, or generated runtime output
- cloned research repositories mixed with product code
- accidental package-manager drift such as `pnpm-lock.yaml` in an npm project
- multiple AI agent or subagent batches writing into the same branch
- large commits that mix product code, tests, docs, research, dependencies, and generated files

The goal is simple: before continuing, committing, merging, pushing, or handing off,
classify the worktree into lanes and produce an explainable action plan.

## Why This Exists

AI coding tools can move faster than the repository can stay understandable.
A project may have passing tests while still being unsafe to review because source,
experiments, generated artifacts, dependency changes, and handoff notes are all mixed.

This repository gives agents and humans a shared stop gate:

```text
actual worktree state
-> expected lane and phase boundary
-> mismatch between actual and expected process state
-> attributed root cause
-> repair path
-> verification evidence
-> commit or discard decision
```

## What It Is

This is not a git worktree manager and not a replacement for your coding agent.
It is a hygiene checkpoint that fits inside an existing AI coding workflow.

It includes:

- `skills/ai-worktree-hygiene/SKILL.md` - the reusable agent skill
- `templates/hygiene-checkpoint.md` - a report template for dirty state review
- `templates/lane-review.md` - a lane-by-lane commit/discard template
- `examples/dirty-worktree-before.md` - a realistic messy state
- `examples/hygiene-checkpoint-after.md` - the expected cleaned-up analysis
- `scripts/verify.sh` - package checks for triggers, templates, and private-context leaks

## Quick Start

Copy the skill into your agent's skill directory or reference it from your project docs.

For Codex or Claude-style skill folders:

```bash
mkdir -p ~/.codex/skills/ai-worktree-hygiene
cp skills/ai-worktree-hygiene/SKILL.md ~/.codex/skills/ai-worktree-hygiene/SKILL.md
```

For project-local use:

```bash
cp skills/ai-worktree-hygiene/SKILL.md ./.ai-worktree-hygiene.md
cp templates/hygiene-checkpoint.md ./hygiene-checkpoint.md
```

Then ask your agent:

```text
Use ai-worktree-hygiene to check whether this branch is safe to continue, commit, or hand off.
```

## Hard Triggers

Run the full hygiene checkpoint immediately when:

- `git status --short` is non-empty
- ignored generated outputs such as `dist/`, `coverage/`, `build/`, or `.starter-os/` exist after verification commands
- `.research/`, cloned external repositories, downloaded datasets, or raw research caches appear in the repo tree
- package-manager files appear without an approved migration
- a phase, lane, or subagent batch has finished and has not been classified
- a shared file mixes multiple product layers or version phases
- you are preparing to commit, merge, push, publish, hand off, or start a new version

## Lanes

Classify every changed path into exactly one lane:

| Lane | Meaning |
| --- | --- |
| `product-code` | Authored runtime code |
| `tests` | Test code, fixtures, snapshots |
| `spec-plan` | Specs, plans, design docs, case studies |
| `research-summary` | Distilled research notes safe to commit |
| `research-cache` | Raw cloned repositories, papers, downloaded artifacts |
| `generated-runtime` | Build output, dashboards, coverage, compiled assets |
| `dependency` | Package files, lockfiles, toolchain configuration |
| `accidental-tooling` | Editor files, local caches, accidental workspace artifacts |
| `unknown` | Anything that cannot be explained yet |

If a file cannot fit one lane, stop and inspect it before continuing.

## Example Commands

```bash
git worktree list
git branch --show-current
git status --short
git diff --stat
git ls-files --others --exclude-standard
git ls-files --others --ignored --exclude-standard | sed -n '1,120p'
```

## When To Use This Instead Of Other Tools

Use this repository when you want a small, copyable skill/checkpoint.

Use a fuller tool when you need active monitoring, a UI, or orchestration:

- FlowCheck is closer to an MCP safety layer for ongoing git hygiene monitoring.
- Vibe Kanban and similar tools are closer to full AI-agent workspace managers.
- Parallel worktree tools help run multiple agents; this skill helps review what they left behind.

No code is copied from those projects. They are useful reference points for the ecosystem.

## Discoverability Keywords

AI coding, AI agent workflow, Codex, Claude Code, Cursor, git hygiene, worktree hygiene,
dirty worktree, repository hygiene, vibe coding, agentic development, subagent workflow,
commit hygiene, generated artifacts, research cache, MCP workflow.

## Contributing

Good contributions add pressure-tested scenarios:

- a new dirty worktree pattern
- a better lane classification
- a clearer checkpoint template
- a regression test in `scripts/verify.sh`

See `CONTRIBUTING.md`.

## License

MIT. See `LICENSE`.
