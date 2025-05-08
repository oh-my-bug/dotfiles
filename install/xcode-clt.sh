#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: XCODE-CLT"

# try install if missing
if ! xcode-select -p &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE..."
  echo ">>> MANUAL INTERVENTION REQUIRED"

  xcode-select --install
 
  echo ">>> EXTERNAL INSTALLER INVOKED"
  echo ">>> PRESS [ENTER] ONCE INSTALLATION IS COMPLETE"
  read
fi

# check status
if ! xcode-select -p &>/dev/null; then
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> APPLICATION STATUS: ONLINE"

