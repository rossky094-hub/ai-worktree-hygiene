# Hygiene Checkpoint

## Repository State

- Repository:
- Branch:
- Isolated worktree:
- Main branch dirty:
- Current branch dirty:
- Tracked clean / phase clean conclusion:
- Untracked files:
- Ignored generated outputs:
- Ignored local-runtime residue:
- Large generated/runtime directories:
- Scratch outside repo outputs:
  - Scratch path:
  - Input source:
  - Private reports or case artifacts read:
  - Destroy / keep decision:
- Existing chain audit:
  - Required:
  - Completed:
  - Existing chain extended / bypassed:
  - Bypass justification:
- Version-chain status:
  - Versioned repo or numbered slices:
  - Active version marker:
  - Branch/worktree owner:
  - Closure or continuation decision:
- Implemented vs materialized:
  - Implemented in source:
  - Covered by tests:
  - Documented by case study or evidence:
  - Present in current artifact:
  - Claim-sufficient:
- Research gate:
  - Prior research summaries checked:
  - Source/tests/manifests checked:
  - Adapter provenance or outside cache checked:
  - Missing research vs stale artifact conclusion:
- Authored artifact continuity:
  - New authored artifacts affecting direction/claims:
  - Parent goal and lane/module:
  - Upstream evidence and downstream consumer:
  - Can/cannot-claim boundary:
  - Next decision:
- Subagent diff whitelist review:
  - Subagent or worker returned changes:
  - Expected lane and file set:
  - Unexpected paths:
  - while-here enhancement isolated:
- Generated/runtime readiness trap:
  - Workflow graph or dashboard runtime exists:
  - Contracts/verifications/mismatches/repairs/ledger exist:
  - Claim readiness conclusion:
- Case sentinel boundary:
  - Dogfood/case artifacts read:
  - Sentinel terms found in product source/default UI/core schema:
  - camelCase/key variants checked:
  - Allowed only in case-study docs, fixtures, generated evidence, or boundary tests:
- Raw research caches:
- Package-manager drift:

## Verification Evidence

| Command | Result | Notes |
| --- | --- | --- |
| `git status --short` |  |  |
| `git status --ignored --short` |  |  |
| `git diff --stat` |  |  |
| `git diff --name-only` |  |  |
| `git ls-files --others --exclude-standard` |  |  |
| `git ls-files --others --ignored --exclude-standard` |  |  |
| `du -sh .starter-os .local .venv node_modules db data reports dist coverage build .research 2>/dev/null || true` |  |  |

## Lane Summary

| Lane | Paths | Decision | Risk | Evidence |
| --- | --- | --- | --- | --- |
| product-code |  | keep / commit / review / discard |  |  |
| tests |  | keep / commit / review / discard |  |  |
| spec-plan |  | keep / commit / review / discard |  |  |
| research-summary |  | keep / commit / review / discard |  |  |
| research-cache |  | keep / commit / review / discard |  |  |
| generated-runtime |  | keep / commit / review / discard |  |  |
| local-runtime |  | keep / commit / review / discard |  |  |
| scratch-outside-repo |  | keep / commit / review / discard |  |  |
| dependency |  | keep / commit / review / discard |  |  |
| accidental-tooling |  | keep / commit / review / discard |  |  |
| unknown |  | keep / commit / review / discard |  |  |

## Root Cause Review

- What made the branch hard to review?
- Which stop gate should have fired earlier?
- Did tracked clean get mistaken for phase clean?
- Did a new product slice bypass existing specs, dogfood runs, case studies, or generated project artifacts without an Existing Chain Audit?
- Did a versioned slice lack a version marker, branch/worktree owner, lane, evidence state, or closure decision?
- Did a stale generated artifact get mistaken for missing source implementation?
- Did research get called absent before prior notes, source/tests, manifests, provenance, or outside caches were checked?
- Did an authored artifact get treated as done without a parent goal, lane/module, upstream evidence, downstream consumer, claim boundary, and next decision?
- Did subagent work get accepted before diff whitelist review?
- Did a while-here enhancement or cross-lane cleanup sneak into the current slice?
- Which lane mixed with another lane?
- Which files need slicing before commit?
- Which generated outputs should stay ignored or be cleaned?
- Which ignored local-runtime residue is expected and which should be cleaned?
- Which outside-repo scratch paths were written, and do they need destruction?
- Did a generated graph, dashboard, or report bundle get mistaken for contract, repair, or claim readiness?
- Did any scan, dashboard, export, or verification command write artifacts without a declared output lane?
- Did dogfood/case labels or machine-readable key variants get promoted into product source, default UI copy, core schema, or generic docs?

## Recommended Action

1. 
2. 
3. 

## Commit Plan

| Order | Commit Message | Paths | Verification |
| --- | --- | --- | --- |
| 1 |  |  |  |
| 2 |  |  |  |
| 3 |  |  |  |

## Next Product Action

- Allowed:
- Blocked until:
- User confirmation needed:
