zmodload zsh/zprof

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#Exports
source ~/dotfiles/sh/exports.zsh

#alias
source ~/dotfiles/sh/alias.zsh

#functions
source ~/dotfiles/sh/functions.zsh

# Source powerline-status zsh file
source /usr/local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="j-sonicradish"
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true

# Change the Custom Folder to this repo
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh/custom

# Example aliases
# alias zshconfig="atom ~/.zshrc"
# alias ohmyzsh="atom ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(evalcache git ruby vscode zsh-syntax-highlighting zsh-autosuggestions zsh-nvm gitfast)

export PATH="$HOME/.rbenv/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# ssh-add -K $HOME/.ssh/ju-skinner
ssh-add --apple-use-keychain $HOME/.ssh/ju-skinner

# User configuration

## completions
source $HOME/dotfiles/sh/completions.zsh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# load tmux
#tmux

eval "$(rbenv init - zsh)"
_evalcache hub alias -s

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
