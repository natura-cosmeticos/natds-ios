#!/usr/bin/env bash

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

TITLECOLOR='\033[0;35m'
NC='\033[0m' # No Color

# Run sections based on command line arguments
for ARG in "$@"
do
    if [ "$ARG" == "brew" ] || [ "$ARG" == "all" ]; then
        # Run the brew.sh Script
        echo -e "${TITLECOLOR}"
        echo "----------------------------------"
        echo "Verifying Homebrew and dependencies"
        echo "This might take a while to complete, as some formulae need to be installed from source"
        echo "You'll need to provide administrator permission to install Brew"
        echo "----------------------------------"
        echo -e "${NC}"
        ./brew.sh
    fi
done

echo "-----------------------------------------------------------------------------------"
echo "Completed running setup.sh, restart your computer to ensure all updates take effect"
echo "-----------------------------------------------------------------------------------"
