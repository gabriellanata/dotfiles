#!/usr/bin/env bash

changed=0

# Disable categories that are noisy or rarely useful
old_items=$(defaults read com.apple.Spotlight orderedItems 2>/dev/null || true)
defaults write com.apple.Spotlight orderedItems -array \
    '{ "enabled" = 1; "name" = "APPLICATIONS"; }' \
    '{ "enabled" = 1; "name" = "MENU_EXPRESSION"; }' \
    '{ "enabled" = 1; "name" = "CONTACT"; }' \
    '{ "enabled" = 1; "name" = "MENU_CONVERSION"; }' \
    '{ "enabled" = 1; "name" = "MENU_DEFINITION"; }' \
    '{ "enabled" = 1; "name" = "DOCUMENTS"; }' \
    '{ "enabled" = 1; "name" = "EVENT_TODO"; }' \
    '{ "enabled" = 1; "name" = "DIRECTORIES"; }' \
    '{ "enabled" = 0; "name" = "FONTS"; }' \
    '{ "enabled" = 0; "name" = "IMAGES"; }' \
    '{ "enabled" = 0; "name" = "MESSAGES"; }' \
    '{ "enabled" = 0; "name" = "MOVIES"; }' \
    '{ "enabled" = 0; "name" = "MUSIC"; }' \
    '{ "enabled" = 0; "name" = "MENU_OTHER"; }' \
    '{ "enabled" = 1; "name" = "PDF"; }' \
    '{ "enabled" = 0; "name" = "PRESENTATIONS"; }' \
    '{ "enabled" = 0; "name" = "SPREADSHEETS"; }' \
    '{ "enabled" = 1; "name" = "SYSTEM_PREFS"; }' \
    '{ "enabled" = 0; "name" = "TIPS"; }' \
    '{ "enabled" = 0; "name" = "BOOKMARKS"; }' \
    '{ "enabled" = 0; "name" = "MENU_SPOTLIGHT_SUGGESTIONS"; }' \
    '{ "enabled" = 0; "name" = "MENU_WEBSEARCH"; }'

new_items=$(defaults read com.apple.Spotlight orderedItems 2>/dev/null || true)
if [[ "$old_items" != "$new_items" ]]; then
    changed=1
fi

# Drop .metadata_never_index markers in heavyweight dev directories so mds skips them.
log "Dropping .metadata_never_index markers in $SRC_DIR..."
while IFS= read -r -d '' dir; do
    if [ ! -f "$dir/.metadata_never_index" ]; then
        touch "$dir/.metadata_never_index"
        changed=1
    fi
done < <(find "$SRC_DIR" -maxdepth 4 -type d \( \
    -name node_modules \
    -o -name .build \
    -o -name DerivedData \
    -o -name Pods \
    -o -name .gradle \
    -o -name ".bazel-cache" \
    -o -name "bazel-*" \
    -o -name __pycache__ \
    -o -name .venv \
    -o -name venv \
    -o -name .next \
    -o -name dist \
    -o -name .mypy_cache \
    -o -name .pytest_cache \
    -o -name buck-out \
    -o -name coverage \
\) -prune -print0)

# Rebuild the index only if categories or markers changed
if (( changed )); then
    log "Spotlight configuration changed, rebuilding index..."
    if_sudo_active mdutil -E / > /dev/null 2>&1
fi
