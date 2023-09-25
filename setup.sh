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
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting;
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions;

# Install brew
if ! which brew; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi

if is_mac; then
    eval "$(/opt/homebrew/bin/brew shellenv)";

    brew install \
        stow;

    brew tap homebrew/cask-fonts;
    brew install --cask font-caskaydia-cove-nerd-font;
else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    brew tap homebrew/linux-fonts;
    ln -s /home/linuxbrew/.linuxbrew/share/fonts -t ~/.local/share;
    fc-cache -fv;
    brew install font-caskaydia-cove-nerd-font;
fi

echo "finished";
