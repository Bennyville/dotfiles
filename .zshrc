#!/usr/bin/env zsh
# ZSH completions
autoload -Uz compinit && compinit


# User configuration
for file in ~/.{path,exports,aliases,functions,extra}; do
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

source <(fzf --zsh)
