unsetopt menu_complete
setopt auto_menu complete_in_word always_to_end

zmodload -i zsh/complist

autoload -U compinit
compinit -i

# completion stuff
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $ZSH_TMP_DIR/cache

# for everything
zstyle ':completion:*'                       accept-exact      '*(N)'
zstyle ':completion:*'                       list-dirs-first   true
zstyle ':completion:*'                       menu select=1 _complete _ignored _approximate
zstyle ':completion:*'                       select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*'                       separate-sections 'yes'
zstyle ':completion:*'                       squeeze-slashes   false
zstyle ':completion:*'                       use-perl          1
zstyle ':completion:*:(all-|)files'          ignored-patterns '*.un~'
zstyle ':completion:*:functions'             ignored-patterns '_*'
zstyle ':completion:most-accessed-file:*'    completer        _files
zstyle ':completion:most-accessed-file:*'    file-patterns    '*:all\ files'
zstyle ':completion:most-accessed-file:*'    file-sort        access
zstyle ':completion:most-accessed-file:*'    hidden           all
zstyle ':completion:most-accessed-file:*'    match-original   both

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:*' max-errors 3
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' auto-description '%d'

# match uppercase from lowercase, and left-side substrings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+l:|=*'

# command completion: highlight matching part of command, and 
zstyle -e ':completion:*:-command-:*:commands' list-colors 'reply=( '\''=(#b)('\''$words[CURRENT]'\''|)*-- #(*)=0=38;5;45=38;5;136'\'' '\''=(#b)('\''$words[CURRENT]'\''|)*=0=38;5;45'\'' )'

# This is needed to workaround a bug in _setup:12, causing almost 2 seconds delay for bigger LS_COLORS
# UPDATE: not sure if this is required anymore, with the -command- style above.. keeping it here just to be sure
zstyle ':completion:*:*:-command-:*' list-colors ''

# use LS_COLORS for file coloring
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# generic, highlight matched part
# WACKY behavior with zstyle precedence, not using this for now!
# zstyle -e ':completion:*' list-colors '[[ -z $words[CURRENT] ]] && return 1; reply=( '\''=(#b)('\''$words[CURRENT]'\'')*=0=38;5;45'\'' )'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# show command short descriptions, too
zstyle ':completion:*' extra-verbose yes
# make them a little less short, after all (mostly adds -l option to the whatis calll)
zstyle ':completion:*:command-descriptions' command '_call_whatis -l -s 1 -r .\*; _call_whatis -l -s 6 -r .\* 2>/dev/null'

# for sudo kill, show all processes except childs of kthreadd (ie, kernel
# threads), which is assumed to be PID 2. otherwise, show user processes only.
zstyle -e ':completion:*:*:kill:*:processes' command '[[ $BUFFER == sudo* ]] && reply=( "ps --forest -p 2 --ppid 2 --deselect -o pid,user,cmd" ) || reply=( ps x --forest -o pid,cmd )'
zstyle ':completion:*:processes-names' command 'ps axho command' 

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort

zstyle ':completion:*:*:cs:*' file-patterns \
  '*(-/):directories'
zstyle ':completion:*:*:evince(syn|):*' file-patterns \
  '*.(pdf|PDF):pdf\ files *(-/):directories'

zstyle ':completion:*:*:vi(m|):*:*files' ignored-patterns \
  '*?.(aux|dvi|ps|pdf|bbl|toc|lot|lof|o|cm|class?)'

zle -C complete-history complete-word _generic
zstyle ':completion:complete-history:*' completer _history


# cd
zstyle ':completion:*:(cd):*'           group-order 'named-directories'
zstyle ':completion:*:(cd):*'           ignore-parents parent pwd
zstyle ':completion:*:*:(cd):*'         completer _history
zstyle ':completion:*:*:(cd):*'         menu select auto
zstyle ':completion:*:cd:*'             ignored-patterns '(*/)#lost+found'

# vim
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' file-sort name
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' tag-order files
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*:*files' \
  ignored-patterns '*~|*.(old|bak|zwc|viminfo|rxvt-*|zcompdump)|pm_to_blib|cover_db|blib' \
  file-sort modification


() {

    local -a coreutils
    coreutils=(
        # /bin
        cat chgrp chmod chown cp date dd df dir ln ls mkdir mknod mv readlink
        rm rmdir vdir sleep stty sync touch uname mktemp
        # /usr/bin
        install hostid nice who users pinky stdbuf base64 basename chcon cksum
        comm csplit cut dircolors dirname du env expand factor fmt fold groups
        head id join link logname md5sum mkfifo nl nproc nohup od paste pathchk
        pr printenv ptx runcon seq sha1sum sha224sum sha256sum sha384sum
        sha512sum shred shuf sort split stat sum tac tail tee timeout tr
        truncate tsort tty unexpand uniq unlink wc whoami yes arch touch
    )

    for i in $coreutils; do
        (( $+_comps[$i] )) || compdef _gnu_generic $i 
    done

}
