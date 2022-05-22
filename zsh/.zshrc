#!/bin/zsh

export LESS_TERMCAP_md="$(tput bold setaf 4)"
export LESS_TERMCAP_me="$(tput sgr0)"
export LESS_TERMCAP_us="$(tput sitm setaf 5)"
export LESS_TERMCAP_ue="$(tput sgr0)"
export LESS_TERMCAP_so="$(tput setab 3 setaf 0)"
export LESS_TERMCAP_se="$(tput sgr0)"

alias grep="grep --color=\"auto\" --ignore-case"
alias diff="diff --color=\"auto\""
alias ls="ls --color=\"auto\" --group-directories-first --no-group --human-readable"
alias ll="ls --format=\"long\""
alias la="ls --almost-all"
alias al="ls --format=\"long\" --almost-all"

zinstall() {
	mkdir --parents "$ZDIR"
	plugin="$ZDIR/${1##*/}"

	[ ! -d "$plugin" ] && git clone --depth="1" "https://github.com/$1.git" "$plugin"
	[ -n "$2" ] && source "$plugin/$2"
	fpath+="$plugin"
}

zupdate() {
	for d in "$ZDIR"/*; do
		[ ! -d "$d" ] && continue
		(cd "$d" && git pull)
	done
}

setopt "appendhistory"
HISTSIZE="4096"
SAVEHIST="4096"

setopt "prompt_subst"
autoload "colors" && colors
autoload "vcs_info" && precmd() { vcs_info; }
zstyle ":vcs_info:*" enable "git"
zstyle ":vcs_info:*" check-for-changes "true"
zstyle ":vcs_info:git:*" formats "on %{$fg_bold[magenta]%}%b%{$reset_color%} "
PROMPT=$'\n'"in %{$fg_bold[blue]%}%c%{$reset_color%} \$vcs_info_msg_0_"
PROMPT+=$'\n'"%(?:%{$fg[green]%}:%{$fg[red]%})~~>%{$reset_color%} "

zinstall "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
autoload "compinit" && compinit
zmodload "zsh/complist"
zstyle ":completion:*" menu "select"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
bindkey -M "menuselect" "^[[Z" "reverse-menu-complete"
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

zinstall "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
setopt "interactive_comments"
ZSH_HIGHLIGHT_STYLES[comment]="fg=241"

zinstall "softmoth/zsh-vim-mode" "zsh-vim-mode.plugin.zsh"
bindkey -M "viins" "jk" "vi-cmd-mode"
bindkey -M "viins" "kj" "vi-cmd-mode"
RPS1=""
KEYTIMEOUT="5"
MODE_CURSOR_VIINS="bar"
