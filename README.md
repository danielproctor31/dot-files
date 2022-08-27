# dot-files

Uses GNU Stow: https://www.gnu.org/software/stow/

Example:
```
git clone git@github.com:danielproctor31/dot-files.git
cd dot-files
stow bash
```

## Prerequisites

### ZSH

https://ohmyz.sh/#install

https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

https://starship.rs/guide/#%F0%9F%9A%80-installation

```

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl -sS https://starship.rs/install.sh | sh
```


### NeoVim

https://github.com/neovim/neovim/wiki/Installing-Neovim

https://github.com/junegunn/vim-plug

```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
