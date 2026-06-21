# Social Preview

This repository includes a 1280x640 PNG:

```text
assets/social-preview.png
```

The image says:

```text
Tests pass.
Your repo is still a mess.
AI Worktree Hygiene fixes the handoff.
```

## Upload On GitHub

GitHub repository social previews are managed in the web UI.

Steps:

1. Open the repository on GitHub.
2. Go to `Settings`.
3. Find `Social preview`.
4. Click `Edit`.
5. Upload `assets/social-preview.png`.

## Regenerate The Image

```bash
python3 scripts/make-social-preview.py
bash scripts/verify.sh
```

## Automation Boundary

GitHub exposes `openGraphImageUrl` for reading the active image, but does not provide
a public REST or GraphQL write API for repository social preview images. Keep the
generated PNG in the repo so the manual step is small and repeatable.
