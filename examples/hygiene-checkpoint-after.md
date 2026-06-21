# Hygiene Checkpoint Example

## Repository State

- Branch: `feature/dashboard-contract-panel`
- Isolated worktree: yes
- Main branch dirty: no
- Current branch dirty: yes
- Untracked files: research summaries and raw research cache
- Ignored generated outputs: `dist/`, `coverage/`, `node_modules/`
- Package-manager drift: `pnpm-lock.yaml` present in npm project

## Lane Summary

| Lane | Paths | Decision | Risk | Evidence |
| --- | --- | --- | --- | --- |
| product-code | `src/dashboard/App.tsx`, `src/core/store.ts` | review | medium | tests pass, shared file needs slicing |
| tests | `tests/dashboard/App.test.tsx` | commit with product-code | low | focused dashboard test passes |
| spec-plan | `docs/specs/v2-dashboard.md` | commit before code | low | documentation-only |
| research-summary | `docs/research/git-hygiene.md` | commit separately | low | distilled summary only |
| research-cache | `.research/flowcheck/`, `.research/worktree-tools/` | discard or keep ignored | high | raw external repos |
| generated-runtime | `dist/`, `coverage/` | clean or record as local residue | low | ignored output |
| dependency | `package.json`, `package-lock.json`, `pnpm-lock.yaml` | review | high | package-manager drift |

## Root Cause Review

The branch mixed research, product code, generated output, and dependency changes.
The hygiene skill should have triggered after external research was cloned and again
after verification created ignored generated outputs.

## Recommended Action

1. Move `.research/` out of the repo or keep it ignored.
2. Delete `pnpm-lock.yaml` unless the user approves a package-manager migration.
3. Commit `docs/research/git-hygiene.md` as a research-summary lane.
4. Split dashboard and core changes if `src/core/store.ts` contains unrelated runtime changes.
5. Commit dashboard code and tests together after focused verification.
6. Record ignored `dist/` and `coverage/` as local residue or clean them before handoff.
