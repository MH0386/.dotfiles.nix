---
name: AGENTS.md Maintainer
description: >-
  Review merged pull requests and source changes since the last run, then keep
  AGENTS.md accurate by opening a pull request when updates are needed
on:
  schedule: weekly
  workflow_dispatch:
  skip-if-match: 'is:pr is:open in:title "[agents-maintainer]"'

network:
  allowed:
    - defaults
    - api.kilo.ai

safe-outputs:
  create-pull-request:
    title-prefix: "[agents-maintainer] "
    labels: [agents-md]
    protected-files: fallback-to-issue

tools:
  edit:
  bash: true
  cache-memory:
    retention-days: 30
  web-fetch:

timeout-minutes: 60
engine:
  id: copilot
  env:
    COPILOT_PROVIDER_BASE_URL: https://api.kilo.ai/api/gateway
    COPILOT_MODEL: kilo-auto/free
    COPILOT_PROVIDER_API_KEY: ${{ secrets.KILO_API_KEY }}
---

# AGENTS.md Maintainer

Keep the repository root `AGENTS.md` accurate and current.

## Scope

- You may edit only `AGENTS.md`.
- Do not modify generated files, workflow lock files, or unrelated repository files.
- Do not create a pull request unless `AGENTS.md` materially changes.
- Avoid stylistic churn. Preserve the file's structure and tone unless repository changes require a structural update.

## Persistent State

Use repo-memory file `/tmp/gh-aw/repo-memory-default/state.json` to track the last completed review.

Expected shape:

```json
{
  "last_successful_scan_at": "2026-05-11T00:00:00Z",
  "last_reviewed_head_sha": "abc123",
  "last_review_window_started_at": "2026-05-04T00:00:00Z"
}
```

## Determine the Review Window

1. If the state file exists and contains `last_successful_scan_at`, use that timestamp as `SINCE`.
2. Otherwise, use the most recent commit timestamp that changed `AGENTS.md`.
3. If that cannot be determined, fall back to `30 days ago`.
4. Use the same `SINCE` value for both GitHub queries and local git inspection.

## Collect Evidence

Review both GitHub history and the checked-out repository.

### GitHub history

- Search for pull requests merged in `${{ github.repository }}` on or after `SINCE`.
- For each relevant merged PR, inspect the summary and changed files.
- Focus on merged changes that affect repository structure, developer workflow, CI behavior, formatting rules, or coding-agent guidance.

### Local repository changes

- Review local git history since `SINCE` to catch direct commits not associated with merged pull requests.
- Inspect the changed files directly in the workspace.
- Prioritize files that commonly define agent instructions and repository behavior:
  - `devenv.nix`
  - `devenv.yaml`
  - `flake.nix`
  - `flake.lock`
  - `modules/**/*.nix`
  - `hardware/**/*.nix`
  - `.github/workflows/**`
  - `.github/**`
  - `README*`
  - `docs/**`
  - `justfile`
  - `Makefile`
  - repository scripts
- Ignore noise unless it affects guidance in `AGENTS.md`: generated lock files, vendored content, or purely mechanical changes with no documentation impact.

## Update Policy

Update `AGENTS.md` only when the evidence shows it is stale, incomplete, or misleading.

Focus on:

- repository overview and structure
- build, test, deploy, and formatting commands
- code conventions and protected files
- CI behavior and automation expectations
- common gotchas introduced by recent changes

When editing:

- Preserve factual accuracy over completeness.
- Keep instructions concrete and repository-specific.
- Prefer updating existing sections over rewriting the whole file.
- Replace outdated guidance instead of appending contradictory notes.
- Do not add speculative, temporary, or one-off details that are not part of the normal workflow.

## Validation

Before opening a pull request:

- Re-read `AGENTS.md` end to end.
- Confirm every new statement is backed by current files or merged pull request evidence.
- Ensure only `AGENTS.md` is modified.
- If no material edit is needed, do not create a pull request.

## Pull Request

If you changed `AGENTS.md`, open a pull request with:

- a concise conventional-commit title after the required prefix, for example `docs: refresh AGENTS guidance`
- a body that summarizes:
  - what changed in the repository since `SINCE`
  - which sections of `AGENTS.md` were updated
  - any assumptions or follow-up checks

## Finalize State

At the very end of a successful review, write `/tmp/gh-aw/repo-memory-default/state.json` with:

- `last_successful_scan_at`: the current UTC timestamp
- `last_reviewed_head_sha`: the result of `git rev-parse HEAD`
- `last_review_window_started_at`: `SINCE`

Always update the state file on successful completion, even when `AGENTS.md` did not need changes.
