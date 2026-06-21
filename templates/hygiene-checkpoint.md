# Hygiene Checkpoint

## Repository State

- Repository:
- Branch:
- Isolated worktree:
- Main branch dirty:
- Current branch dirty:
- Untracked files:
- Ignored generated outputs:
- Large generated/runtime directories:
- Generated/runtime readiness trap:
  - Workflow graph or dashboard runtime exists:
  - Contracts/verifications/mismatches/repairs/ledger exist:
  - Claim readiness conclusion:
- Raw research caches:
- Package-manager drift:

## Verification Evidence

| Command | Result | Notes |
| --- | --- | --- |
| `git status --short` |  |  |
| `git diff --stat` |  |  |
| `git ls-files --others --exclude-standard` |  |  |
| `git ls-files --others --ignored --exclude-standard` |  |  |
| `du -sh .starter-os .venv db data reports dist coverage build .research 2>/dev/null || true` |  |  |

## Lane Summary

| Lane | Paths | Decision | Risk | Evidence |
| --- | --- | --- | --- | --- |
| product-code |  | keep / commit / review / discard |  |  |
| tests |  | keep / commit / review / discard |  |  |
| spec-plan |  | keep / commit / review / discard |  |  |
| research-summary |  | keep / commit / review / discard |  |  |
| research-cache |  | keep / commit / review / discard |  |  |
| generated-runtime |  | keep / commit / review / discard |  |  |
| dependency |  | keep / commit / review / discard |  |  |
| accidental-tooling |  | keep / commit / review / discard |  |  |
| unknown |  | keep / commit / review / discard |  |  |

## Root Cause Review

- What made the branch hard to review?
- Which stop gate should have fired earlier?
- Which lane mixed with another lane?
- Which files need slicing before commit?
- Which generated outputs should stay ignored or be cleaned?
- Did a generated graph, dashboard, or report bundle get mistaken for contract, repair, or claim readiness?
- Did any scan, dashboard, export, or verification command write artifacts without a declared output lane?

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
