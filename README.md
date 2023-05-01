# dot-files

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- Git
- Zsh
- `build-essential` package (for brew).
- NeoVim

## Example Usage

```
git clone git@github.com:danielproctor31/dot-files.git
cd dot-files
stow git
```

## Additional scripts

### ZSH

```
./zsh.sh
stow zsh
```

### NeoVim

- Uses [VimPlug](https://github.com/junegunn/vim-plug)

```
./nvim.sh
stow nvim
```
Load nvim and run `:PlugInstall`.