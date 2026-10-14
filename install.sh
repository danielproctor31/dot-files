#!/bin/bash

set -euo pipefail
trap 'printf "Install failed at line %s: %s\n" "$LINENO" "$BASH_COMMAND" >&2' ERR

cd "$(dirname "${BASH_SOURCE[0]}")"

# Homebrew may not be on PATH yet in a fresh shell.
if ! command -v stow >/dev/null; then
    for candidate in /opt/homebrew/bin/stow /usr/local/bin/stow /home/linuxbrew/.linuxbrew/bin/stow; do
        if [ -x "$candidate" ]; then
            PATH="$(dirname "$candidate"):$PATH"
            break
        fi
    done
fi

if ! command -v stow >/dev/null; then
    echo "stow not found; run setup.sh first" >&2
    exit 1
fi

echo "Linking dot-files..."

for package in git fish nvim; do
    stow --restow --dir "$PWD" --target "$HOME" "$package"
done

echo "Finished"