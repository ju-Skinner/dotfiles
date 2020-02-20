/*
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Generates colored output.
function special_echo {
  echo -e '\E[0;32m'"$1\033[0m"
}

special_echo "Install Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# BREW
brew update

# GIT
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

# NODE
brew install node

# Elixir
brew install elixir
brew install erlang
brew install fwup squashfs coreutils # Nerves Project

# VIM / TMUX Status bar
pip install powerline-status
pip install psutil

# Z
brew install z

# WEECHAT
# brew install weechat --with-aspell --with-curl --with-python --with-perl --with-ruby --with-lua --with-guile

special_echo "Install Oh-My-Zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Install Powerline fonts"
~/powerline_fonts/install.sh

echo "Link Powerline config files to homedirectory config folder"
ln -s /usr/local/lib/python2.7/site-packages/powerline/config_files $HOME/.config/powerline

echo "Linking agignore file"
ln -s $DIR/agignore $HOME/.agignore

echo "Linking irbrc file"
ln -s $DIR/irbrc $HOME/.irbrc

echo "Linking pryrc file"
ln -s $DIR/pryrc $HOME/.pryrc

echo "Linking pryrc file"
ln -s $DIR/gemrc $HOME/.gemrc

echo "Linking rbenv default-gems file file"
ln -s $DIR/rbenv/default-gems $HOME/.rbenv/default-gems

# echo "Linking weechat settings"
# ln -sf $DIR/weechat/weechat.conf $HOME/.weechat/weechat.conf
# ln -sf $DIR/weechat/buffers.conf $HOME/.weechat/buffers.conf

special_echo "Setting up $HOME/.zshrc"
echo "source $DIR/zshrc" >> $HOME/.zshrc

special_echo "Settting up $HOME/.tmux.conf"
echo "source $DIR/tmux.conf" > $HOME/.tmux.conf

echo "Overwriting up $HOME/.gitconfig"
echo -e "[include]\n  path = $DIR/_gitconfig" > $HOME/.gitconfig

echo "Configuring global gitignore file"
git config --global core.excludesfile $DIR/gitignore

echo "Setting $HOME/.vim to link to $DIR/_vim directory"
ln -s $DIR/vim $HOME/.vim

echo "Installing NVM for Node"
ruby -e "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh)"

echo "Installing Node lastest"
nvm install 7.5

echo "Installing ZSH Syntax Highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
*/
