#!/bin/bash

is_mac() {
    if [ "$(uname)" = "Darwin" ]; then
        return 0;
    else
        return 1;
    fi
}

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;

# setup cask fonts
if is_mac; then # macos
    # install build tools
    xcode-select --install;
    # Install brew
    if ! which brew; then
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
    fi
    # install packages
    brew tap homebrew/cask-fonts;  
    brew install \
        font-caskaydia-cove-nerd-font \
        starship
fi

echo "finished";
