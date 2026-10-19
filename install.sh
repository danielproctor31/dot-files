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

if command -v pwsh >/dev/null; then
    echo "Configuring PowerShell modules..."
    pwsh -NoProfile -Command "
        if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
            Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null;
            Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted -ErrorAction SilentlyContinue;
            Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -AllowClobber -Confirm:\$false -SkipPublisherCheck;
        }
    "
fi

echo "Linking dot-files..."

for package in git fish nvim powershell; do
    stow --restow --dir "$PWD" --target "$HOME" "$package"
done

echo "Finished"