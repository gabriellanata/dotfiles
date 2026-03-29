---
name: git-operations
description: >-
  PR and git workflows for the current repo only: (1) pr-quick—submit a PR from staged changes
  via pr CLI with verb-first title and filled template; (2) pr-push—commit only this session’s
  file allowlist then push; (3) pr-summary—print PR title and body markdown for copy-paste
  without pr submit. Pick the workflow that matches the request; do not run pr submit when the
  user only asked for text or a push-only flow.
---

# git-operations

All workflows run in the **current git repo** (do not assume a fixed project).

---

## Workflow: pr-quick

Fast PR submit using staged changes.

1. Detect repo root with `git rev-parse --show-toplevel`.
2. Ensure there are staged changes; if none, stop and ask the user to stage files first.
3. Generate a PR title from staged diff + recent commits.
   - Title must be concise.
   - Title **must start with a verb** (for example: `Add`, `Fix`, `Update`, `Refactor`, `Remove`, `Migrate`, `Implement`, `Improve`, `Rename`, `Revert`).
4. Build PR body from this repo's template, if present. Check in this order:
   - `.github/PULL_REQUEST_TEMPLATE.md`
   - `.github/pull_request_template.md`
   - `.github/PULL_REQUEST_TEMPLATE/*.md` (pick best match)
   - `.gitlab/merge_request_templates/*.md` (fallback for non-GitHub repos)
   If no template exists, create a structured body with equivalent sections (`Summary`, `Testing`, `Risk/Impact`, `Checklist`) and fully fill it.
5. Keep the PR body concise. This is a quick summary, not a full technical spec.
   - Include only the most important details needed for review.
   - Prefer short bullets/sentences over long explanations.
6. Fill template sections with real content derived from code changes, but remove sections that do not apply.
   - Example: if there were no UI changes, remove UI-specific testing/questions.
   - Do not leave placeholders like `TODO`, `N/A`, or empty sections.
7. Run:
   `pr submit --title "<generated title>" --body "<fully filled template body>" --base "main" --merge`
   - Add `--reviewer "<reviewer>"` only if a reviewer is explicitly provided.
8. Return the exact command used and a short summary of what was filled.

---

## Workflow: pr-push

Commit **only** the changes **you** made in this session, then push. Do not include any other local modifications in the repo.

1. Resolve repo root with `git rev-parse --show-toplevel` for each git repo you touched (if multiple, repeat per repo).
2. Build the **allowlist** of paths: every file you created or edited via your tools **in this conversation** (and only those). If you did not change any files, stop and say so.
3. Inspect `git status` (and optionally `git diff`) in that repo. **Do not** stage files that are modified but **not** on your allowlist—even if they look related or the user might want them committed later.
4. Stage changes:
   - **Default:** explicit paths only, for example: `git add -- path/to/a path/to/b`. Do not use `git add -A`, `git add .`, or `git commit -a`.
   - **Exception:** if your allowlist has **more than 100** paths, you may stage from the repo root with `git add -A` (or equivalent) for that repo instead of listing every file—treat the whole change set as one commit, then still review the staged diff before committing. If `git status` shows other unrelated modifications you did not make, do not use `-A`; keep using explicit paths (or ask).
5. Review `git diff --cached`. If you used explicit staging and anything outside your allowlist appears, run `git reset` on those paths and fix staging before continuing.
6. Commit with a short, clear message; prefer a **verb-first** subject line (for example: `Fix`, `Add`, `Update`, `Refactor`).
7. Push the current branch: `git push` (use `git push -u origin HEAD` only when the branch has no upstream yet).
8. Report: list of files committed, commit hash or message, and push result.

If the allowlist is empty or every allowlisted file is already committed and clean, do not create an empty commit—explain and stop.

---

## Workflow: pr-summary

Generate PR **title** and **body** like **Workflow: pr-quick**, but **only print raw markdown** for the user to copy manually—do not run `pr submit` or any shell that opens a PR.

1. Detect repo root with `git rev-parse --show-toplevel`.
2. Decide what diff to summarize: prefer `git diff --staged` when there are staged changes; if the staged diff is empty, use the working tree (`git diff` plus new/untracked files as needed) and briefly note at the top of your reply which scope you used. If there are no code changes at all, stop and say so.
3. Generate a PR title from that diff + recent commits (same rules as **Workflow: pr-quick** step 3).
4. Build PR body from this repo's template (same template search order and filling rules as **Workflow: pr-quick** steps 4–6).
5. **Output only** (minimal prose outside this):
   - First, a single line: `Title: <verb-first title>`
   - Then a horizontal rule (`---`).
   - Then the **full PR body** as raw markdown (no outer code fence around the body, so it stays easy to copy into GitHub/GitLab). If your environment makes that hard, use one `markdown` fenced block for the **body only** and keep the title outside the fence.

Do not run `pr`, `gh pr`, or `git push` as part of this workflow unless the user explicitly asks separately.
