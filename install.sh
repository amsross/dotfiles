echo "" >> ~/.bashrc
echo "source $(pwd)/dotfiles.sh" >> ~/.bashrc

mv ~/.gitconfig ~/.gitconfig.bak
ln -s $(pwd)/.gitconfig ~/.gitconfig

mv ~/.vimrc ~/.vimrc.bak
ln -s $(pwd)/.vimrc ~/.vimrc

mv ~/.vim ~/.vim.bak
ln -s $(pwd)/.vim ~/.vim

git submodule update

