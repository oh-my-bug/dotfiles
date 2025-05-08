# dotfiles

Personal configuration for dev environment (macOS).

## Before Installation

This setup is designed for my personal workflow and assumes a macOS system.

Before running any scripts:
- Review the code in this repository to understand what it does
- Ensure it aligns with your system
- Some scripts will override existing configuration files
- Be careful and have fun

## Installation

Clone this repository into your ``Home`` directory and run the ``install.sh`` script for a full setup:

```bash
git clone https://github.com/oh-my-bug/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Modular Installation

Each install script in this repository is self-contained and can be run independently.

> **Note**: Scripts are idempotent where possible - running them multiple times is safe.

```bash
./install/wezterm.sh
```

## Installation Overview

### CLI / Dev Tools

- [Homebrew](https://brew.sh/) - package manager for macOS
- [Neovim](https://neovim.io/) - Vim-based text editor
- [tmux](https://github.com/tmux/tmux/wiki) - terminal multiplexer
- [Docker](https://www.docker.com/) - Docker Desktop

### Programming Languages
- [Node.js](https://nodejs.org/) - JavaScript runtime
- [Rust](https://www.rust-lang.org/) - toolchain installed via [rustup](https://rustup.rs/)

### GUI Applications

- [WezTerm](https://wezterm.org/) - terminal emulator

### Other Tools
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) - theme for Zsh
- [MesloLGS Nerd Font](https://www.nerdfonts.com/) - font with icons

## Configs

- **nvim** - include custom keymaps and plugin setup via [lazy.nvim](https://lazy.folke.io/) \
    Plugins:
    - [lazy.nvim](https://lazy.folke.io/) - package manager
    - [telescope](https://github.com/nvim-telescope/telescope.nvim) - fuzzy finder
    - [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim) - better 'select' UI
    - [harpoon](https://github.com/ThePrimeagen/harpoon) - quick file navigation
    - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - syntax highlighting
    - [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - browse file system 
    - [undotree](https://github.com/mbbill/undotree) - undo history browser
    - [vim-fugitive](https://github.com/tpope/vim-fugitive) - git plugin
    - [mason](https://github.com/williamboman/mason.nvim) - external tool manager for LSP servers
    - [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - LSP setup with mason
    - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - configurations for LSP servers
    - [none-ls](https://github.com/nvimtools/none-ls.nvim) - custom LSP sources
    - [blink.cmp](https://github.com/Saghen/blink.cmp) - completion plugin for LSPs and other sources
    - [catppuccin](https://github.com/catppuccin/nvim) - ui theme
    - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - statusline
- **wezterm** - app customization 
- **.p10k.zsh** - p10k theme preset for Zsh
- **.tmux.conf** - plugin setup and key bindings \
    Plugins:
    - [tpm](https://github.com/tmux-plugins/tpm) - plugin manager
    - [catppuccin/tmux](https://github.com/catppuccin/tmux) - theme 
