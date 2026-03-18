# #!/usr/bin/env bash

# # Enable text replacement
# defaults write NSGlobalDomain NSAutomaticTextReplacementEnabled -bool true

# # Enable text replacement for abbreviations
# defaults write NSGlobalDomain NSAutomaticTextReplacementEnabled -bool true

# # Enable text replacement for abbreviations
# defaults write NSGlobalDomain NSAutomaticTextReplacementEnabled -bool true

# # Enable text replacement for abbreviations
# defaults write NSGlobalDomain NSAutomaticTextReplacementEnabled -bool true

# # Enable text replacement for abbreviations
# defaults write NSGlobalDomain NSAutomaticTextReplacementEnabled -bool true

# # Replace AAA with BBB
# defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{
#     "enabled" = 1;
#     "from" = "AAA";
#     "to" = "BBB";
# }'


# date=$(date +%s)
# while read -r replace with; do
#   plist+="{on=1;replace=\"$replace\";with=\"$with\";},"
#   sql+="INSERT INTO 'ZUSERDICTIONARYENTRY' VALUES($((++i)),1,1,0,0,0,0,$date,NULL,NULL,NULL,NULL,NULL,\"$with\",\"$replace\",NULL);"
# done < <(sed 's/\\/\\\\/g;s/"/\\"/g' ~/replacements.txt)
# sqlite3 ~/Library/Dictionaries/CoreDataUbiquitySupport/$USER~*/UserDictionary/local/store/UserDictionary.db "delete from ZUSERDICTIONARYENTRY;$sql"
# defaults write -g NSUserDictionaryReplacementItems "(${plist%?})"