#!/usr/bin/env bash

# Single source under configs/agents/ — symlinked into each tool’s expected path.
AGENTS_SRC="$DOTFILES_DIR/configs/agents"

# Shared top-level AGENTS.md for tools that support a global instruction file.
for dest in \
    "$HOME/.cursor/AGENTS.md" \
    "$HOME/.claude/AGENTS.md" \
    "$HOME/.copilot/AGENTS.md" \
    "$HOME/.agents/AGENTS.md" \
    "$HOME/.codex/AGENTS.md"
do
    link_file "$AGENTS_SRC/AGENTS.md" "$dest"
done

# Slash commands: *.md (Cursor, Claude); *.prompt.md (VS Code / Copilot prompts).
for dest in \
    "$HOME/.cursor/commands" \
    "$HOME/.claude/commands" \
    "$HOME/Library/Application Support/Code/User/prompts" \
    "$HOME/Library/Application Support/Cursor/User/prompts" \
    "$HOME/Library/Application Support/CursorPersonal/User/prompts"
do
    link_file "$AGENTS_SRC/commands" "$dest"
done

# Agent skills: each skill is a folder with SKILL.md (see agentskills.io / VS Code & Cursor docs).
# Codex intentionally shares the same repo-backed skills root so `npx skills add`
# installs land in dotfiles and can be committed. Codex's own `.system/`
# subtree is machine-managed runtime state and should stay gitignored.
for dest in \
    "$HOME/.cursor/skills" \
    "$HOME/.claude/skills" \
    "$HOME/.copilot/skills" \
    "$HOME/.agents/skills" \
    "$HOME/.codex/skills"
do
    link_file "$AGENTS_SRC/skills" "$dest"
done
