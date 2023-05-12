#!/bin/bash

is_mac() {
    if [ "$(uname)" = "Darwin" ]; then
        return 0;
    else
        return 1;
    fi
}

# install build tools
if is_mac; then
    xcode-select --install;
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;

# Install brew
if ! which brew; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi

# setup cask fonts
if is_mac; then # macos
    brew tap homebrew/cask-fonts;
else # linux
    brew tap homebrew/linux-fonts;
    # one-time setup for font installation
    ln -s /home/linuxbrew/.linuxbrew/share/fonts ~/.local/share/fonts;
    # refresh font-cache
    if which fc-cache; then
        fc-cache -fv;
    fi
fi

# install packages
brew install \
    font-caskaydia-cove-nerd-font \
    starship \
    nvm \
    dotnet@6

echo "finished";
