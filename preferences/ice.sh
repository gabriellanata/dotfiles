#!/usr/bin/env bash

set -euo pipefail

PLIST_FILE="$HOME/Library/Preferences/com.jordanbaird.Ice.plist"

plist_write "IceBarLocation" "integer" "0" "$PLIST_FILE"
plist_write "NSStatusItem Preferred Position HItem" "integer" "623" "$PLIST_FILE"
plist_write "NSStatusItem Preferred Position SItem" "integer" "0" "$PLIST_FILE"
plist_write "NSStatusItem Visible AHItem" "bool" "false" "$PLIST_FILE"
plist_write "ShowOnHover" "bool" "false" "$PLIST_FILE"
plist_write "ShowOnScroll" "bool" "false" "$PLIST_FILE"
plist_write "ShowSectionDividers" "bool" "false" "$PLIST_FILE"
plist_write "UseIceBar" "bool" "true" "$PLIST_FILE"
plist_write "SUAutomaticallyUpdate" "bool" "true" "$PLIST_FILE"
plist_write "SUEnableAutomaticChecks" "bool" "true" "$PLIST_FILE"