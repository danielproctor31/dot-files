#!/bin/bash

echo "Linking dot-files...";

stow git;
stow zsh;
stow nix;
stow pwsh;
stow nvim;

echo "Finished";