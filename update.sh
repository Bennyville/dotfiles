#!/usr/bin/env zsh

# Check if github.com is reachable
curl -I -L "https://github.com" --connect-timeout 1 --silent > /dev/null
[[ $? -eq 7 ]] && echo "Can't reach github.com. Proxy needed?" && exit

echo '### Pull latest changes ###'
git pull origin master

echo '\n### Sync dotfiles ###'
# Sync dotfiles
rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude "README.md" \
	--exclude "update.sh" \
	-avh --no-perms . ~;

echo '\n### Reload ZSH config ###'
source ~/.zshrc

# Brew
function update_homebrew() {
	brew update
	brew upgrade
	brew cleanup
}

echo '\n### Update homebrew ###'
read "confirm?Update homebrew? (y/n)"
if [[ "$confirm" =~ ^[Yy]$ ]]
then
    update_homebrew
fi
