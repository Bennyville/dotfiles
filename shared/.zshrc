#!/usr/bin/env zsh
# ZSH completions
autoload -Uz compinit && compinit

# Forest Evening Theme for Pure Prompt (Zsh)

# Color definitions
export FOREST_BG0='#1a1f1a'
export FOREST_BG1='#212621'
export FOREST_BG2='#2a312a'
export FOREST_BG3='#333d33'
export FOREST_FG0='#e8dcc6'
export FOREST_FG1='#d4c7aa'
export FOREST_FG2='#c0b28a'
export FOREST_FG3='#ac9d6a'
export FOREST_RED='#ff6347'
export FOREST_ORANGE='#ff8c00'
export FOREST_YELLOW='#fabd2f'
export FOREST_GREEN='#9caf88'
export FOREST_AQUA='#8ec07c'
export FOREST_BLUE='#83a598'
export FOREST_PURPLE='#d3869b'
export FOREST_MOSS='#6b8e23'
export FOREST_GOLDEN='#daa520'
export FOREST_AMBER='#ffbf00'
export FOREST_SAGE='#9caf88'
export FOREST_PINE='#4a5d4a'

# Pure prompt theme configuration
zstyle ':prompt:pure:prompt:success' color $FOREST_GOLDEN
zstyle ':prompt:pure:prompt:error' color $FOREST_RED
zstyle ':prompt:pure:prompt:continuation' color $FOREST_SAGE
zstyle ':prompt:pure:path' color $FOREST_GOLDEN
zstyle ':prompt:pure:git:branch' color $FOREST_SAGE
zstyle ':prompt:pure:git:branch:cached' color $FOREST_MOSS
zstyle ':prompt:pure:git:action' color $FOREST_ORANGE
zstyle ':prompt:pure:git:arrow' color $FOREST_AMBER
zstyle ':prompt:pure:git:stash' color $FOREST_PURPLE
zstyle ':prompt:pure:git:dirty' color $FOREST_YELLOW
zstyle ':prompt:pure:host' color $FOREST_AQUA
zstyle ':prompt:pure:user' color $FOREST_FG1
zstyle ':prompt:pure:user:root' color $FOREST_RED
zstyle ':prompt:pure:virtualenv' color $FOREST_PURPLE
zstyle ':prompt:pure:execution_time' color $FOREST_AMBER

# Additional Pure settings for the forest theme
zstyle ':prompt:pure:git:stash' show yes
zstyle ':prompt:pure:git:dirty' check yes
zstyle ':prompt:pure:prompt:continuation' show yes

# ZSH pure prompt
autoload -U promptinit; promptinit
prompt pure

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
