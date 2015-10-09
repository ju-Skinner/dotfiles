# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname
}

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}


# Directory info.
local current_dir=$'{PWD/#$HOME/~}'

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

CURRENT_TIME_="%{$fg[white]%}{%{$fg[cyan]%}%D %T%{$fg[white]%}}%{$reset_color%}"
# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT='
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} %{$fg[cyan]%}%n %{$fg[white]%}at %{$fg[green]%}$(box_name) %{$fg[white]%}in %{$terminfo[bold]$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%}\
$(git_prompt_info) %{$fg[white]%} %{$terminfo[bold]$fg[red]%} %{$reset_color%}
$CURRENT_TIME_ $fg[yellow][%{$(rvm_current || rbenv_version)%}] %{$terminfo[bold]$fg[cyan]%}$ %{$reset_color%}'


if [[ "$(whoami)" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
fi
