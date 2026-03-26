export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:wrap"

# https://github.com/junegunn/fzf/issues/1333
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  # --bind 'enter:become(vi {+} < /dev/tty > /dev/tty)'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_ALT_C_OPTS="
  --preview 'tree --gitignore -C {} | head -200'"

export FZF_ALT_C_COMMAND="rg --hidden --files --null --sort-files | xargs -0 dirname | uniq"

export FZF_DEFAULT_OPTS="
--multi --height 75% --min-height 25 --info inline --border --preview-window right:60%:border
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_DEFAULT_COMMAND='rg --files --follow'

alias fff="fzf --preview 'bat --style=numbers --color=always {+} | head -100'"
alias ffg="git log --color=always --oneline --decorate | fzf --ansi --multi --preview 'git show --pretty=short --show-signature {+1} --color=always'"
