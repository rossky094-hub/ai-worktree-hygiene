# Launch Post Drafts

Use these drafts to share the project in places where the failure mode is relevant.
Do not spam unrelated threads.

## Hacker News

Title:

```text
Show HN: A tiny skill to stop AI coding branches from becoming unreviewable
```

Body:

```text
I made a small checkpoint skill for Codex / Claude Code / Cursor workflows.

The failure mode it targets is common in AI-assisted coding: tests pass, but the
branch contains research clones, generated files, lockfile drift, and mixed commits.

The skill asks the agent to classify the dirty worktree into lanes:
product-code, tests, spec-plan, research-summary, research-cache, generated-runtime,
dependency, accidental-tooling, or unknown.

Then it recommends what to keep, discard, commit, review, or split before continuing.

Repo: https://github.com/rossky094-hub/ai-worktree-hygiene
```

## Reddit

Title:

```text
I made a small hygiene skill for AI coding branches that pass tests but are still a mess
```

Body:

```text
I keep seeing the same failure mode with agentic coding: the agent says "tests pass",
but the branch has generated artifacts, research clones, dependency drift, and mixed
product/test/docs commits.

I packaged a tiny checkpoint skill that asks the agent to classify dirty state into
lanes and explain the next safe action before commit or handoff.

It is intentionally not a full workspace manager or MCP server. It is just a copyable
skill + templates + before/after examples.

Repo: https://github.com/rossky094-hub/ai-worktree-hygiene
```

Good subreddits when relevant:

- `r/ClaudeAI`
- `r/Cursor`
- `r/GitHub`
- `r/programming`

## X / Twitter

```text
Your AI agent says "tests pass".

But the branch has:
- research clones
- generated files
- lockfile drift
- mixed commits

I made a tiny checkpoint skill for Codex / Claude Code / Cursor to stop dirty
AI coding branches from becoming unreviewable:

https://github.com/rossky094-hub/ai-worktree-hygiene
```

Attach `assets/social-preview.png`.

## LinkedIn

```text
One under-discussed AI coding failure mode:

The tests pass, but the repository is no longer reviewable.

The branch contains generated artifacts, research clones, dependency drift, and mixed
commits. The agent is technically "done", but the human handoff is poor.

I packaged a small open-source checkpoint skill for this: AI Worktree Hygiene.
It asks Codex / Claude Code / Cursor to classify dirty state into lanes, explain what
to keep/discard/review, and name the next safe action before continuing or handing off.

Repo: https://github.com/rossky094-hub/ai-worktree-hygiene
```
