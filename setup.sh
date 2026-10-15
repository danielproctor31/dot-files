#!/bin/bash

set -euo pipefail
trap 'printf "Setup failed at line %s: %s\n" "$LINENO" "$BASH_COMMAND" >&2' ERR

os=$(uname -s)
case "$os" in
    Darwin)
        if [ "$(uname -m)" = "arm64" ]; then
            brew_paths=(/opt/homebrew/bin/brew /usr/local/bin/brew)
        else
            brew_paths=(/usr/local/bin/brew /opt/homebrew/bin/brew)
        fi
        ;;
    Linux)
        brew_paths=(/home/linuxbrew/.linuxbrew/bin/brew)
        ;;
    *)
        printf 'Unsupported operating system: %s\n' "$os" >&2
        exit 1
        ;;
esac

cd "$(dirname "${BASH_SOURCE[0]}")"

echo "Detected OS: $os ($(uname -m))"

echo "Updating git submodules..."
git submodule update --init --recursive

# nvim
echo "Installing vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install brew
echo "Checking for Homebrew..."
brew_bin=$(command -v brew || true)
if [ -z "$brew_bin" ]; then
    for candidate in "${brew_paths[@]}"; do
        if [ -x "$candidate" ]; then
            brew_bin=$candidate
            break
        fi
    done
fi

if [ -z "$brew_bin" ]; then
    echo "Homebrew not found; installing..."
    installer=$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
    NONINTERACTIVE=1 /bin/bash -c "$installer"
    for candidate in "${brew_paths[@]}"; do
        if [ -x "$candidate" ]; then
            brew_bin=$candidate
            break
        fi
    done
fi

if [ -z "$brew_bin" ]; then
    printf 'Homebrew was not found after installation.\n' >&2
    exit 1
fi

echo "Using Homebrew at $brew_bin"
brew_env=$("$brew_bin" shellenv)
eval "$brew_env"

if [ "$os" = "Darwin" ]; then
    echo "Installing packages: fish stow nvim fnm..."
    brew install fish stow nvim fnm
else
    echo "Installing packages: nvim fnm..."
    brew install nvim fnm
fi

echo "Installing fonts..."
if [ "$os" == "Darwin" ]; then
    mkdir -p "$HOME/.local/share"
    ln -sfn /home/linuxbrew/.linuxbrew/share/fonts "$HOME/.local/share/fonts"
    fc-cache -fv
    brew install --cask font-caskaydia-cove-nerd-font
fi


if [ "$os" = "Darwin" ]; then
    fish_bin="$(brew --prefix)/bin/fish"
else
    fish_bin=$(command -v fish || true)
    if [ -z "$fish_bin" ]; then
        printf 'fish not found; install it via apt first.\n' >&2
        exit 1
    fi
fi
if ! grep -qxF "$fish_bin" /etc/shells; then
    echo "Adding $fish_bin to /etc/shells..."
    echo "$fish_bin" | sudo tee -a /etc/shells >/dev/null
else
    echo "$fish_bin already in /etc/shells"
fi
if [ "${SHELL:-}" != "$fish_bin" ]; then
    echo "Setting fish as default shell..."
    chsh -s "$fish_bin"
else
    echo "fish is already the default shell"
fi

echo "Finished"
