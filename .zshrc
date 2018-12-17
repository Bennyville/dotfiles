#!/usr/bin/env zsh
# ZSH
export ZSH=/Users/bpeckruhn/.oh-my-zsh

SPACESHIP_PROMPT_ORDER=(
	time
	user
	host
	dir
	git
	hg
	exec_time
	line_sep
	vi_mode
	jobs
	exit_code
	char
)

ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh


# User configuration
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

export LANG=en_US.UTF-8