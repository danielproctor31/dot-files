#!/bin/bash

echo "Linking dot-files...";

stow git;
stow zsh;
stow nix;

echo "Finished";
