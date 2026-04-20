# Agent Skills Layout

`configs/agents/skills/` is the shared source of truth for agent skills in this
dotfiles repo. `preferences/agents.sh` symlinks that directory into each
tool-specific skills location, including `~/.codex/skills`.

`configs/agents/AGENTS.md` is the shared baseline instruction file for tools
that support a top-level `AGENTS.md`. Repo-specific `AGENTS.md` files should be
treated as more specific than this shared global file.

## Codex Policy

For Codex, this repo intentionally backs the whole `~/.codex/skills` directory.
That means:

- Repo-managed skills under `configs/agents/skills/<name>` are shared across
  machines.
- Running `npx skills add ...` from a machine that uses this setup writes into
  the same repo-backed skills directory, so new skills can be reviewed and
  committed like any other dotfiles change.
- Codex's runtime-managed system skills live under
  `configs/agents/skills/.system/` because the Codex skills root is symlinked
  here. Those files are tool-managed state, not curated dotfiles content, so
  they are ignored in git.

## Practical Workflow

- Use `npx skills add ...` when you want to install a reusable skill and then
  decide whether to commit it.
- Do not rely on `.system/` as a backup mechanism. Codex can recreate or update
  that subtree as needed.
- If `npx skills` installs something you only wanted locally, move or delete it
  before committing.
- Put stable, cross-project agent preferences in `configs/agents/AGENTS.md`.
- Put repo-specific behavior in each repo's own root `AGENTS.md`.
