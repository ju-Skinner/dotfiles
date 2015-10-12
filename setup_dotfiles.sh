/*
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generates colored output.
function special_echo {
  echo -e '\E[0;32m'"$1\033[0m"
}

special_echo "Setting up $HOME/.zshrc"
echo "source $DIR/zshrc" >> $HOME/.zshrc

special_echo "Settting up $HOME/.tmux.conf"
echo "tmux source-file $DIR/tmux.conf" > $HOME/.tmux.conf

echo "Configuring global gitignore file"
git config --global core.excludesfile $DIR/gitignore

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Setting $HOME/.vim to link to $DIR/_vim directory"
ln -s $DIR/.vim $HOME/.vim

echo "Bundle vim plugins"
vim +PluginInstall +qall
*/
