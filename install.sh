

cd ~

rm .bashrc
rm .gitconfig
rm .zshrc
rm .vimrc


ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/bin bin
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/vim .vimrc
ln -s dotfiles/zshrc .zshrc


git config --global user.name "Ivan Pedrazas"
git config --global user.email ipedrazas@gmail.com
git config --global core.editor vim
