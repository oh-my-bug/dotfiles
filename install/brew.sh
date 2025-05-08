#!/usr/bin/env zsh

# for path override
brew_prefix="$([[ "$(uname -m)" == "arm64" ]] && { echo "/opt/homebrew" } || { echo "/usr/local" })"

echo ">>> SYSTEM CHECK: HOMEBREW"

# install if missing
if ! command -v brew &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING"
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  echo ">>> INSTALLATION COMPLETED"
  
  if [ -x "$brew_prefix/bin/brew" ]; then
    export PATH="$brew_prefix/bin:$PATH"
    echo ">>> PATH OVERRIDE ENGAGED"
  fi
fi

# check status
if ! command -v brew &>/dev/null; then
  echo ">>> ERROR: PATH OVERRIDE FAILED"
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> INITIATING UPDATE SEQUENCE... STANDBY"

brew update
brew upgrade
brew upgrade --cask
brew cleanup

echo ">>> ALL MODULES UPDATED"
echo ">>> APPLICATION STATUS: ONLINE"
echo ">>> VERSION: $(brew -v | awk '{print $2}')"
