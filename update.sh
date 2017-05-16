#!/usr/bin/env zsh

git pull origin master

# Sync dotfiles
rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude "README.md" \
	--exclude "update.sh" \
	-avh --no-perms . ~;

source ~/.zshrc

# Brew
brew update
brew upgrade
brew cleanup