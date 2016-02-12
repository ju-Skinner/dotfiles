/*
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Generates colored output.
function special_echo {
  echo -e '\E[0;32m'"$1\033[0m"
}

special_echo "Install Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
brew install git-extras
brew install hub
brew install wget
brew tap homebrew/services

# terminal 
brew install iterm2
brew install tmux
brew install vim --override-system-vim
brew install reattach-to-user-namespace
brew install the_silver_searcher

# development
brew install rbenv ruby-build rbenv-default-gems rbenv-use
brew install python
brew install mysql

# Elixir
brew install elixir
brew install erlang

pip install powerline-status
pip install psutil


special_echo "Install Oh-My-Zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Linking Custom Oh My Zsh themes "
rm -rf $ZSH_CUSTOM/themes
ln -s $DIR/.oh-my-zsh/custom/themes $ZSH_CUSTOM/themes

echo "Link Powerline config files to homedirectory config folder"
ln -s /usr/local/lib/python2.7/site-packages/powerline/config_files $HOME/.config/powerline

echo "Linking agignore file"
ln -s $DIR/agignore $HOME/.agignore

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
*/
