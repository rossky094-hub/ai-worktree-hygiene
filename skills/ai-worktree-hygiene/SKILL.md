---
name: ai-worktree-hygiene
description: Use when git status is dirty, ignored local/runtime residue or scratch outputs appear, research caches or package-manager files appear, dogfood/case sentinel terms leak into product source, an AI coding phase/lane/subagent batch finishes, before adding parallel slices in multi-version/dogfood repos, before switching lanes or versions, before committing/merging/pushing, or whenever a worktree cannot be explained by lane, phase, evidence, and next action.
---

# AI Worktree Hygiene

Keep an AI-assisted coding worktree reviewable before doing more product work.
This skill is a stop gate, not a cleanup afterthought.

Core rule:

```text
Do not start the next product phase when the current worktree cannot be explained by lane, phase, evidence, and next action.
```

Existing-chain rule:

```text
In a project with prior versioned specs, dogfood runs, case studies, or generated project artifacts, do not add a new spec, adapter, fixture, dashboard slice, compatibility harness, projection, or repair graph until an Existing Chain Audit proves the capability is missing or justifies why the new path must bypass the existing chain.
```

Version-chain rule:

```text
In a repo that uses numbered specs or versioned slices, do not create the next spec, plan, adapter, fixture, dashboard slice, or implementation branch until the current slice has an explicit version marker, branch/worktree owner, lane, evidence state, and closure or continuation decision.
```

Implemented-vs-materialized rule:

```text
Before saying a capability must be newly developed or replaced, separate what is implemented in source, covered by tests, documented by case study, present in the current artifact, and strong enough to claim the target outcome. A stale dashboard or runtime artifact is not the same problem as missing implementation.
```

Research-gate rule:

```text
Do not label provider, memory, code graph, adapter, vendor, or competitor research as "not done" until research notes, versioned specs, source manifests, focused tests, adapter provenance, and outside-repo research caches have been checked. A missing final shortlist, stale provenance, broken archive, or non-executable adapter is not the same as absent source-level research.
```

Authored-artifact continuity rule:

```text
An authored file is not complete just because it exists. If it affects project direction, claim boundaries, specs, plans, provider boundaries, dashboard behavior, case evidence, current rail state, or the next repair decision, it must be linked into the active project chain: parent goal, lane/module, upstream evidence, downstream consumer, can/cannot-claim boundary, and next decision. Ordinary source files do not need boilerplate headers if they are classifiable by path, module ownership, tests, imports, graph evidence, or surrounding spec/plan context.
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
- A repo already has versioned dogfood/case-study artifacts or generated project outputs, and the next action proposes a new spec, adapter, fixture, dashboard slice, compatibility harness, projection, or repair graph without an Existing Chain Audit.
- A versioned spec, plan, runbook, or checkpoint is created without the version marker in filename, title, or metadata.
- The next proposed slice has no branch/worktree name that identifies the active version and lane.
- A "thin spec" or small docs slice is proposed as an exception to version, branch/worktree, lane, or Existing Chain Audit rules.
- The next action treats a missing current artifact field, stale dashboard state, or weak report shape as proof that the source capability does not exist.
- A PRD, spec, decision note, or cannot-claim list says source-level provider, memory, code graph, adapter, vendor, or competitor research is incomplete without checking prior research summaries, hardened provider boundaries, source/tests, adapter manifests, and outside-repo research caches.
- A new authored artifact affects direction, claim boundaries, specs, plans, provider boundaries, dashboard behavior, case evidence, current rail state, or next repair but is not recoverably linked from the current rail, a spec/plan, an ADR, a generated artifact, or an obvious module/test context.
- A patch, hardening slice, ADR, or research artifact is promoted to a new major product version label without introducing a new product capability, semantic object, dashboard surface, provider boundary, ledger transition, or end-to-end workflow.
- `.research/`, cloned external repositories, downloaded datasets, or other raw research caches appear in the repo tree.
- `pnpm-lock.yaml`, `yarn.lock`, `pnpm-workspace.yaml`, or another package-manager artifact appears without an approved package-manager migration.
- A scan, dashboard, export, or verification command has run without a declared output lane and cleanup/keep decision.
- A build, dashboard, scan, export, verification, or dry-run command wrote to `/tmp` or another outside-repo scratch path without recording the path, input source, private-data status, and cleanup decision.
- An AI coding phase, lane, work order, or subagent batch has finished and its changes have not been classified.
- Subagent, worker, or delegated implementation returned without a diff whitelist review against the requested lane and expected file set.
- A worker introduces a cross-lane while-here enhancement, new slice, extra spec, adapter, fixture, dashboard panel, compatibility harness, projection, or repair graph that was not in the approved work order.
- One shared file, such as `types.ts`, `store.ts`, `cli.ts`, or `tools.ts`, mixes multiple version phases or product layers.
- Preparing to commit, merge, push, publish, hand off, or start a new version from the current branch.

### Soft Triggers

Run at least the lightweight status and ignored-output checks when any of these is true. Escalate to the full process if anything is dirty or unexplained:

- Moving from research to spec, spec to plan, plan to implementation, implementation to review, or one lane to another.
- Naming or renaming a major spec, plan, runbook, checkpoint, branch, or worktree in a versioned repo.
- Before describing a capability as "not implemented", "needs to be built", "should be replaced", or "should be delegated to an external provider".
- Before writing a research gate, cannot-claim boundary, PRD competitor section, or provider reuse boundary for code graph, memory, adapters, or vendor choices.
- Before committing or handing off a new authored artifact that affects direction, claimability, current rail state, dashboard behavior, or next repair.
- Before naming a slice as a new major version, minor version, ADR, or research summary.
- Before proposing or implementing the next product slice in a repo with prior versioned specs, dogfood runs, case studies, or generated project artifacts.
- Before promoting dogfood/case report handling into generic core, dashboard, adapters, or docs.
- Before running any scan, dashboard, export, or verification command that may materialize project-local artifacts.
- Before or after a dry-run that writes to `/tmp` or another outside-repo scratch path.
- After any subagent, worker, or delegated implementation returns changes.
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

3. If the repo has prior versioned specs, dogfood runs, case studies, or generated project artifacts, complete an Existing Chain Audit before proposing or implementing any new product slice:

   | Question | Evidence |
   | --- | --- |
   | Does this capability already exist in the repo? | File paths, line references, commands, artifacts, or "not found after search terms: ..." |
   | Where is the evidence? | Specific specs, source modules, tests, case studies, dashboard artifacts, ledgers, generated outputs, or absence evidence |
   | What is implemented, partially implemented, and already failed? | Separate implementation evidence from dogfood/failure evidence |
   | Is prior external research already summarized or hardened? | Check research notes, specs, source manifests, focused tests, adapter provenance, and outside-repo research caches before calling research absent |
   | Is it implemented, tested, case-documented, materialized in the current artifact, and claim-sufficient? | Fill each column separately; do not collapse them into one yes/no |
   | What version owns the current slice? | Spec/plan filenames, titles, metadata, branch/worktree name, or "missing and must be repaired before continuing" |
   | Does the current proposal extend the existing chain or bypass it? | Name the chain being extended or the bypass being introduced |
   | If it bypasses the chain, why is bypass required? | Concrete blocker, not convenience, speed, or a local smoke-test desire |
   | If a new authored artifact exists, how is it embedded? | Parent goal, lane/module, upstream evidence, downstream consumer, can/cannot-claim boundary, next decision, and rail/spec/ADR/graph/module link |

   No table, no implementation. "I remember from context" is not evidence. A runtime artifact existing is not proof that the product claim, contract, mismatch attribution, repair path, or ledger transition is complete.

4. If a subagent, worker, or delegated implementation returned changes, run a diff whitelist review before accepting success:

   ```bash
   git diff --stat
   git diff --name-only
   git diff -- README.md scripts/verify.sh skills/ai-worktree-hygiene/SKILL.md templates/hygiene-checkpoint.md
   ```

   Replace the final command with the expected files from the work order. Every changed path must be allowed by the approved lane and requested file set. A while-here enhancement, cross-lane cleanup, extra fixture, extra adapter, or new product slice must be isolated into a separate slice or rejected from the current one.

5. Check stop gates before continuing:

   - Main is dirty and the task did not explicitly target main cleanup.
   - `.research/` or another raw cache appears in untracked files.
   - Ignored generated outputs appear after verification and are not recorded as local residue or cleaned with user-approved intent.
   - `git status --short` is clean but ignored local-runtime or generated-runtime residue is present and has not been classified.
   - Package-manager artifacts appear without approved migration.
   - Large generated/runtime directories are present and lack a keep/discard/ignore decision.
   - A generated workflow graph or dashboard runtime is present, but contract, verification, mismatch, repair, or ledger artifacts needed for the product claim are missing.
   - A new spec, adapter, fixture, dashboard slice, compatibility harness, projection, or repair graph is proposed in a repo with prior dogfood/case-study evidence, but no Existing Chain Audit ties it to existing capability, partial implementation, or documented failure.
   - A new spec, plan, runbook, checkpoint, branch, or worktree lacks a clear version owner in a versioned repo.
   - A previous versioned spec is unnamed, unclosed, or ambiguous, but the next version is being proposed anyway.
   - A companion spec and plan disagree about their version owner.
   - A missing field in a current generated artifact is being treated as missing source implementation without checking source, tests, case-study, and artifact freshness separately.
   - A missing final provider shortlist, stale upstream refresh, broken source archive, or non-executable adapter is being treated as proof that source-level external research was never done.
   - A new authored artifact changes project context but remains only a loose file, untracked note, or chat-explained document.
   - A small patch, hardening fix, research summary, or ADR is consuming a new major product version label instead of staying in a patch, ADR, or research lane.
   - Case sentinel terms or key variants appear in product source, default UI copy, core schemas, or generic docs instead of staying in case-study artifacts, fixtures, generated/extracted evidence, or boundary tests.
   - Outside-repo scratch outputs exist without a recorded scratch path, input source, private-data status, and cleanup decision.
   - A new phase has started while the previous phase lacks a closure record.
   - Subagent work returned without an integration checkpoint.
   - Subagent work returned without a diff whitelist review.
   - A while-here enhancement or cross-lane change is mixed into the current slice.
   - Tests pass but the dirty state cannot be explained in one paragraph.
   - One shared file mixes multiple product layers without a slicing plan.

6. Classify every path into one lane:

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

7. Keep raw external repository clones out of product commits. A research cache is local source material, not product source.

8. Keep the package-manager boundary explicit. If the repo commits one lockfile format, treat a different lockfile format as a discard candidate unless the user approves a migration.

9. Treat build, scan, dashboard, export, verification, and dry-run commands as write-risky unless proven read-only. Before running one, name its expected output lane. After running one, classify every generated path as `generated-runtime`, `dependency`, `local-runtime`, or `scratch-outside-repo`.

   For outside-repo scratch outputs, record the scratch path, input source, whether private reports or case artifacts were read, whether the output should be destroyed, and who owns cleanup.

10. Separate runtime readiness from product readiness. A generated graph, dashboard, report bundle, or chunk index only proves that an artifact exists. It does not prove that expected contracts, mismatch attribution, repair paths, work orders, or claim transitions are complete.

11. Separate case evidence from product semantics. A case adapter may read case artifacts and pass extracted labels through evidence/report fields. Product source, default UI copy, core schemas, and generic docs must not hardcode case sentinel terms; allow them only in case-study docs, fixtures, generated/extracted evidence, and explicit boundary tests.

   Check both human labels and machine key variants: title text, report filenames, snake_case fields, kebab-case ids, camelCase case sentinel keys, and legacy case identifiers.

12. Verify behavior before recommending commit or discard:

   ```bash
   npm test 2>/dev/null || true
   npm run build 2>/dev/null || true
   ```

   Replace these with the project's real verification commands.

13. Verify explainability separately from behavior:

   - Can the dirty state be summarized by lane?
   - Can each lane name its owner phase?
   - Can each lane name its verification evidence?
   - Can each lane say keep, discard, commit, or review?
   - Can the next action be done without touching unrelated lanes?
   - If this is a versioned repo, can you name the active version, matching branch/worktree, owner lane, and closure or continuation decision?
   - If proposing a new product slice, does the Existing Chain Audit prove whether it extends an existing chain, repairs a documented failure, or intentionally bypasses a blocked chain?
   - If a new authored artifact was created, can another agent explain its parent goal, lane/module, upstream evidence, downstream consumer, claim boundary, and next decision without chat history?
   - If this is called a new major version, does it truly introduce a new product contract rather than a patch, ADR, or research summary?
   - If a capability appears absent, can you separate implementation state, test coverage, case-study evidence, current artifact materialization, and claim sufficiency?
   - If subagent work returned, can you show the diff whitelist review and explain every changed path?
   - If a while-here enhancement appeared, was it rejected from this slice or isolated into a separate approved slice?
   - If generated runtime artifacts exist, can you say which product-chain artifacts are still missing?
   - If ignored residue exists, can you explain why tracked clean is not phase clean and name the local-runtime/generated-runtime owner?
   - If scratch outputs exist outside the repo, can you name the scratch path, input source, private-data status, and cleanup decision?
   - If dogfood/case artifacts exist, can you list the case sentinel terms and key variants, then prove they stay out of product source, default UI copy, and core schemas?

14. Produce a checkpoint report with:

   - clean/dirty state of main and current worktree,
   - ignored generated output status,
   - large generated/runtime directory status,
   - ignored local-runtime residue status,
   - outside-repo scratch output status,
   - existing chain audit status for repos with prior versioned specs, dogfood runs, case studies, or generated project artifacts,
   - version-chain status for repos with numbered specs or versioned slices,
   - subagent diff whitelist review status,
   - graph/runtime readiness versus contract/repair/ledger readiness,
   - case sentinel boundary status,
   - verification commands and results,
   - keep/commit/discard recommendations,
   - lane dependency notes,
   - root-cause notes,
   - next action.

15. Do not delete, revert, or commit user-created files unless the user explicitly approves the proposed action.

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
17. Existing specs, dogfood runs, case studies, or generated project artifacts were not inventoried before adding a parallel spec, adapter, fixture, dashboard slice, compatibility harness, projection, or repair graph.
18. Subagent output was trusted before diff whitelist review, allowing cross-lane changes into the current slice.
19. A while-here enhancement was accepted because it looked useful, not because it belonged to the approved lane and work order.
20. A spec or plan was treated as "small" and therefore skipped version, branch/worktree, lane, and closure gates.
21. A version label lived only in chat memory, not in filenames, titles, metadata, branch/worktree names, or checkpoint records.
22. A stale or incomplete generated artifact was mistaken for absent source implementation.
23. External research context displaced the local source/test/case-study evidence chain.
24. A provider shortlist, provenance-refresh, archive-integrity, or executable-adapter gap was misclassified as "source-level research not done."
25. An authored artifact was treated as done when written, but not linked into the current rail, spec/plan, ADR, graph, or module/test context.
26. A patch, hardening slice, ADR, or research artifact consumed a new major product version label and obscured the real product layer being changed.

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
