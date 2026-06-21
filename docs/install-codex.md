# Install For Codex

Use this when you want Codex to automatically consider the hygiene checkpoint during
dirty branch review, handoff, and commit preparation.

## Install As A Local Skill

```bash
mkdir -p ~/.codex/skills/ai-worktree-hygiene
cp skills/ai-worktree-hygiene/SKILL.md ~/.codex/skills/ai-worktree-hygiene/SKILL.md
```

Restart Codex if your environment only loads skills at startup.

## Project-Local Alternative

If you do not want to install a global skill, copy the skill into the project:

```bash
cp skills/ai-worktree-hygiene/SKILL.md ./.ai-worktree-hygiene.md
```

Then add this to your project instructions:

```text
Before continuing, committing, merging, pushing, or handing off a dirty branch,
read .ai-worktree-hygiene.md and run the checkpoint.
```

## Prompt

```text
Use ai-worktree-hygiene before continuing on this branch.
Classify dirty state into lanes, identify generated artifacts and research caches,
and tell me whether the branch is safe to commit or hand off.
```
