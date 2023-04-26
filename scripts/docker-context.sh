#!/usr/bin/env zsh

current=$(docker context show)
selected=$(docker context ls --format '{{.Name}}{{if eq .Current true}}*{{end}}' | fzf | sed 's/\*$//')

if [[ -z $selected || $selected = $current ]]; then
    exit 0
fi

docker context use $selected
