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
export ADDON_PATH="/opt/homebrew/bin:/opt/homebrew/opt/postgresql@15/bin:$GOPATH/bin:$HOME/.fastlane/bin:$HOME/.flutterio/bin"
export PATH="$ADDON_PATH:$PATH"

# Prevent HomeBrew from auto-updating
export HOMEBREW_NO_AUTO_UPDATE=1

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# Node (Kajabi)
export NODE_OPTIONS="--max-old-space-size=8192"
