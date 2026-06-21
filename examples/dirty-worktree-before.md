# Dirty Worktree Example

This example shows a common AI-assisted coding failure mode.

## Situation

An agent implemented a dashboard feature, researched three external repositories,
ran a build, changed dependencies, and wrote a handoff in one branch.

Tests pass, but the branch is not reviewable.

## Raw State

```text
 M package.json
 M package-lock.json
 M src/dashboard/App.tsx
 M src/core/store.ts
 M tests/dashboard/App.test.tsx
 M docs/specs/v2-dashboard.md
?? .research/flowcheck/
?? .research/worktree-tools/
?? docs/research/git-hygiene.md
?? pnpm-lock.yaml
```

Ignored files:

```text
dist/
coverage/
node_modules/
```

## Why This Is Unsafe

- Product code and research are mixed.
- Generated output exists but is not recorded in the checkpoint.
- `pnpm-lock.yaml` suggests package-manager drift.
- `src/core/store.ts` may mix core and dashboard concerns.
- Passing tests do not prove the branch is ready to commit.
