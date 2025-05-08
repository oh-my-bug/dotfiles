#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: TMUX"

# try install if missing
if ! command -v tmux &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"

  if ! command -v brew &>/dev/null; then
    echo ">>> INSTALL ROUTINE ABORTED"
    echo ">>> ERROR: HOMEBREW NOT FOUND"
    exit 1
  fi

  echo ">>> PRIMARY MODULE INSTALL SEQUENCE"

  brew install tmux

  plugins_target_path = "${HOME}/.tmux/plugins"
  if [[ ! -e "$plugins_target_path/tpm" ]]; then
    echo ">>> PLUGIN MANAGER INSTALL SEQUENCE"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  echo ">>> INSTALLATION COMPLETED" 
  echo ">>> EXECUTING CONFIG LINKAGE"

  config_src_path="$HOME/dotfiles/config/.tmux.conf"
  config_target_path="$HOME/.tmux.conf"

  if [[ ! -L "$config_target_path" ]]; then
    ln -sf "$config_src_path" "$config_target_path"
  fi

  echo ">>> MANUAL INTERVENTION REQUIRED"
  echo ">>> START TMUX PROGRAM AND INITIATE PLUGIN INSTALLATION"
  echo ">>> HINT: C-s + I"
  echo ">>> PRESS [ENTER] ONCE INSTALLATION IS COMPLETE"
  read
fi

# check status
if ! command -v tmux &>/dev/null; then
  echo ">>> ERROR: PATH OVERRIDE FAILED"
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1 
fi

echo ">>> INITIATING UPDATE SEQUENCE... STANDBY"

brew update
brew upgrade tmux

echo ">>> ALL MODULES UPDATED"
echo ">>> APPLICATION STATUS: ONLINE"
echo ">>> VERSION: $(tmux -V | awk '{print $2}')"

