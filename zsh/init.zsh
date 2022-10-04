# Initial tasks to run on window boot up.
init() {
  exec_tmux
  curwin
  enable_bash_rematch
  [[ $CURSOR_TYPE == "ibeam" ]] && i_beam_cursor
}

# Info about current terminal window and other things.
curwin() {
  hline=""
  for i in {0..55}; do
    hline+="\u2500"
  done

  [[ $SHELL == "/bin/zsh" ]] && setopt local_options BASH_REMATCH

  num_cores=$(system_profiler SPHardwareDataType | grep Cores)
  num_cores=$([[ $num_cores =~ ([[:digit:]]+) ]] && echo ${BASH_REMATCH[1]})

  echo "\x1B[38;2;102;222;237m\u2192\x1B[0m \x1B[38;2;227;135;255mUser\x1B[0m:        \x1B[38;2;255;213;135m$(whoami)\x1B[0m"
  echo "\x1B[38;2;102;222;237m\u2192\x1B[0m \x1B[38;2;227;135;255mOS Type\x1B[0m:     \x1B[38;2;255;213;135m$OSTYPE\x1B[0m"
  echo "\x1B[38;2;102;222;237m\u2192\x1B[0m \x1B[38;2;227;135;255mTerminal\x1B[0m:    \x1B[38;2;255;213;135m$(tty)\x1B[0m"
  echo "\x1B[38;2;102;222;237m\u2192\x1B[0m \x1B[38;2;227;135;255mShell\x1B[0m:       \x1B[38;2;255;213;135m$SHELL\x1B[0m"
  echo "\x1B[38;2;102;222;237m\u2192\x1B[0m \x1B[38;2;227;135;255mTmux\x1B[0m:        $([ ! -z "$TMUX" ] && echo "\x1B[38;2;149;199;111mrunning...\x1B[0m" || echo "\x1B[31mnot found...\x1B[0m")"
  #echo "\x1B[38;2;102;222;237m\u2192\x1B[0m \x1B[38;2;227;135;255mLocal IP\x1B[0m:    $(locipdev)"
  echo "\x1B[38;2;102;222;237m\u2192\x1B[0m \x1B[38;2;227;135;255mTotal Cores\x1B[0m: \x1B[38;2;255;110;122m$num_cores\x1B[0m"
  echo 
}

# Boot tmux if tmux exists and is not running.
exec_tmux() {
  which tmux &> /dev/null && \
    [ -n "$PS1" ] && \
    [[ ! "$TERM" =~ screen ]] && \
    [[ ! "$TERM" =~ tmux ]] && \
    [ -z "$TMUX" ] && \
    exec tmux
}

function time-zsh() {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}


vi_mode() {
  set -o vi
}

i_beam_cursor() {
  printf '\033[6 q'
}

print_todos() {
  [[ -f $TODOS ]] && cat $TODOS
}

enable_bash_rematch() {
  setopt BASH_REMATCH
}
