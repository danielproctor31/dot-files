# dot-files

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- Git
- Zsh
- nvim - Using [Kickstart](https://github.com/nvim-lua/kickstart.nvim) config

## Usage

```
git clone git@github.com:danielproctor31/dot-files.git $HOME/dot-files
cd $HOME/dot-files
git submodule update --init --recursive
chmod u+x ./setup.sh ./install.sh
./setup.sh
./install.sh
```

Use the following to update submodules:
```
git submodule update --recursive --remote
```