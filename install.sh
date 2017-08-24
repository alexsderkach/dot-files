#!/bin/sh
run() { echo "$*"; $*; }
DIR="$( cd "$( dirname $0 )" && pwd )"

run ln -sf $DIR/zsh/zshrc.symlink $HOME/.zshrc
run ln -sf $DIR $HOME/.config

# tmux
run ln -sf $DIR/tmux/tmux.conf.symlink $HOME/.tmux.conf