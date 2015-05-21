path="$HOME/dotfiles"
#echo "$path"

source $path/theme/prompt.sh

#$include /etc/inputrc
set mark-symlinked-directories on

export CLICOLOR=1
export EDITOR='vim -f'
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL="ignoredups"
export HISTCONTROL=erasedups
export GIT_PS1_SHOWDIRTYSTATE=1
export AUTOFEATURE=true autotest
PROMPT_COMMAND='history -a'

export GREP_COLOR='1;33'

unset MAILCHECK

function load_all() {
	file_type=$1
	[ ! -d "$path/$file_type" ] && mkdir "$path/${file_type}"
	for src in $path/${file_type}/*; do
		filename="$(basename ${src})"
		[ ${filename:0:1} = "_" ] && continue
		dest="${path}/${file_type}/${filename}"
		source $dest
	done
}

#echo ""
#echo "loading aliases"
load_all aliases

#echo ""
#echo "loading completions"
load_all completions

#echo ""
#echo "setting dircolors"
eval `dircolors $HOME/dotfiles/bash/theme/dircolors.ansi-dark`
#eval `dircolors $HOME/dotfiles/theme/dircolors.ansi-light`
