# dotfiles

## Description

User setup i use on Debian Bookworm (GNOME) distribution.

## Table of contents

1. [About](#about)
2. [Stow](#stow)
3. [Installation](#installation)
4. [Usage](#usage)
5. [TODO](#todo)

## About

## Stow

A symlink farm manager which takes distinct packages of software and/or data located in a separate directories of the filesystem, and makes them appear to be installed in the same place. For example. `/usr/local/bin` could contain symlinks to files within `/usr/local/stow/emacs/bin`, `/usr/local/stow/perl/bin` etc., and likewise recursively for any other subdirectories such as `.../share`, `.../main`, and so on.

Three terms to know before start working with Stow:

- Package,
- Stow Directory,
- Target Directory.

```
+-- ~/.dotfiles                 # stow directory
|   +-- git/                    # package
|       +-- .gitconfig
|   +-- tmux/                   # package
|       +-- .config/------------------------|
|           +-- tmux/                       |
|       +-- .tmux.conf                      |
|   +-- bash/                   # package   |
|       +-- .bash_completion/               |
|       +-- .bashrc                         |
|       +-- .editorconfig                   |
|   +-- kitty/                              |
|       +-- .config/------------------------|
|           +-- kitty/                      |
|   +-- nvim/                               |
|       +-- .config/------------------------|
|           +-- nvim/                       |
...                                         |
|_______________|                           |
        |                                   |
        |                                   |
       \ /                                 \ /
                                      target directory

~/.dotfiles/git/.gitconfig          -> ~/.gitconfig
~/.dotfiles/tmux/.config/tmux/      -> ~/.config/tmux
~/.dotfiles/tmux/.tmux.conf         -> ~/.tmux.conf
~/.dotfiles/kitty/.config/kitty     -> ~/.config/kitty
~/.dotfiles/nvim/.config/nvim       -> ~/.config/nvim
...
```

## Installation

The color theme i use is [Catppuccin Macchiato](https://github.com/catppuccin/catppuccin).

Ensure that the below items/packages are installed:

| item/package                                                   | installation script |
| -------------------------------------------------------------- | ------------------- |
| [git-extras](https://github.com/tj/git-extras)                 |                     |
| [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) |                     |
| [yq](https://mikefarah.gitbook.io/yq)                          |                     |
| [jq](https://jqlang.github.io/jq/)                             |                     |
| [ripgrep](https://github.com/BurntSushi/ripgrep)               |                     |
| fd-find                                                        |                     |
| Nerd Fonts                                                     |                     |
| [bat](https://github.com/sharkdp/bat)                          |                     |
| tmux                                                           |                     |
| [fish shell](https://fishshell.com/)                           |                     |
| [Kitty](https://sw.kovidgoyal.net/kitty/)                      |                     |
| Lua 5.1.x                                                      |                     |
| Luarocks 3.11.x                                                |                     |
| Rust                                                           |                     |
| rustup                                                         |                     |
| [nvm](#nvm)                                                    | [script](#nvm)      |
| npm                                                            |                     |
| NodeJS                                                         |                     |
| [nvim](#nvim)                                                  | [script](#nvim)     |
| [lazygit](#lazygit)                                            | [script](#lazygit)  |
| Go                                                             |                     |
| stow                                                           |                     |

### nvm

The most up to date installation script for nvm can be found in the [nvm repository](https://github.com/nvm-sh/nvm).

**Important** Below will not form with fish shell, it is meant to be run in bash or zsh.

```bash
// with curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

// or with wget
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

To make it work with fish shell, take a look at [nvm.fish](https://github.com/jorgebucaran/nvm.fish) plugin.

```bash
fisher install jorgebucaran/nvm.fish

// install the latest Node release
nvm install latest

// install the latest lts release
nvm install lts
```

The `nvm` command activates the specified Node version only in current environment. To make it permanent and available
in all new shells, add below into `fish.conf`:

```bash
set --universal nvm_default_version lts
```

This will set the latest lts as a default version for all new shells.

### nvim

Before installing nvim make sure that the below packages are also installed.

```bash
# pdflatex used in markdown-preview
sudo apt install texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra

# tree-sitter
git clone https://github.com/tree-sitter/tree-sitter.git
cd tree-sitter
make
sudo make install
sudo npm install -g tree-sitter-cli

# tree-sitter-latex
git clone https://github.com/latex-lsp/tree-sitter-latex.git
cd tree-sitter-latex
tree-sitter generate

# CLI for mermaid
npm install -g @mermaid-js/mermaid-cli

# neovim
npm install -g neovim
```

### lazygit

For Debian 12

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

tar xf lazygit.tar.gz lazygit

sudo install lazygit -D -t /usr/local/bin/
```

Verify the correct installation using:

```bash
lazygit --version
```

## Usage

## TODO
