#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: DOCKER"

# try install if missing
if ! command -v docker &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"

  if ! command -v brew &>/dev/null; then
    echo ">>> INSTALL ROUTINE ABORTED"
    echo ">>> ERROR: HOMEBREW NOT FOUND"
    exit 1
  fi

  brew update
  brew install --cask docker

  echo ">>> INSTALLATION COMPLETED"
fi

# check status
if ! command -v docker &>/dev/null; then
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> APPLICATION STATUS: ONLINE"
echo ">>> VERSION: $(docker -v &>/dev/null | awk '{print $3}' | sed 's/,$//')"
