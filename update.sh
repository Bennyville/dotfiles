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
function update_homebrew() {
	brew update
	brew upgrade
	brew cleanup
}

read "confirm?Update homebrew? (y/n)"
if [[ "$confirm" =~ ^[Yy]$ ]]
then
    update_homebrew
fi