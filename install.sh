path="$HOME/dotfiles"

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install pgp fzf rg tmux fnm jq bat
fnm install v14
fnm install v15
fnm alias v14 fermium
fnm use fermium

if ! grep -q "source $path/dotfiles.sh" $HOME/.bashrc;
then
	echo "" >> $HOME/.bashrc
	echo "linking bash profile"
	echo "source $path/dotfiles.sh" >> $HOME/.bashrc
fi

if [ -f "$HOME/.zshrc" ] && ! [ -L "$HOME/.zshrc" ];
then
	echo ""
	echo "backing up $HOME/.zshrc"
	mv $HOME/.zshrc $HOME/.zshrc.bak
fi
if ! [ -f "$HOME/.zshrc" ];
then
	echo ""
	echo "loading default zshrc"
	ln -s "$path/.zshrc" $HOME/.zshrc
fi

if [ -d "$HOME/.tmux" ] && ! [ -L "$HOME/.tmux" ];
then
	echo ""
	echo "backing up $HOME/.tmux"
	mv $HOME/.tmux $HOME/.tmux.bak
fi
if ! [ -d "$HOME/.tmux" ];
then
	echo ""
	echo "loading default tmux"
	ln -s "$path/.tmux" $HOME/.tmux
fi


if [ -f "$HOME/.tmux.conf" ] && ! [ -L "$HOME/.tmux.conf" ];
then
	echo ""
	echo "backing up $HOME/.tmux.conf"
	mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
if ! [ -f "$HOME/.tmux.conf" ];
then
	echo ""
	echo "loading default tmux.conf"
	ln -s "$path/.tmux.conf" $HOME/.tmux.conf
fi

if [ -d "$HOME/.oh-my-zsh" ] && ! [ -L "$HOME/.oh-my-zsh" ];
then
	echo ""
	echo "backing up $HOME/.oh-my-zsh"
	mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh.bak
fi
if ! [ -d "$HOME/.oh-my-zsh" ];
then
	echo ""
	echo "loading default oh-my-zsh"
	ln -s "$path/zsh/oh-my-zsh" $HOME/.oh-my-zsh
fi

if [ -f "$HOME/.gitconfig" ] && ! [ -L "$HOME/.gitconfig" ];
then
	echo ""
	echo "backing up $HOME/.gitconfig"
	mv $HOME/.gitconfig $HOME/.gitconfig.bak
fi
if ! [ -f "$HOME/.gitconfig" ];
then
	echo ""
	echo "loading default gitconfig"
	ln -s "$path/.gitconfig" $HOME/.gitconfig
fi

if [ -f "$HOME/.gitignore_global" ] && ! [ -L "$HOME/.gitignore_global" ];
then
	echo ""
	echo "backing up $HOME/.gitignore_global"
	mv $HOME/.gitignore_global $HOME/.gitignore_global.bak
fi
if ! [ -f "$HOME/.gitignore_global" ];
then
	echo ""
	echo "loading default gitignore_global"
	ln -s "$path/.gitignore_global" $HOME/.gitignore_global
fi

if [ -f "$HOME/.vimrc" ] && ! [ -L "$HOME/.vimrc" ];
then
	echo ""
	echo "backing up $HOME/.vimrc"
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi
if ! [ -f "$HOME/.vimrc" ];
then
	echo ""
	echo "loading default vimrc"
	ln -s "$path/.vimrc" $HOME/.vimrc
fi

if [ -d "$HOME/.vim" ] && ! [ -L "$HOME/.vim" ];
then
	echo ""
	echo "backing up $HOME/.vim"
	mv $HOME/.vim $HOME/.vim.bak
fi
if ! [ -d "$HOME/.vim" ];
then
	echo ""
	echo "loading default vim"
	ln -s "$path/.vim" $HOME/.vim
fi

echo ""
echo "initializing submodules"
git submodule init
git submodule update
