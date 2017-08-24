# history file is inside $ZSH usually, no more stuff in $HOME than necessary
HISTFILE=$ZSH_TMP_DIR/.zsh_history

# 10k items in history should suffice.
HISTSIZE=10000
SAVEHIST=10000

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*:gs:gd:calc:du1:l:make"

# ignore duplicates
setopt hist_ignore_dups
# incrementally append to history (new sessions get combined history)
setopt append_history inc_append_history
# save timestamps in history
setopt extended_history
# don't save to history if line has a space prefix
setopt hist_ignore_space

setopt \
     append_history         \
  no_extended_history       \
  no_hist_allow_clobber     \
  hist_beep                 \
  no_hist_expire_dups_first \
     hist_find_no_dups      \
     hist_ignore_all_dups   \
     hist_ignore_dups       \
     hist_ignore_space      \
  no_hist_no_functions      \
     hist_no_store          \
  no_hist_reduce_blanks     \
     hist_save_by_copy      \
     hist_save_no_dups      \
  no_hist_subst_pattern     \
  no_hist_verify            \
  no_inc_append_history     \
     share_history          \
  no_csh_junkie_history     


zmodload zsh/terminfo
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down