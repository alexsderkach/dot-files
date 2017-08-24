# try to load terminfo
# zmodload zsh/terminfo || return 1

# only available for 256 color terminals
if (( $+terminfo[colors] )) && (( $terminfo[colors] == 256 )); then
    # load trapd00r's LS_COLORS things
    eval $( dircolors -b $ZSH_TMP_DIR/zplug/repos/trapd00r/LS_COLORS/LS_COLORS )
fi

autoload -U colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'


export ACK_COLOR_MATCH="cyan bold"
export ACK_COLOR_FILENAME="cyan bold on_black"
export ACK_COLOR_LINENO="bold green"
 
export GREP_COLORS="38;5;230:sl=38;5;137:cs=38;5;100:fn=38;5;238;3;1;48;5;232:ln=38;5;87;3:bn=38;5;232:se=38;5;232;48;5;232:cx=38;5;240:ms=48;5;231;38;5;196;4:mc=38;5;85;1;48;5;232:ne"

