#!/bin/bash

# get and update version at message
NEW_VERSION=`cat ./version.txt`
sed -i '' 's/VERSIONVALUE/'$NEW_VERSION'/g' ./scripts/message_teams.json

releaseline='https://github.com/natura-cosmeticos/natds-ios/compare/'
major=`echo $NEW_VERSION | cut -d. -f1`
minor=`echo $NEW_VERSION | cut -d. -f2`
patch=`echo $NEW_VERSION | cut -d. -f3`
rgxversion="$major\.$minor\.$patch" # regex for new version

# clear files
if [ -f ./scripts/message_release.txt ]; then
    : > ./scripts/message_release.txt
fi

if [ -f ./scripts/message_text.txt ]; then
    : > ./scripts/message_text.txt
fi

# save last version output to file
awk 's{print $0 > "./scripts/message_release.txt"}; $0~v {print $0 > "./scripts/message_release.txt"; s=1; next}; (!($0~v) && $0~l) {s=0};' RS= v=$rgxversion l=$releaseline CHANGELOG.md
# erase last line of file
sed -i '' -e '$ d' ./scripts/message_release.txt

# write message release to message text removing breaklines and adding \n 
awk '{printf "%s\\\n ",$0 > "./scripts/message_text.txt"} END {print ""}' ./scripts/message_release.txt

CHANGELOG_UPDATES=`cat ./scripts/message_text.txt`
sed -i '' "s|CHANGELOGMESSAGE|$CHANGELOG_UPDATES|g" ./scripts/message_teams.json

# send message
message=`cat ./scripts/message_teams.json`
curl -H 'Content-Type: application/json' -d "$message" "$TEAMS_RELEASE_WEBHOOK"

# reset version and changelog updates at message
# sed -i '' "s|$MESSAGE_VERSION|VERSIONVALUE|g" ./scripts/message_teams.json
# sed -i '' "s|$CHANGELOG_UPDATES|CHANGELOGMESSAGE|g" ./scripts/message_teams.json

# sed -i '' 's/'$MESSAGE_VERSION'/VERSIONVALUE/g' ./scripts/message_teams.json
# sed -i '' 's/'$CHANGELOG_UPDATES'/CHANGELOGMESSAGE/g' ./scripts/message_teams.json