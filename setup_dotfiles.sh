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

special_echo "Install Oh-My-Zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# terminal
brew install iterm2
brew install tmux
brew install tmuxinator
brew install vim --override-system-vim
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install fzf  #https://github.com/junegunn/fzf

# development
brew install ruby-build
brew install python3
brew install mysql
brew install coreutils curl asdf

# NODE
brew install node

# VIM / TMUX Status bar
pip install powerline-status
pip install psutil

# TMUX Plugin Manager
# https://github.com/tmux-plugins/tpm#installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Z
brew install z

echo "Unpacking powerline_fonts"
unzip powerline_fonts.zip

echo "Install Powerline fonts"
./powerline_fonts/install.sh

echo "Removing powerline_fonts directory"
rm -rf powerline_fonts

mkdir $HOME/.config

echo "Link Powerline config files to homedirectory config folder"
ln -s $HOME/.pyenv/versions/3.11.5/lib/python3.11/site-packages/powerline/config_files $HOME/.config/powerline

echo "Linking agignore file"
ln -s $DIR/agignore $HOME/.agignore

echo "Linking irbrc file"
ln -s $DIR/irbrc $HOME/.irbrc

echo "Linking pryrc file"
ln -s $DIR/pryrc $HOME/.pryrc

echo "Linking gemrc file"
ln -s $DIR/gemrc $HOME/.gemrc

echo "Linking asdfrc file"
ln -s $DIR/asdfrc $HOME/.asdfrc

echo "Creating Git Template Folder"
mkdir $HOME/.git-template

echo "Configuring global gitignore file"
git config --global core.excludesfile $DIR/gitignore

echo "Setting $HOME/.vim to link to $DIR/_vim directory"
ln -s $DIR/vim $HOME/.vim

echo "Installing NVM for Node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "Installing Node latest"
nvm install --latest-npm

echo "Installing ZSH Spaceship theme"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "Installing ZSH Syntax Highlighting"
brew install zsh-syntax-highlighting

echo "Writing homedir files"


special_echo "Setting up $HOME/.zshrc"
echo "source $DIR/zshrc\n source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

special_echo "Settting up $HOME/.tmux.conf"
echo "source $DIR/tmux.conf" > $HOME/.tmux.conf

special_echo "Overwriting up $HOME/.gitconfig"
$echo -e "[include]\n  path = $DIR/gitconfig" > $HOME/.gitconfig

echo "Installing ZSH AutoSuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Setting up FZF"
$(brew --prefix)/opt/fzf/install
*/
