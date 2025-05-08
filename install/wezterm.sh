#!/usr/bin/env zsh

echo ">>> SYSTEM CHECK: WEZTERM"

# try install if missing
if [[ ! -d "/Applications/WezTerm.app/" ]]; then
  echo ">>> APPLICATION STATUS: MISSING" 
  echo ">>> INITIATING INSTALLATION SEQUENCE... STANDBY"

  if ! command -v brew &>/dev/null; then
    echo ">>> INSTALL ROUTINE ABORTED"
    echo ">>> ERROR: HOMEBREW NOT FOUND"
    exit 1
  fi

  brew install --cask wezterm
  brew install --cask font-meslo-lg-nerd-font
  
  echo ">>> INSTALLATION COMPLETED"
  echo ">>> EXECUTING CONFIG LINKAGE"

  config_src_path="$HOME/dotfiles/config/wezterm"
  config_target_path="$HOME/.config/wezterm"

  if [[ ! -L "$config_target_path" ]]; then
    ln -sf "$config_src_path" "$config_target_path"
  fi
fi

# check status
if [[ ! -d "/Applications/WezTerm.app/" ]]; then
  echo ">>> APPLICATION STATUS: OFFLINE"
  echo ">>> OPERATION HALTED"
  exit 1
fi

echo ">>> APPLICATION STATUS: ONLINE"
