#!/bin/zsh

alias grep="grep --color=\"auto\" --ignore-case"
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --group-directories-first --no-group --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"

zinstall() {
	mkdir --parents "$ZPLUG_DIR"
	plugin="$ZPLUG_DIR/${1##*/}"

	[ ! -d "$plugin" ] && git clone --quiet "https://github.com/$1.git" "$plugin"
	source "$plugin/$2"
}

zupdate() {
	for d in "$ZPLUG_DIR"/*; do
		[ ! -d "$d" ] && continue
		(cd "$d" && git pull --quiet)
	done
}

setopt "appendhistory"
SAVEHIST="4096"

zinstall "jeffreytse/zsh-vi-mode" "zsh-vi-mode.zsh"
zvm_after_init() {
	zvm_bindkey "viins" "jk" "zvm_exit_insert_mode"
	zvm_bindkey "viins" "kj" "zvm_exit_insert_mode"
}
ZVM_KEYTIMEOUT="0.05"

zinstall "spaceship-prompt/spaceship-prompt" "spaceship.zsh"
SPACESHIP_CHAR_SYMBOL="||>"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="~"
SPACESHIP_GIT_STATUS_DELETED="-"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD=">"
SPACESHIP_GIT_STATUS_BEHIND="<"
SPACESHIP_GIT_STATUS_DIVERGED="<>"

zinstall "zdharma-continuum/fast-syntax-highlighting" "fast-syntax-highlighting.plugin.zsh"
setopt "interactive_comments"

zinstall "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
autoload "compinit" && compinit
zstyle ":completion:*" "menu" "select"
zstyle ":completion:*" "matcher-list" "m:{a-z}={A-Za-z}"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370"
