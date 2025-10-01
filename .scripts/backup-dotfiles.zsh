#!/bin/zsh
repo="/Users/onioncall/repos/macos-dotfiles"

echo backing up .config
mkdir -p $repo/.config
cp -r ~/.config/ $repo/.config

echo backing up .zshrc 
mkdir -p $repo
cp ~/.zshrc $repo/.zshrc

echo backing up .ideavimrc
mkdir -p $repo
cp ~/.ideavimrc $repo/.ideavimrc

echo backing up .scripts
mkdir -p $repo/.scripts
cp -r ~/.scripts/ $repo/.scripts

echo backing up .poshthemes
mkdir -p $repo/.poshthemes
cp -r ~/.poshthemes $repo/.poshthemes
