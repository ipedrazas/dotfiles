

cd ~

if [ -f .bashrc ];
then
   rm .bashrc
fi
if [ -f .gitconfig ];
then
   rm .gitconfig
fi
if [ -f .zshrc ];
then
   rm .zshrc
fi
if [ -f .vimrc ];
then
   rm .vimrc
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p  ~/.vim/swaps
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/undos


ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/bin bin
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/vim .vimrc
ln -s dotfiles/zshrc .zshrc


git config --global user.name "Ivan Pedrazas"
git config --global user.email ipedrazas@gmail.com
git config --global core.editor vim

mkdir .irssi
ln -s dotfiles/irssi_config .irssi/config
