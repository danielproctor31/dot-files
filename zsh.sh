#!/bin/sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# one-time setup for font installation
brew tap homebrew/linux-fonts
ln -s /home/linuxbrew/.linuxbrew/share/fonts ~/.local/share/fonts
fc-cache -fv

# install a font
brew install font-caskaydia-cove-nerd-font

# Install starship
brew install starship