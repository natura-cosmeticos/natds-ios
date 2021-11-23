#!/bin/bash

# get and update version at message
MESSAGE_VERSION=`cat ./version.txt`
sed -i '' 's/VERSIONVALUE/'$MESSAGE_VERSION'/g' ./scripts/message_teams.json

# send message
message=`cat ./scripts/message_teams.json`
curl -H 'Content-Type: application/json' -d "$message" "$TEAMS_RELEASE_WEBHOOK"

# reset version at message
sed -i '' 's/'$MESSAGE_VERSION'/VERSIONVALUE/g' ./scripts/message_teams.json