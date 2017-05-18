#!/usr/bin/env zsh

brew upgrade
brew update

# CLI Tools
brew install coreutils
brew install ack
brew install git
brew install htop
brew install mercurial
brew install node
brew install php70
brew install python
brew install python3
brew install shellcheck
brew install smartmontools
brew install speedtest_cli
brew install task
brew install thefuck
brew install tldr
brew install tree
brew install wget
brew install woof
brew install zsh

# Application
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install appcleaner
brew cask install google-chrome-canary
brew cask install iterm2-nightly
brew cask install sequel-pro
brew cask install sketch
brew cask install skype
brew cask install sublime-text-dev
brew cask install virtualbox
brew cask install vlc

brew cleanup
