path="$HOME/dotfiles"

if ! grep -q "source $path/dotfiles.sh" $HOME/.bashrc;
then
	echo "" >> $HOME/.bashrc
	echo "linkink bash profile"
	echo "source $path/dotfiles.sh" >> $HOME/.bashrc
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

echo ""
echo "reloading bash"
source $HOME/.bashrc

