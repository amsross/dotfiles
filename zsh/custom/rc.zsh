# fnm
export PATH=$HOME/.fnm:$PATH
export VAULT_ADDR=https://vault.apa.comcast.net

export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_DEFAULT_OPTS="--multi --height 75% --min-height 25 --info inline --border --preview-window right:60%:border"
alias fff="fzf --preview 'bat --style=numbers --color=always {+} | head -100'"
alias ffg="git log --color=always --oneline --decorate | fzf --ansi --multi --preview 'git show --pretty=short --show-signature {+1} --color=always'"

eval "$(fnm env)"
