# Currently this path is appended to dynamically when picking a ruby version
# zshenv has already started PATH with rbenv so append only here
#export PATH=$PATH~/bin:/usr/local/bin:/usr/local/sbin:~/bin

# Change the timeout when change modes
export KEYTIMEOUT=1

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

 # ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

SSH_ENV=$HOME/.ssh/environment

eval "$(rbenv init -)"

# GO lang
export GOPATH=$HOME/_dev/go
export GOROOT=/usr/local/Cellar/go/1.7.3/libexec

# ssh-add ~/.ssh/id_rsa

# User configuration
export PATH="~/.rbenv/shims:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/Cellar/mysql55/5.5.44/bin:$GOPATH/bin:$PATH"

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

export NVM_DIR="/Users/jules/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
