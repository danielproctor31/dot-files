#!/bin/sh

is_mac() {
    if [ "$(uname)" = "Darwin" ]; then
        return 1;
    else
        return 0;
    fi
}

# install build tools
xcode-select --install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# setup cask fonts
if [ is_mac ]; then # macos
    brew tap homebrew/cask-fonts
else # linux
    brew tap homebrew/linux-fonts
    # one-time setup for font installation
    ln -s /home/linuxbrew/.linuxbrew/share/fonts ~/.local/share/fonts
    fc-cache -fv
fi

# install a font
brew install font-caskaydia-cove-nerd-font

# Install starship
brew install starship

echo "finished"