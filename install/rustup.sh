#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: RUSTUP"

# try install if missing
if ! command -v rustup &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  
  echo ">>> INSTALLATION COMPLETED"
fi

# check status
if ! command -v rustup &>/dev/null; then
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> INITIATING UPDATE SEQUENCE... STANDBY"

rustup update

echo ">>> ALL MODULES UPDATED"
echo ">>> APPLICATION STATUS: ONLINE"
echo ">>> VERSION: $(rustup --version 2>/dev/null | awk '{print $2}')"
