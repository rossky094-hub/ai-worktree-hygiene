# Launch Playbook

## Positioning

AI Worktree Hygiene should be positioned as a small checkpoint skill, not a full
agent platform.

Short pitch:

```text
A checkpoint skill for AI coding agents to keep dirty worktrees, generated artifacts,
research caches, dependency drift, and commit lanes reviewable.
```

## Search Intent

The project targets people searching for:

- AI coding worktree hygiene
- dirty worktree AI agent
- git hygiene for Claude Code or Codex
- vibe coding repository cleanup
- agent workflow commit hygiene
- generated artifacts in AI coding branches
- research cache cleanup

## GitHub Metadata

Set the repository description to:

```text
A checkpoint skill for AI coding agents to keep dirty worktrees, generated artifacts, research caches, dependency drift, and commit lanes reviewable.
```

Set the homepage to the README or leave it empty until there is a demo page.

Set topics from `repository-topics.txt`.

## Star Growth Mechanics

Do:

- Keep the README first screen problem-focused.
- Include a copyable quick start in the first page.
- Keep examples realistic and short.
- Open starter issues labeled `good first issue`.
- Comment on adjacent discussions only when genuinely useful.
- Share a before/after branch hygiene example, not a vague announcement.
- Upload `assets/social-preview.png` in GitHub Settings > Social preview.
- Keep commits small and readable so contributors trust the project.

Do not:

- Claim to replace MCP servers, code review tools, or workspace managers.
- Copy code from related projects.
- Add broad platform features before the checkpoint skill is excellent.
- Publish internal project history as examples.

## First Public Issues

Open these after the first push:

1. Add a sanitized real-world dirty worktree scenario.
2. Add install notes for Claude Code skill folders.
3. Add install notes for Cursor project rules.
4. Add a `good first issue` to improve lane examples.

## Maintenance Cadence

- Keep releases small.
- Add one new dirty worktree pattern per release.
- Add a verification rule whenever a new failure mode is discovered.
- Treat every user report as an input-output contract: actual messy state, expected hygiene guidance, gap, repair path.
