#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

require_file() {
  [[ -f "$1" ]] || fail "missing required file: $1"
}

require_grep() {
  local pattern="$1"
  local file="$2"
  grep -Eq "$pattern" "$file" || fail "expected pattern '$pattern' in $file"
}

reject_grep() {
  local pattern="$1"
  local file="$2"
  if grep -Eq "$pattern" "$file"; then
    fail "forbidden pattern '$pattern' found in $file"
  fi
}

require_file README.md
require_file LICENSE
require_file CONTRIBUTING.md
require_file SECURITY.md
require_file CODE_OF_CONDUCT.md
require_file skills/ai-worktree-hygiene/SKILL.md
require_file templates/hygiene-checkpoint.md
require_file templates/lane-review.md
require_file examples/dirty-worktree-before.md
require_file examples/hygiene-checkpoint-after.md
require_file docs/comparison.md
require_file docs/github-discoverability.md
require_file docs/launch-playbook.md
require_file docs/launch-posts.md
require_file docs/social-preview.md
require_file docs/install-codex.md
require_file docs/install-claude-code.md
require_file docs/install-cursor.md
require_file docs/releases/v0.1.0.md
require_file examples/30-second-demo.md
require_file assets/social-preview.png
require_file scripts/make-social-preview.py
require_file repository-topics.txt

require_grep '^name: ai-worktree-hygiene$' skills/ai-worktree-hygiene/SKILL.md
require_grep '^description: Use when ' skills/ai-worktree-hygiene/SKILL.md
require_grep '## Trigger Decision' skills/ai-worktree-hygiene/SKILL.md
require_grep '### Hard Triggers' skills/ai-worktree-hygiene/SKILL.md
require_grep '### Soft Triggers' skills/ai-worktree-hygiene/SKILL.md
require_grep 'git status --short is non-empty' skills/ai-worktree-hygiene/SKILL.md
require_grep 'ignored generated outputs such as dist/' skills/ai-worktree-hygiene/SKILL.md
require_grep 'Do not continue with product work until the hygiene checkpoint is written' skills/ai-worktree-hygiene/SKILL.md

require_grep 'AI coding' README.md
require_grep 'git hygiene' README.md
require_grep 'worktree hygiene' README.md
require_grep 'dirty worktree' README.md
require_grep 'Codex' README.md
require_grep 'Claude Code' README.md
require_grep 'Cursor' README.md
require_grep 'vibe coding' README.md
require_grep 'Quick Start' README.md
require_grep '30-Second Before / After' README.md
require_grep 'One-Click Prompt' README.md
require_grep 'Comparison' README.md
require_grep 'MIT' README.md
require_grep 'Show HN' docs/launch-posts.md
require_grep 'assets/social-preview.png' docs/social-preview.md
require_grep 'First Public Checkpoint Skill' docs/releases/v0.1.0.md
require_grep '^worktree-hygiene$' repository-topics.txt
require_grep '^dirty-worktree$' repository-topics.txt
require_grep '^commit-hygiene$' repository-topics.txt

for file in README.md skills/ai-worktree-hygiene/SKILL.md templates/*.md examples/*.md docs/*.md; do
  reject_grep "$(printf '%s|%s|%s|%s|%s' "Eche""lon" "Continuous ""Project OS" "/Users/""r" "New ""project" "V""3\\.[0-9]")" "$file"
done

python3 - <<'PY'
from pathlib import Path
from PIL import Image

path = Path("assets/social-preview.png")
with Image.open(path) as image:
    if image.size != (1280, 640):
        raise SystemExit(f"FAIL: social preview must be 1280x640, got {image.size}")
    if image.format != "PNG":
        raise SystemExit(f"FAIL: social preview must be PNG, got {image.format}")
PY

echo "AI Worktree Hygiene package verification passed."
