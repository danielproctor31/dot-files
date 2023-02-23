# dot-files

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)

### ZSH

- [oh-my-zsh](https://ohmyz.sh/#install)
  - Some themes may require a [Powerline font](https://github.com/powerline/fonts)
- [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
  - Additionaly install a [Nerd Font](https://www.nerdfonts.com/font-downloads)

Run the following:
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

curl -sS https://starship.rs/install.sh | sh
```

### NeoVim

- [VimPlug](https://github.com/junegunn/vim-plug)

Install neovim:
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

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
