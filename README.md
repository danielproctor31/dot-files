# dot-files

Uses GNU Stow: https://www.gnu.org/software/stow/

Example:
```
git clone git@github.com:danielproctor31/dot-files.git
cd dot-files
stow zsh
```

## Prerequisites

### ZSH

https://ohmyz.sh/#install

https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

https://starship.rs/guide/#%F0%9F%9A%80-installation

https://rvm.io/

https://github.com/nvm-sh/nvm

https://github.com/pyenv/pyenv

Install a nerd font for starship:

https://www.nerdfonts.com/font-downloads

Powerline fonts used for certain ohmyzsh themes:

https://github.com/powerline/fonts

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

curl -sS https://starship.rs/install.sh | sh

curl https://pyenv.run | bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
```

### NeoVim

https://github.com/neovim/neovim/wiki/Installing-Neovim

https://github.com/junegunn/vim-plug

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

Load nvim and run `:PlugInstall`.
