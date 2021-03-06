
alias g='git '
# autocomplete for g
complete -o default -o nospace -F _git g


alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gcl='git clone'
alias gco='git checkout'
alias gdv='git diff -w "$@" | vim -R -'
alias gfgr='git fetch && git rebase'
alias gits="git status"
alias gl='git log --graph --abbrev-commit'
alias gll='gl --pretty=oneline'
alias glg="gl --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --date=relative"
alias glgs="glg --stat"
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gpl='git pull'
alias gplo='gpl origin'
alias gplh='gpl heroku'
alias gplpu='gpl && git push'
alias gplr='gpl --rebase'
alias gps='git push'
alias gpsh='gps heroku'
alias gpso='gps origin'
alias gs='git status'
alias gss='gs -s'
alias gw="git whatchanged"
alias gd="git diff"
alias gds="gd --staged"
