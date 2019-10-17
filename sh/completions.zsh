if [ -f ~/.git-completion.sh ]; then
  . ~/.git-completion.sh
fi


if [ -f $HOME/.asdf/completions/asdf.bash ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi
