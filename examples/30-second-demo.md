# 30-Second Before / After Demo

## Before

Tests pass, but the branch is not reviewable:

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

## Run

```text
Use ai-worktree-hygiene to check whether this branch is safe to continue, commit, or hand off.
```

## After

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
```

## Result

```text
Not safe to push yet.
Safe next action: commit docs/research first, discard raw research cache,
resolve package-manager drift, then review product-code + tests as one lane.
```
