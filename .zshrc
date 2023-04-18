
#!/usr/bin/env zsh
# ZSH
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git docker kubectl helm mix ripgrep rust)

fpath+=("$(brew --prefix)/share/zsh/site-functions")

source $ZSH/oh-my-zsh.sh

# User configuration
for file in ~/.{path,exports,aliases,functions,extra,fzf.zsh}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

export LANG=en_US.UTF-8

# Make aliases work in tmux
SOURCE="${(%):-%N}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
