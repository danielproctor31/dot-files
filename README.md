# dot-files

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- Git
- Zsh
- [Brew](https://brew.sh/)
  - Also ensure `build-essential` package is installed.
- NeoVim

### ZSH

- [oh-my-zsh](https://ohmyz.sh/#install)
  - Some themes may require a [Powerline font](https://github.com/powerline/fonts)
- [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
  - Requires a [Nerd Font](https://www.nerdfonts.com/font-downloads)

Run the following:
```
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install starship
brew install starship
```

Fonts can be acquired from [homebrew-linux-fonts](https://github.com/Homebrew/homebrew-linux-fonts) using Brew:

```
# one-time setup for font installation
brew tap homebrew/linux-fonts
ln -s /home/linuxbrew/.linuxbrew/share/fonts ~/.local/share/fonts
fc-cache -fv

# install a font
brew install font-caskaydia-cove-nerd-font
```

### NeoVim

- [VimPlug](https://github.com/junegunn/vim-plug)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Load nvim and run `:PlugInstall`.

## Example Usage

```
git clone git@github.com:danielproctor31/dot-files.git
cd dot-files
stow zsh
```
