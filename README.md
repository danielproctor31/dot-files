# dot-files

Personal configuration for macOS and Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

| Package | Description                                                              |
| ------- | ------------------------------------------------------------------------ |
| `fish`  | [fish](https://fishshell.com/) shell config (Homebrew, fnm, .NET, Nix)   |
| `git`   | `.gitconfig`                                                             |
| `nvim`  | Neovim config, based on [Kickstart](https://github.com/nvim-lua/kickstart.nvim) |

## Prerequisites

- Git
- **Linux:** `fish` and `stow` installed via your package manager, e.g. `sudo apt install fish stow`
- **macOS:** nothing else; `setup.sh` installs everything via Homebrew

## Installation

```sh
git clone git@github.com:danielproctor31/dot-files.git "$HOME/dot-files"
cd "$HOME/dot-files"
chmod u+x ./setup.sh ./install.sh
./setup.sh
./install.sh
```

### `setup.sh`

Installs the tools the configs depend on:

- Updates git submodules
- Installs [vim-plug](https://github.com/junegunn/vim-plug)
- Installs Homebrew if missing
- Installs `nvim` and `fnm` via Homebrew (plus `fish` and `stow` on macOS only)
- Installs the Caskaydia Cove Nerd Font
- Adds fish to `/etc/shells` and sets it as the default shell (uses Homebrew's fish on macOS, the system fish on Linux)

### `install.sh`

Symlinks the `fish`, `git` and `nvim` packages into `$HOME` with `stow --restow`. Existing files that conflict with the links must be moved or removed first.

## Updating

```sh
git pull
git submodule update --init --recursive --remote
./install.sh
```

## Notes

- Open a new fish session after installing so `fnm` and Homebrew are on `PATH`.
- Node versions are managed with [fnm](https://github.com/Schniz/fnm); run `fnm install --lts` then `fnm use`.
