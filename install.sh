#!/usr/bin/env zsh

# paths
dotfiles_path="${HOME}/dotfiles"
install_scripts_path="$dotfiles_path/install"

install_scripts=(
  "xcode-clt"
  "brew"
  "node"
  "rustup"
  "docker"
  "wezterm"
  "p10k"
  "neovim"
  "tmux"
)

for script in "${install_scripts[@]}"; do
  source "$install_scripts_path/$script.sh"
  echo ""
done

