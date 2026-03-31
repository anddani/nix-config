if type starship  &>/dev/null; then
	eval "$(starship init zsh)"
fi

if type direnv &>/dev/null; then
	eval "$(direnv hook zsh)"
fi

if type zoxide &>/dev/null; then
	eval "$(zoxide init zsh)"
fi

if type fzf &>/dev/null; then
	source <(fzf --zsh)
fi

if type brew &>/dev/null; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

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
alias cr='cargo run'

function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}

alias l='eza --icons -a --group-directories-first -1 --no-user --long'
alias tree='eza --icons --tree --group-directories-first'

export EDITOR="hx"
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

