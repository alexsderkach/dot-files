# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

# Global aliases for often used commands in the command line.
alias -g E='2>&1'
alias -g L='E | less'
alias -g N='/dev/null'
alias -g G='| grep'
alias -g S='| sort'
alias -g U='| uniq'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| column -t'

alias bell=print '\a'

alias fd='find . -type d -name'
alias ff='find . -type f -name'

# Show history
alias history='fc -l 1'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# some ls aliases
alias l="ls --group-directories-first -lah ${colorflag}"
alias la="ls --group-directories-first -AF ${colorflag}"
alias ll="ls --group-directories-first -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

alias afind='ack-grep -il'

alias t1='tmux attach -t 0'
alias t2='tmux attach -t 1'
alias t3='tmux attach -t 2'

# note: for multiple -n arguments, the last one will take precedence. so we can
# do this without losing functionality.
alias tail='tail -n 10 '

alias q!='kill -9 $$'
alias :q='exit'
alias die='kill -9 $$'
alias gt='git tag | sort'
alias wget='wget --no-check-certificate -U=Mozilla'

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

eval $(thefuck --alias)

alias vim="nvim"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

