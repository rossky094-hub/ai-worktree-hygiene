# Contributing

Thanks for helping make AI-assisted coding workflows easier to review.

## Good Contributions

- Add a realistic dirty worktree scenario.
- Improve lane classification language.
- Improve checkpoint templates.
- Add a verification rule to `scripts/verify.sh`.
- Document how another coding-agent environment can trigger the skill.

## Boundaries

- Do not copy source code from other projects.
- Do not commit raw research clones, generated build output, or local cache folders.
- Keep examples generic and remove local paths, secrets, internal project names, and private repo names.
- Keep the skill small enough for agents to read.

## Development

Run:

```bash
npm test
```

or:

```bash
bash scripts/verify.sh
```

Before opening a pull request, include:

- what dirty-worktree scenario you are improving,
- which trigger or lane changed,
- verification output,
- any related project or license boundary.
