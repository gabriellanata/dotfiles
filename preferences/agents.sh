#!/usr/bin/env bash

# Single source under configs/agents/ — symlinked into each tool’s expected path.
AGENTS_SRC="$DOTFILES_DIR/configs/agents"

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
for dest in \
    "$HOME/.cursor/skills" \
    "$HOME/.claude/skills" \
    "$HOME/.copilot/skills" \
    "$HOME/.agents/skills" \
    "$HOME/.codex/skills"
do
    link_file "$AGENTS_SRC/skills" "$dest"
done
