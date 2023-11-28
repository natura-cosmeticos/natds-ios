#!/bin/bash

# checks commit history at PR
# if \
#     { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -i -E '^feat|fix|perf|refactor|revert$' ; } || \
#     { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%s' | cut -d: -f1 | sort -u | sed -e 's/([^)]*)//' | grep -q -E '\!$' ; } || \
#     { git log "$( git describe --tags --abbrev=0 )..HEAD" --format='%b' | grep -q -E '^breaking:' ; }
# then
    # creates new lib version and updates version at version file and project targets
    npx standard-version
    VERSION=$(cat ./version.txt)
    xcrun agvtool new-marketing-version $VERSION
    cd SampleApp
    xcrun agvtool new-marketing-version $VERSION
    cd ..
    git add NatDSSnapShotTests/Info.plist
    git add SampleApp/Sources/Supporting\ Files/Info.plist
    git add Supporting\ Files/Info.plist
    git add Tests/Supporting\ Files/Info.plist
    git commit -m "chore: updates version on Info.plist files"
    git push --follow-tags origin HEAD
    # uploads new version to cocoapods
    VERSION_NUMBER=$VERSION pod trunk push NatDS.podspec --allow-warnings
    # updates remote docs page
    make create_docs
# else
#     echo "No applicable changes since the previous tag, skipping..."
# fi
