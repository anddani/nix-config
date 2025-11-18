if type starship  &>/dev/null; then
	eval "$(starship init zsh)"
fi

if type direnv &>/dev/null; then
	eval "$(direnv hook zsh)"
fi

source <(fzf --zsh)

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

alias c='clear'
alias cd='z'
alias diff='delta --diff-so-fancy --side-by-side'
alias copy='wl-copy'
alias f='superfile'
alias dsize='du -hs'
alias open='xdg-open'

alias l='eza --icons -a --group-directories-first -1 --no-user --long'
alias tree='eza --icons --tree --group-directories-first'

export WORDCHARS='*?_[]~=&;!#$%^(){}'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# On Mac
if [ "$(command -v brew)" ]; then
  export ZPLUG_HOME=$HOMEBREW_PREFIX/opt/zplug
  source $ZPLUG_HOME/init.zsh
	zplug 'zsh-users/zsh-syntax-highlighting'
	zplug 'zsh-users/zsh-completions'
	zplug 'zsh-users/zsh-autosuggestions'
	zplug 'wfxr/forgit'
	zplug 'Aloxaf/fzf-tab'
	zplug 'jeffreytse/zsh-vi-mode'
	if ! zplug check --verbose; then
	    printf "Install? [y/N]: "
	    if read -q; then
	        echo; zplug install
	    fi
	fi

	zplug load # --verbose
fi 

