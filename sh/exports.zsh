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
export SSH_ENV=$HOME/.ssh/environment

# User configuration
export PATH="/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/Cellar/mysql55/5.5.44/bin:$GOPATH/bin:$HOME/.fastlane/bin:$HOME/.flutterio/bin"

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Elixir Shell History
export ERL_AFLAGS="-kernel shell_history enabled"

# Prevent HomeBrew from auto-updating
export HOMEBREW_NO_AUTO_UPDATE=1

# NVM plugin config
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true # Will run nvm use if .nvmrc found in directory
