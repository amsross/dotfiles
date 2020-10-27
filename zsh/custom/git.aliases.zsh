# alias g='git'
# alias ga='git add'
# alias gb='git branch'
# alias gc='git commit -v'
# alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gcl='git clone --recursive'
# alias gco='git checkout'
# alias gdv='git diff -w "$@" | vim -R -'
alias gfgr='git fetch && git rebase'
# alias gits="git status"
alias gll='git log --graph --abbrev-commit --pretty=oneline'
alias glg="git log --graph --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --date=relative"
alias glgs="git log --graph --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --date=relative --stat"
# alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gpl='git pull'
alias gplo='git pull origin'
alias gplh='git pull heroku'
# alias gplpu='gpl && git push'
# alias gplr='gpl --rebase'
alias gps='git push'
alias gpsh='git push heroku'
alias gpso='git push origin'
alias gs='git status'
# alias gss='gs -s'
# alias gw="git whatchanged"
# alias gd="git diff"
alias gds="git diff --staged"
alias gdws="git diff --word-diff --staged"
alias gdn="git diff --name-only" # vi `gdn` to edit changed files
alias gdns="git diff --name-only --staged" # vi `gdn` to edit changed files
alias gpup='git push origin $(git_current_branch)'
alias gplup='git pull origin $(git_current_branch)'
