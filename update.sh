#!/usr/bin/env bash

git pull origin master

# Sync dotfiles
rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude "README.md" \
	--exclude "update.sh" \
	-navh --no-perms . ~;

# Brew
brew update
brew upgrade
brew cleanup