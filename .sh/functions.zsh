
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

kill_tmux() {
  pane_number=3
  if [ $1 ]; then
    pane_number=$1
  fi
  
  if [ $2 ]; then 
    echo '$2'
    close_session $2
  else
    tmux ls -F '#S' | while read session_name
    do
      close_session $pane_number $session_name 
    done
  fi
}

close_session() {
    pane_number=$1
    session_name=$2
    count=`tmux list-windows -t $session_name | wc -l`

    for (( i=1; i <= $count; ++i ))
    do
      tmux select-window -t $session_name:$i
      tmux select-pane -t $session.$pane_number
      tmux send-keys -t $session_name C-c
    done

    sleep 5
    tmux kill-session -t $session_name
}

list_colors() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}
