#!/usr/bin/env bash

# Add `code` and `cursor` to path if available
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Applications/Cursor.app/Contents/Resources/app/bin"

# Shared settings and keybindings for VSCode and Cursor
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"

for user_dir in "$VSCODE_USER_DIR" "$CURSOR_USER_DIR"; do
    link_file "$DOTFILES_DIR/configs/vscode/settings.json" "$user_dir/settings.json"
    link_file "$DOTFILES_DIR/configs/vscode/keybindings.json" "$user_dir/keybindings.json"
done

# Install extensions for both editors from a single list.
# Lines starting with "# cursor:" are Cursor-only.
# Lines starting with "# vscode:" are VSCode-only.
# All other non-comment lines are shared.
install_extensions() {
    local cmd="$1"
    local tag="$2"
    local list="$DOTFILES_DIR/configs/vscode/extensions.txt"

    if ! command -v "$cmd" &>/dev/null; then
        echo "  ⚠ $cmd not found, skipping"
        return
    fi

    local installed
    installed=$("$cmd" --list-extensions 2>/dev/null)

    while IFS= read -r line; do
        local ext=""

        if [[ "$line" =~ ^#\ ${tag}:\ (.+) ]]; then
            ext="${BASH_REMATCH[1]}"
        elif [[ "$line" =~ ^[a-zA-Z] ]]; then
            ext="$line"
        fi

        [ -z "$ext" ] && continue

        if echo "$installed" | grep -qi "^${ext}$"; then
            echo "  ✓ $ext"
        else
            echo "  → installing $ext"
            "$cmd" --install-extension "$ext" --force 2>/dev/null
        fi
    done < "$list"
}

echo "[cursor extensions]"
install_extensions "cursor" "cursor"

echo "[vscode extensions]"
install_extensions "code" "vscode"
