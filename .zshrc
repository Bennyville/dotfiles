#!/usr/bin/env zsh
# ZSH
export ZSH=/Users/bpeckruhn/.oh-my-zsh

ZSH_THEME="honukai"

source $ZSH/oh-my-zsh.sh


# User configuration
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
