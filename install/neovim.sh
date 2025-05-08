#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: NEOVIM"

# try install if missing
if ! command -v nvim &>/dev/null; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"

  if ! command -v brew &>/dev/null; then
    echo ">>> INSTALL ROUTINE ABORTED"
    echo ">>> ERROR: HOMEBREW NOT FOUND"
    exit 1
  fi

  brew install neovim
  brew install ripgrep

  echo ">>> INSTALLATION COMPLETED"
  echo ">>> EXECUTING CONFIG LINKAGE"

  config_src_path="$HOME/dotfiles/config/nvim"
  config_target_path="$HOME/.config/nvim"

  if [[ ! -L "$config_target_path" ]]; then
    ln -sf "$config_src_path" "$config_target_path"
  fi
fi

# check status
if ! command -v nvim &>/dev/null; then
  echo ">>> ERROR: PATH OVERRIDE FAILED"
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> INITIATING UPDATE SEQUENCE... STANDBY"

brew update
brew upgrade neovim

echo ">>> ALL MODULES UPDATED"
echo ">>> APPLICATION STATUS: ONLINE"
echo ">>> VERSION: $(nvim -v | head -n1 | awk '{print $2}' | sed 's/^v//')"

