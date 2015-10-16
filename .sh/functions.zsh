
#[[ -s ~/.zshrc ]] && source ~/.zshrc
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi


dev() { cd ~/_dev/$1; }
_dev() { _files -W ~/_dev -/; }

kill_in_tmux() {
  session_name=$1
  pane_number = $2
  count=`tmux list-windows | wc -l`

  for (( i=1; i <= $count; ++i ))
  do
    tmux select-window -t $session_name:$i
    tmux select-pane -t $session.$pane_number
    tmux send-keys -t $session_name C-c
  done

  tmux kill-session -t $session_name
}
