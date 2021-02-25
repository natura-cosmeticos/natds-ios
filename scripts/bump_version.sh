#!/bin/bash

if \
    { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -i -E '^feat|fix|perf|refactor|revert$' ; } || \
    { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -E '\!$' ; } || \
    { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%b' | grep -q -E '^BREAKING CHANGE:' ; }
then
    npx standard-version
    VERSION=$(cat ./version.txt)
    VERSION_NUMBER=VERSION pod trunk push NatDS.podspec
    xcrun agvtool new-marketing-version $VERSION
    cd SampleApp
    xcrun agvtool new-marketing-version $VERSION
    cd ..
    git add NatDSSnapShotTests/Info.plist
    git add SampleApp/Sources/Supporting\ Files/Info.plist
    git add Supporting\ Files/Info.plist
    git add Tests/Supporting\ Files/Info.plist
    git push --follow-tags origin HEAD
else
    echo "No applicable changes since the previous tag, skipping..."
fi
