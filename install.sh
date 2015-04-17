echo "" >> ~/.bashrc
echo "source $(pwd)/dotfiles.sh" >> ~/.bashrc

if [ ! -f "$HOME/.gitconfig" ];
then
	echo ""
	echo "backing up ~/.gitconfig"
	mv ~/.gitconfig ~/.gitconfig.bak
fi

if [ ! -f "$HOME/.vimrc" ];
then
	echo ""
	echo "backing up ~/.vimrc"
	mv ~/.vimrc ~/.vimrc.bak
fi

if [ ! -d "$HOME/.vim" ];
then
	echo ""
	echo "backing up ~/.vim"
	mv ~/.vim ~/.vim.bak
fi

echo ""
echo "initializing submodules"
git submodule init
git submodule update

echo ""
echo "reloading bash"
source ~/.bashrc

