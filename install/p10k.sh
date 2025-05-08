#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: POWERLEVEL10K"

# try install if missing
if ! brew list | grep powerlevel10k &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"

  if ! command -v brew &>/dev/null; then
    echo ">>> INSTALL ROUTINE ABORTED"
    echo ">>> ERROR: HOMEBREW NOT FOUND"
    exit 1
  fi

  brew install powerlevel10k
  echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
 
  echo ">>> INSTALLATION COMPLETED"
  echo ">>> EXECUTING CONFIG LINKAGE"

  config_src_path="$HOME/dotfiles/config/.p10k.zsh"
  config_target_path="$HOME/.p10k.zsh"

  if [[ ! -L "$config_target_path" ]]; then
    ln -sf "$config_src_path" "$config_target_path"
  fi

fi

# check status
if ! brew list | grep powerlevel10k &>/dev/null; then
  echo ">>> ERROR: PATH OVERRIDE FAILED"
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> INITIATING UPDATE SEQUENCE... STANDBY"

brew update
brew upgrade powerlevel10k

echo ">>> ALL MODULES UPDATED"
echo ">>> APPLICATION STATUS: ONLINE"

