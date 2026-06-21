# Install For Cursor

Use this when you want Cursor to apply a compact hygiene rule during AI-assisted
branch review.

## Project Rule

Paste this into a Cursor project rule:

```text
Before continuing, committing, merging, pushing, or handing off a dirty branch,
run an AI Worktree Hygiene checkpoint.

Check:
- git status --short
- git diff --stat
- untracked files
- ignored generated outputs such as dist/, coverage/, build/
- research caches such as .research/
- package-manager drift such as pnpm-lock.yaml in an npm project
- mixed product-code, tests, docs, dependencies, generated-runtime, and research

Classify every path into exactly one lane:
product-code, tests, spec-plan, research-summary, research-cache,
generated-runtime, dependency, accidental-tooling, or unknown.

For each lane, say keep, discard, commit, review, or split.
Do not claim the branch is ready unless the dirty state can be explained by lane,
phase, evidence, and next action.
```

## Prompt

```text
Run the worktree hygiene checkpoint and tell me which lanes are safe to commit.
```
