#!/bin/bash

if \
    { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -i -E '^feat|fix|perf|refactor|revert$' ; } || \
    { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -E '\!$' ; } || \
    { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%b' | grep -q -E '^BREAKING CHANGE:' ; }
then
    npx standard-version
    VERSION_NUMBER=$(cat ./version.txt) pod trunk push NatDS.podspec
    xcrun agvtool new-marketing-version $(cat ./version.txt)
    git push --follow-tags origin HEAD
else
    echo "No applicable changes since the previous tag, skipping..."
fi
