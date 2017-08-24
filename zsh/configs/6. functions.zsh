goto()      { [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")"; }
du1()       { du -h --max-depth=1 "$@" | sort -k 1,1hr -k 2,2f; }

which() {
  IFS="$(printf '\n\t')"
  printf '\e[?7t'
  builtin which "$@" \
    && builtin type "$@" \
    && whereis "$@" \
    && file $(builtin type "$@" | awk '{print $3}') 2> /dev/null
  printf '\e[?7t'
}

local_ip() {
  ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2
}

weather() {
  w3m -dump wttr.in/kiev
}

function ccd() {
  rm -f $ZPLUG_HOME/zcompdump && rm -f ~/.zcompdump
}