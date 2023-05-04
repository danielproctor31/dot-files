# dot-files

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- Git
- Zsh
- `build-essential` package (for brew).

## Example Usage

```
git clone git@github.com:danielproctor31/dot-files.git $HOME/dot-files
cd $HOME/dot-files

chmod u+x ./setup.sh ./install.sh
./setup.sh
./install.sh
```

## NeoVim

- Uses [VimPlug](https://github.com/junegunn/vim-plug)

After installation, load nvim and run `:PlugInstall`.
