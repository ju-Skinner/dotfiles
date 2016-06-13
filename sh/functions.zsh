
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

kill_tmux_usage() {
  echo "Function kill_tmux"
  echo ""
  echo "Takes two keyword arguments: "
  echo "\t--pane_number: The number of the pane to send Ctrl-C to"
  echo "\t--session_name: The name of the TMUX session you want to kill"
  echo ""
  echo "i.e kill_tmux --pane_number=3 --session_name=my_session"
  echo ""
}

kill_tmux() {
  local pane_number session_name
  while getopts ":p:s:h" arg; do 

    case "$arg" in
      h)
          kill_tmux_usage
          exit 1 
          ;;
      p)
          pane_number=$OPTARG >&2
          ;;
      s)
          session_name=$OPTARG >&2
          ;;
      \?)
          echo "ERROR: unknown paramter \"$OPTARG\""
          kill_tmux_usage
          exit 1
          ;;
    esac
  done

  
  if [ "${pane_number}" = "" ]; then
    echo "changing to default pane_number 3"
    pane_number=3
  fi
  
  #echo "PANE_NUMBER: ${pane_number}";
  #echo "SESSION_NAME: ${session_name}";

  if [ "${session_name}" != "" ]; then 
    echo "closing SESSION: ${session_name} and sending Ctrl-C to PANE: ${pane_number}"
    close_session $pane_number $session_name
  else
    echo "closing all running sessions and sending Ctrl-C to PANE: ${pane_number}"
    tmux ls -F '#S' | while read session_name
    do
      echo "current_session: $session_name"
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
