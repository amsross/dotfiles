# Add tab cmpletion for unison preference profiles in ~/.unison/
[ -e "$HOME/.unison/" ] && complete -o "default" -o "nospace" -W "$(for x in ~/.unison/*.prf; do echo $(basename ${x%.prf}); done)" unison
