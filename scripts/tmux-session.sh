#!/usr/bin/env zsh

# From https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

if [[ $# -eq 1 ]]; then
    selected=$1
else
	selected=$((find ~/code -mindepth 1 -maxdepth 1 -type d && echo ~/.dotfiles) | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(echo "$selected" | rev | cut -d'/' -f 1,2 | rev | sed 's#^~\/##' | tr './' '_-')
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
