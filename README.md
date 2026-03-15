# dotfiles

- **2026-03-14**

  Update nvim setup and disable Markdown render by default.

  Update `.editorconfig` and `.markdownlint.yaml` setup in `./bash/` and in root folder.

  Add note about `nvim` link in `/usr/bin/nvim` to `/opt/nvim-linux64/bin`.

- **2025-08-25**

  Updated for Debian 13 Trixie.

## Table of contents

1. [Stow](#stow)
2. [Installation](#installation)

## Stow

A symlink farm manager which takes distinct packages of software and/or data located in a separate directories of the
file system, and makes them appear to be installed in the same place. For example. `/usr/local/bin` could contain
symlinks to files within `/usr/local/stow/emacs/bin`, `/usr/local/stow/perl/bin` etc., and likewise recursively for any
other subdirectories such as `.../share`, `.../main`, and so on.

Three terms to know before start working with Stow:

- Package,
- Stow Directory,
- Target Directory.

```text
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
| [bat](https://github.com/sharkdp/bat)                          | [script](#bat)      |
| tmux                                                           |                     |
| [fish shell](https://fishshell.com/)                           | [script](#fish-shell) |
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

### bat

After updating Debian 12 to Debian 13 Trixie, you might have to run `$ bat cache --build` before using the bat command.

### fish shell

```bash
echo 'deb http://download.opensuse.org/repositories/shells:/fish/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/shells:fish.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish.gpg > /dev/null
sudo apt update
sudo apt install fish
```

### nvm

The most up to date installation script for nvm can be found in the [nvm repository](https://github.com/nvm-sh/nvm).

> [!IMPORTANT]
> Below will not work with fish shell, it is meant to be run in bash or zsh.

```bash
// with curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

// or with wget
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

> [!NOTE]
> To make it work with fish shell, take a look at [nvm.fish](https://github.com/jorgebucaran/nvm.fish) plugin.

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

> [!IMPORTANT]
> Before installing nvim make sure that the below packages are also installed.

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

# cli for mermaid
npm install -g @mermaid-js/mermaid-cli

# neovim
npm install -g neovim
```

> [!IMPORTANT]
> I replaced the default `nvim` from `/usr/bin/nvim` by a link to `/opt/nvim-linux64/bin/nvim`!

### lazygit

For **Debian 13 Trixie**

```bash
sudo apt install lazygit
```

For **Debian 12**

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
