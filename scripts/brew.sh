#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

append_to_zshrc_and_bash() {
    local text="$1" zshrc bashprofile

    zshrc="$HOME/.zshrc"
    bashprofile="$HOME/.bash_profile"

    #If Text do not exists on the Zshell File
    if ! grep -Fqs "$text" "$zshrc"; then
      printf "\\n%s\\n" "$text" >> "$zshrc"
    fi

    #If Text do not exists on the Bash_profile File
    if ! grep -Fqs "$text" "$bashprofile"; then
      printf "\\n%s\\n" "$text" >> "$bashprofile"
    fi
}

# Check for Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  # Ask for the administrator password upfront.
  sudo -v
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  sudo chown -R "$(whoami)" "$(brew --prefix)"/*
else
  echo -e "${GREEN}Homebrew already installed${NC}"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Remove outdated versions from the cellar.
brew cleanup
