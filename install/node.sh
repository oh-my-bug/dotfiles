#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: NODE"

# try install if missing
if ! command -v node &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"

  if ! command -v brew &>/dev/null; then
    echo ">>> INSTALL ROUTINE ABORTED"
    echo ">>> ERROR: HOMEBREW NOT FOUND"
    exit 1
  fi

  brew install node
 
  echo ">>> INSTALLATION COMPLETED"
  
  if [ -x "/opt/homebrew/bin/node" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
    echo ">>> PATH OVERRIDE ENGAGED"
  fi

fi

# check status
if ! command -v node &>/dev/null; then
  echo ">>> ERROR: PATH OVERRIDE FAILED"
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> INITIATING UPDATE SEQUENCE... STANDBY"

brew update
brew upgrade node

echo ">>> ALL MODULES UPDATED"
echo ">>> APPLICATION STATUS: ONLINE"
echo ">>> VERSION: $(node -v | sed 's/^v//')"

