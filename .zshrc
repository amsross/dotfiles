# Path to your oh-my-zsh installation.
export LANG=en_US.UTF-8
export TERM=xterm-256color
export ZSH=$HOME/.oh-my-zsh
export VIMBLACKLIST='somefakeplugin'
export POWERLINE_CONFIG_PATHS=$HOME/.vim/bundle/powerline/powerline/config_files:$HOME/dotfiles/powerline

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to 'random', it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME='spaceship'

SPACESHIP_AWS_SHOW=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_HG_BRANCH_SHOW=false
SPACESHIP_HG_SHOW=false
SPACESHIP_HG_STATUS_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_XCODE_SHOW_LOCAL=false

DEFAULT_USER='nitrous'

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE='true'

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE='false'

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS='true'

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE='true'

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION='true'

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS='true'

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY='true'

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: 'mm/dd/yyyy'|'dd.mm.yyyy'|'yyyy-mm-dd'
# HIST_STAMPS='mm/dd/yyyy'

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/zsh/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract npm tmux docker-compose nvm)

# User configuration
ZSH_TMUX_AUTOSTART='false'

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
# export MANPATH='/usr/local/man:$MANPATH'

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS='-arch x86_64'

# ssh
# export SSH_KEY_PATH='~/.ssh/dsa_id'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig='mate ~/.zshrc'
# alias ohmyzsh='mate ~/.oh-my-zsh'
if which dircolors &> /dev/null; then
  eval `dircolors $HOME/dotfiles/dircolors/dircolors.nord`
fi
# if which powerline &> /dev/null; then
#   . ~/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source "/Users/matt/dotfiles/zsh/custom/themes/spaceship.zsh-theme"