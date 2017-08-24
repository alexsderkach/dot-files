typeset -Ag abbrevs
abbrevs=(
  '...' '../..'
  '....' '../../..'
  'BG' '& exit'
  'C' '| wc -l'
  'G' '|& grep --color=auto'
  'H' '| head'
  'L' '| less'
  'LL' '|& less -r'
  'N' '&>/dev/null'
  'R' '| tr A-z N-za-m'
  'SL' '| sort | less'
  'S' '| sort -u'
  'T' '| tail'    
  'co' "./configure && make && sudo make install"
  'CH' "./configure --help"
  'lad' $'ls -d .*(/)'                # only show dot-directories
  'lsa' $'ls -a .*(.)'                # only show dot-files
  'lss' $'ls -l *(s,S,t)'             # only files with setgid/setuid/sticky flag
  'lsl' $'ls -l *(@[1,10])'           # only symlinks
  'lsx' $'ls -l *(*[1,10])'           # only executables
  'lsw' $'ls -ld *(R,W,X.^ND/)'       # world-{readable,writable,executable} files
  'lsbig' $'ls -flh *(.OL[1,10])'     # display the biggest files
  'lsd' $'ls -d *(/)'                 # only show directories
  'lse' $'ls -d *(/^F)'               # only show empty directories
  'lsnew' $'ls -rl *(D.om[1,10])'     # display the newest files
  'lsold' $'ls -rtlh *(D.om[-11,-1])' # display the oldest files
  'lssmall' $'ls -Srl *(.oL[1,10])'   # display the smallest files
  'rw-' 'chmod 600'
  '600' 'chmod u+rw-x,g-rwx,o-rwx'
  'rwx' 'chmod u+rwx'
  '700' 'chmod u+rwx,g-rwx,o-rwx'
  'r--' 'chmod u+r-wx,g-rwx,o-rwx'
  '644' $'chmod u+rw-x,g+r-wx,o+r-wx'
  '755' 'chmod u+rwx,g+r-w+x,o+r-w+x'
  'md' 'mkdir -p '
  'cx' 'chmod +x'
  'e'  'print -l'
)

for abbr in ${(k)abbrevs}; do 
  alias -g $abbr="${abbrevs[$abbr]}"
done

abbrev_expand() {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[-:_a-zA-Z0-9]#}
  LBUFFER+=${abbrevs[$MATCH]:-$MATCH}
  zle self-insert
}

no_abbrev_expand() {
  LBUFFER+=' '
}

zle -N abbrev_expand
zle -N no_abbrev_expand

bindkey " "   abbrev_expand
bindkey "^x " no_abbrev_expand

abbrevs() {
  for abbr in ${(ok)abbrevs}; do 
    printf "%-20s: %s" $abbr ${abbrevs[$abbr]}
    print -l $reset_color
  done
}
