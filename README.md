# dot-files

Personal configuration for macOS and Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- Git
- **Linux:** `fish` `stow` and `git` installed via your package manager
- **macOS:** nothing else; `setup.sh` installs everything via Homebrew/apt

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
- Installs packages via brew
- Installs the Caskaydia Cove Nerd Font via brew
- Adds fish to `/etc/shells` and sets it as the default shell (uses Homebrew's fish on macOS, the system fish on Linux)
- Installs fisher and plugins

### `install.sh`

Symlinks the config files into `$HOME` with `stow --restow`. Existing files that conflict with the links must be moved or removed first.

## Updating

```sh
git pull
git submodule update --init --recursive --remote
./install.sh
```


## Notes

- Open a new fish session after installing so Homebrew are on `PATH`.
- Run `tide configure` to modify prompt theme.