#!/usr/bin/env bash

set -euo pipefail

echo "Restarting processes.. "

for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
	"Mail" "Safari" "SystemUIServer" "Terminal" "iCal" "iTunes" "Activity Monitor"; do
	killall "$app" > /dev/null 2>&1 || true
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
