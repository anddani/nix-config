if type starship  &>/dev/null; then
	eval "$(starship init zsh)"
fi

if type direnv &>/dev/null; then
	eval "$(direnv hook zsh)"
fi

source <(fzf --zsh)

bindkey -v # vi bindings

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

