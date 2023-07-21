export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:wrap"

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_ALT_C_OPTS="
  --preview 'tree --gitignore -C {} | head -200'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_ALT_C_COMMAND="rg --hidden --files --null --sort-files | xargs -0 dirname | uniq"
