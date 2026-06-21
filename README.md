# AI Worktree Hygiene

Your AI agent says "tests pass".

But your branch has research clones, generated files, lockfile drift, and mixed commits.

AI Worktree Hygiene gives Codex, Claude Code, Cursor, and other coding agents a stop
gate before the repo becomes unreviewable.

```text
Before continuing, run an AI Worktree Hygiene checkpoint:
classify dirty state into lanes, explain what to keep/discard/review,
and tell me whether this branch is safe to continue, commit, merge, push, or hand off.
```

## 30-Second Before / After

### Before

Tests pass, but the worktree is not reviewable:

```text
$ git status --short
 M package.json
 M package-lock.json
 M src/dashboard/App.tsx
 M src/core/store.ts
 M tests/dashboard/App.test.tsx
 M docs/specs/dashboard-contracts.md
?? .research/flowcheck/
?? .research/worktree-tools/
?? docs/research/git-hygiene.md
?? pnpm-lock.yaml

$ git ls-files --others --ignored --exclude-standard | sed -n '1,8p'
dist/
coverage/
node_modules/
```

### Run

```text
Use ai-worktree-hygiene to check whether this branch is safe to continue, commit, or hand off.
```

### After

```text
Lane: docs/research
Decision: commit separately
Evidence: distilled summary only

Lane: research-cache
Paths: .research/flowcheck/, .research/worktree-tools/
Decision: discard or keep ignored
Risk: raw external repos must not enter product commits

Lane: dependency
Paths: package.json, package-lock.json, pnpm-lock.yaml
Decision: review
Risk: package-manager drift; delete pnpm-lock.yaml unless migration is approved

Lane: product-code
Paths: src/dashboard/App.tsx, src/core/store.ts
Decision: review and split if core/store mixes unrelated runtime changes

Lane: generated-runtime
Paths: dist/, coverage/
Decision: clean or record as local residue before handoff

Lane: local-runtime
Paths: node_modules/
Decision: keep ignored locally, but record before phase handoff
```

Result:

```text
Not safe to push yet.
Safe next action: commit docs/research first, discard raw research cache,
resolve package-manager drift, then review product-code + tests as one lane.
```

## Why This Exists

AI coding tools can move faster than the repository can stay understandable.
A project may have passing tests while still being unsafe to review because source,
experiments, generated artifacts, dependency changes, and handoff notes are all mixed.

This repository gives agents and humans a shared checkpoint:

```text
actual worktree state
-> expected lane and phase boundary
-> mismatch between actual and expected process state
-> attributed root cause
-> repair path
-> verification evidence
-> commit or discard decision
```

## Quick Start

### Codex

```bash
mkdir -p ~/.codex/skills/ai-worktree-hygiene
cp skills/ai-worktree-hygiene/SKILL.md ~/.codex/skills/ai-worktree-hygiene/SKILL.md
```

Then ask Codex:

```text
Use ai-worktree-hygiene before continuing on this branch.
```

More detail: `docs/install-codex.md`.

### Claude Code

Copy or reference the skill in your Claude Code project instructions, then ask:

```text
Use the AI Worktree Hygiene skill to review this dirty branch before any commit or handoff.
```

More detail: `docs/install-claude-code.md`.

### Cursor

Paste the compact project rule from `docs/install-cursor.md` into Cursor project rules.

Then ask:

```text
Run the worktree hygiene checkpoint and tell me which lanes are safe to commit.
```

### One-Click Prompt

Copy this into any coding agent:

```text
Before continuing, run an AI Worktree Hygiene checkpoint.

Check:
- git status --short
- git status --ignored --short
- git diff --stat
- untracked files
- ignored generated outputs
- large repo-local runtime directories such as .starter-os/, .local/, .venv/, node_modules/, db/, data/, reports/, or dist/
- whether a workflow graph exists but contracts or repair artifacts are missing
- whether a repo with prior versioned specs, dogfood runs, case studies, or generated project artifacts needs an Existing Chain Audit before a new slice
- whether a dogfood or case adapter reads case artifacts while case sentinel terms stay out of product source
- whether case sentinel checks include camelCase/key variants, not only visible labels
- whether returned subagent work passed diff whitelist review against the requested lane and file set
- whether any while-here enhancement or cross-lane cleanup must be isolated into a separate slice
- scratch path outputs outside the repo, including input source, private-data status, and cleanup decision
- research caches
- package-manager drift
- mixed product/test/docs/dependency changes

Classify every path into one lane:
product-code, tests, spec-plan, research-summary, research-cache,
generated-runtime, local-runtime, scratch-outside-repo, dependency,
accidental-tooling, or unknown.

For each lane, say keep, discard, commit, review, or split.
Remember: tracked clean is not phase clean. Do not claim the branch is ready unless
tracked, untracked, ignored, and outside-repo scratch state can be explained by
lane, phase, evidence, and next action.

For multi-version or dogfood-heavy repos: No Existing Chain Audit table, no implementation.
For delegated work: No diff whitelist review, no acceptance.
```

## What It Includes

- `skills/ai-worktree-hygiene/SKILL.md` - the reusable agent skill
- `templates/hygiene-checkpoint.md` - a report template for dirty state review
- `templates/lane-review.md` - a lane-by-lane commit/discard template
- `examples/dirty-worktree-before.md` - a realistic messy state
- `examples/hygiene-checkpoint-after.md` - the expected cleaned-up analysis
- `examples/30-second-demo.md` - the short before/after demo
- `assets/social-preview.png` - a 1280x640 share image
- `scripts/verify.sh` - package checks for triggers, templates, assets, and private-context leaks

## Hard Triggers

Run the full hygiene checkpoint immediately when:

- `git status --short` is non-empty
- `git status --short` is empty but `git status --ignored --short` shows ignored residue before a phase switch, handoff, commit, merge, push, or claim; tracked clean is not phase clean
- ignored generated outputs such as `dist/`, `coverage/`, `build/`, or `.starter-os/` exist after verification commands
- large repo-local runtime directories such as `.starter-os/`, `.local/`, `.venv/`, `node_modules/`, `db/`, `data/`, `reports/`, or `dist/` are untracked, ignored, or unexplained
- a workflow graph exists but contracts or repair artifacts are missing, creating a graph-ready but not claim-ready state
- a repo already has versioned specs, dogfood runs, case studies, or generated project artifacts, and a new spec, adapter, fixture, dashboard slice, compatibility harness, projection, or repair graph is proposed without an Existing Chain Audit
- a dogfood or case adapter reads case artifacts while case sentinel terms appear in product source, default UI copy, core schemas, or generic docs; this is a case sentinel boundary failure
- a dogfood or case adapter only checks visible labels while camelCase/key variants, report filenames, or legacy case identifiers can still leak into product code
- `.research/`, cloned external repositories, downloaded datasets, or raw research caches appear in the repo tree
- package-manager files appear without an approved migration
- a scan, dashboard, export, verification, build, or dry-run command ran without an output lane and cleanup/keep decision
- a dry-run writes to a `/tmp` or outside-repo scratch path without recording the scratch path, input source, private-data status, and destroy/keep decision
- subagent work returns without a diff whitelist review against the approved lane and expected file set
- a worker introduces a cross-lane while-here enhancement that was not in the approved work order
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
| `local-runtime` | Ignored local tool runtimes or installed dependencies such as `.local/`, `.venv/`, or `node_modules/` |
| `scratch-outside-repo` | Temporary outputs outside the repo, such as `/tmp` dry-runs, that still need path and cleanup records |
| `dependency` | Package files, lockfiles, toolchain configuration |
| `accidental-tooling` | Editor files, local caches, accidental workspace artifacts |
| `unknown` | Anything that cannot be explained yet |

If a file cannot fit one lane, stop and inspect it before continuing.

## Comparison

| Project | Best For | Boundary |
| --- | --- | --- |
| AI Worktree Hygiene | Copyable checkpoint skill for dirty branches, generated artifacts, research caches, dependency drift, and commit lanes | Does not run agents, host dashboards, or monitor repositories continuously |
| FlowCheck | MCP-style git hygiene monitoring for AI-first development | Heavier runtime surface; use it when you want active monitoring |
| Vibe Kanban | Agent workspace and task management | Manages work, terminals, and agents; this repo focuses on branch reviewability |
| Parallel worktree tools | Running multiple agents in isolated git worktrees | Helps create parallel work; this repo helps classify what agents leave behind |

No code is copied from related projects. They are useful reference points for the ecosystem.

## GitHub Social Preview

This repo includes `assets/social-preview.png`.

GitHub currently requires social preview images to be uploaded through the repository
Settings UI. Use the image in this repo as the upload asset.

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
