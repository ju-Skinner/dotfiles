/*
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Generates colored output.
function special_echo {
  echo -e '\E[0;32m'"$1\033[0m"
}

special_echo "Install Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
brew install wget
brew tap homebrew/services
brew install iterm2
brew install vim --override-system-vim
brew install rbenv ruby-build rbenv-default-gems rbenv-use
brew install tmux
brew install the_silver_searcher
brew install python
brew install mysql
brew install reattach-to-user-namespace

pip install powerline-status
pip install psutil


special_echo "Install Oh-My-Zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

special_echo "Setting up $HOME/.zshrc"
echo "source $DIR/zshrc" >> $HOME/.zshrc

special_echo "Settting up $HOME/.tmux.conf"
echo "tmux source-file $DIR/tmux.conf" > $HOME/.tmux.conf

echo "Overwriting up $HOME/.gitconfig"
echo -e "[include]\n  path = $DIR/_gitconfig" > $HOME/.gitconfig

echo "Configuring global gitignore file"
git config --global core.excludesfile $DIR/gitignore

echo "Setting $HOME/.vim to link to $DIR/_vim directory"
ln -s $DIR/.vim $HOME/.vim

echo "Linking Custom Oh My Zsh themes "
rm -rf ~/.oh-my-zsh/custom/themes
ln -s ~/dotfiles/.oh-my-zsh/custom/themes
*/
