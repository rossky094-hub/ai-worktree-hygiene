# Install For Claude Code

Use this when you want Claude Code to treat repository hygiene as a stop gate before
continuing, committing, or handing off AI-assisted work.

## Project Instruction Option

Copy `skills/ai-worktree-hygiene/SKILL.md` into your project or reference this repo
from your project instructions.

Add:

```text
Before continuing, committing, merging, pushing, or handing off a dirty branch,
run an AI Worktree Hygiene checkpoint.

Check git status, untracked files, ignored generated outputs, research caches,
package-manager drift, and mixed lanes. Classify every path into exactly one lane
and report keep, discard, commit, review, or split.
```

## Prompt

```text
Use the AI Worktree Hygiene skill to review this dirty branch before any commit or handoff.
```

## Expected Output

Claude Code should produce:

- repository state,
- ignored generated output status,
- lane summary,
- root-cause notes,
- recommended commit/discard/review path,
- next safe action.
