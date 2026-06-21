---
name: ai-worktree-hygiene
description: Use when git status is dirty, ignored local/runtime residue or scratch outputs appear, research caches or package-manager files appear, dogfood/case sentinel terms leak into product source, an AI coding phase/lane/subagent batch finishes, before switching lanes or versions, before committing/merging/pushing, or whenever a worktree cannot be explained by lane, phase, evidence, and next action.
---

# AI Worktree Hygiene

Keep an AI-assisted coding worktree reviewable before doing more product work.
This skill is a stop gate, not a cleanup afterthought.

Core rule:

```text
Do not start the next product phase when the current worktree cannot be explained by lane, phase, evidence, and next action.
```

## Trigger Decision

Treat this skill as a gate, not a reminder. If a hard trigger matches, stop product work and write the hygiene checkpoint first.

```text
Do not continue with product work until the hygiene checkpoint is written.
```

### Hard Triggers

Run the full process immediately when any of these is true:

- git status --short is non-empty.
- tracked clean is not phase clean: `git status --short` is empty but `git status --ignored --short` shows ignored local/runtime residue before a phase switch, handoff, commit, merge, push, or claim.
- ignored generated outputs such as dist/, coverage/, build/, or .starter-os/ exist after verification or export commands.
- large repo-local generated, dependency, or runtime directories such as `.starter-os/`, `.local/`, `.venv/`, `node_modules/`, `db/`, `data/`, `reports/`, or `dist/` appear untracked, ignored, or unexplained.
- a workflow graph or dashboard runtime exists but contract, verification, mismatch, repair, or ledger artifacts are missing.
- a dogfood/case adapter or pilot-report reader is added and case sentinel terms appear in product source, default UI copy, core schemas, or generic docs outside case-study artifacts, fixtures, or boundary tests.
- camelCase case sentinel keys, snake_case fields, report filenames, or legacy case report identifiers leak from case artifacts into product source, default UI copy, core schemas, or generic docs.
- `.research/`, cloned external repositories, downloaded datasets, or other raw research caches appear in the repo tree.
- `pnpm-lock.yaml`, `yarn.lock`, `pnpm-workspace.yaml`, or another package-manager artifact appears without an approved package-manager migration.
- A scan, dashboard, export, or verification command has run without a declared output lane and cleanup/keep decision.
- A build, dashboard, scan, export, verification, or dry-run command wrote to `/tmp` or another outside-repo scratch path without recording the path, input source, private-data status, and cleanup decision.
- An AI coding phase, lane, work order, or subagent batch has finished and its changes have not been classified.
- One shared file, such as `types.ts`, `store.ts`, `cli.ts`, or `tools.ts`, mixes multiple version phases or product layers.
- Preparing to commit, merge, push, publish, hand off, or start a new version from the current branch.

### Soft Triggers

Run at least the lightweight status and ignored-output checks when any of these is true. Escalate to the full process if anything is dirty or unexplained:

- Moving from research to spec, spec to plan, plan to implementation, implementation to review, or one lane to another.
- Before promoting dogfood/case report handling into generic core, dashboard, adapters, or docs.
- Before running any scan, dashboard, export, or verification command that may materialize project-local artifacts.
- Before or after a dry-run that writes to `/tmp` or another outside-repo scratch path.
- Finishing a verification command that may write generated files.
- Returning to a branch after context compaction, a long pause, or another thread/subagent changed related files.
- Feeling tempted to say "tests pass" before the branch is reviewable.
- A user asks whether the project is dirty, clean, ready, reviewable, or safe to open source.

## Process

1. Confirm whether the active checkout is main or an isolated worktree:

   ```bash
   git worktree list
   git branch --show-current
   git status --short
   git status --ignored --short | sed -n '1,160p'
   ```

2. Measure the dirty state:

   ```bash
   git diff --stat
   git ls-files --others --exclude-standard
   git ls-files --others --ignored --exclude-standard | sed -n '1,120p'
   du -sh .starter-os .local .venv node_modules db data reports dist coverage build .research docs/research docs/specs docs/plans src tests adapters 2>/dev/null || true
   ```

3. Check stop gates before continuing:

   - Main is dirty and the task did not explicitly target main cleanup.
   - `.research/` or another raw cache appears in untracked files.
   - Ignored generated outputs appear after verification and are not recorded as local residue or cleaned with user-approved intent.
   - `git status --short` is clean but ignored local-runtime or generated-runtime residue is present and has not been classified.
   - Package-manager artifacts appear without approved migration.
   - Large generated/runtime directories are present and lack a keep/discard/ignore decision.
   - A generated workflow graph or dashboard runtime is present, but contract, verification, mismatch, repair, or ledger artifacts needed for the product claim are missing.
   - Case sentinel terms or key variants appear in product source, default UI copy, core schemas, or generic docs instead of staying in case-study artifacts, fixtures, generated/extracted evidence, or boundary tests.
   - Outside-repo scratch outputs exist without a recorded scratch path, input source, private-data status, and cleanup decision.
   - A new phase has started while the previous phase lacks a closure record.
   - Subagent work returned without an integration checkpoint.
   - Tests pass but the dirty state cannot be explained in one paragraph.
   - One shared file mixes multiple product layers without a slicing plan.

4. Classify every path into one lane:

   - `product-code`
   - `tests`
   - `spec-plan`
   - `research-summary`
   - `research-cache`
   - `generated-runtime`
   - `local-runtime`
   - `scratch-outside-repo`
   - `dependency`
   - `accidental-tooling`
   - `unknown`

5. Keep raw external repository clones out of product commits. A research cache is local source material, not product source.

6. Keep the package-manager boundary explicit. If the repo commits one lockfile format, treat a different lockfile format as a discard candidate unless the user approves a migration.

7. Treat build, scan, dashboard, export, verification, and dry-run commands as write-risky unless proven read-only. Before running one, name its expected output lane. After running one, classify every generated path as `generated-runtime`, `dependency`, `local-runtime`, or `scratch-outside-repo`.

   For outside-repo scratch outputs, record the scratch path, input source, whether private reports or case artifacts were read, whether the output should be destroyed, and who owns cleanup.

8. Separate runtime readiness from product readiness. A generated graph, dashboard, report bundle, or chunk index only proves that an artifact exists. It does not prove that expected contracts, mismatch attribution, repair paths, work orders, or claim transitions are complete.

9. Separate case evidence from product semantics. A case adapter may read case artifacts and pass extracted labels through evidence/report fields. Product source, default UI copy, core schemas, and generic docs must not hardcode case sentinel terms; allow them only in case-study docs, fixtures, generated/extracted evidence, and explicit boundary tests.

   Check both human labels and machine key variants: title text, report filenames, snake_case fields, kebab-case ids, camelCase case sentinel keys, and legacy case identifiers.

10. Verify behavior before recommending commit or discard:

   ```bash
   npm test 2>/dev/null || true
   npm run build 2>/dev/null || true
   ```

   Replace these with the project's real verification commands.

11. Verify explainability separately from behavior:

   - Can the dirty state be summarized by lane?
   - Can each lane name its owner phase?
   - Can each lane name its verification evidence?
   - Can each lane say keep, discard, commit, or review?
   - Can the next action be done without touching unrelated lanes?
   - If generated runtime artifacts exist, can you say which product-chain artifacts are still missing?
   - If ignored residue exists, can you explain why tracked clean is not phase clean and name the local-runtime/generated-runtime owner?
   - If scratch outputs exist outside the repo, can you name the scratch path, input source, private-data status, and cleanup decision?
   - If dogfood/case artifacts exist, can you list the case sentinel terms and key variants, then prove they stay out of product source, default UI copy, and core schemas?

12. Produce a checkpoint report with:

   - clean/dirty state of main and current worktree,
   - ignored generated output status,
   - large generated/runtime directory status,
   - ignored local-runtime residue status,
   - outside-repo scratch output status,
   - graph/runtime readiness versus contract/repair/ledger readiness,
   - case sentinel boundary status,
   - verification commands and results,
   - keep/commit/discard recommendations,
   - lane dependency notes,
   - root-cause notes,
   - next action.

13. Do not delete, revert, or commit user-created files unless the user explicitly approves the proposed action.

## Commit Lanes

Prefer separate commits for:

1. `docs/research`
2. `docs/spec-plan`
3. `product-code`
4. `tests`
5. `deps`
6. `adapters`
7. `hygiene`

If a file cannot fit one lane, stop and inspect it before continuing.

## Root Causes To Check

When the worktree gets hard to read, look for these causes and record which ones apply:

1. Research cache stored like product source.
2. Version labels used for thinking but not closure gates.
3. Subagent execution completed without integration ownership.
4. Passing tests mistaken for repository readiness.
5. Product direction changed while old phase remained unclosed.
6. Package-manager boundary drift.
7. Large shared files hiding multiple product phases.
8. UI, core, docs, adapters, and dependencies all advanced in one branch.
9. Generated runtime artifacts mixed with authored source.
10. No checkpoint before moving to the next spec or implementation phase.
11. Runtime graph or dashboard success mistaken for contract, repair, or claim readiness.
12. Environment, database, report, and dashboard outputs kept inside the repo without an explicit local-artifact policy.
13. Case-specific labels from dogfood or pilot reports promoted into product schema, default UI copy, or generic docs instead of staying extracted evidence.
14. Tracked clean mistaken for phase clean because ignored local-runtime or generated-runtime residue was not checked.
15. Outside-repo scratch outputs omitted from the checkpoint even though they were produced from private inputs or case artifacts.
16. Machine-readable case keys promoted into generic product code because only human-facing sentinel words were checked.

For each cause, write one prevention action into the checkpoint report.

## Required Lane Review Output

A useful report must include:

- lane name,
- file list or file pattern,
- keep/discard/commit/review decision,
- dependency on other lanes,
- risk,
- suggested commit message,
- whether it can be cherry-picked independently,
- whether it blocks the next product phase.

## Lane Retrospective Prompts

For every lane you touch, answer these before staging:

```text
Why did this lane appear?
Why did it get mixed with other lanes?
What would have prevented the mix?
What evidence proves this lane is safe to keep?
What should trigger this skill earlier next time?
```

If the answer reveals a new prevention rule, update this skill or the process doc before committing the lane.
