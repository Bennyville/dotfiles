#!/usr/bin/env zsh

curl -I -L "http://github.com" --silent > /dev/null
[[ $? -eq 7 ]] && echo "Can't reach github.com. Proxy needed?" && exit

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