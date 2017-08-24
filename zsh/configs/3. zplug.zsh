export ZPLUG_HOME=$ZSH_TMP_DIR/zplug

if [[ ! -d "${ZPLUG_HOME}" ]]; then
	git clone https://github.com/zplug/zplug "${ZPLUG_HOME}"
	source "${ZPLUG_HOME}/init.zsh" && zplug update --self
else
	source "${ZPLUG_HOME}/init.zsh"
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

zplug "plugins/bgnotify", from:oh-my-zsh

if is_osx;
then
	zplug "plugins/brew-cask", from:oh-my-zsh
	zplug "plugins/osx", from:oh-my-zsh
fi

zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/encode64", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh, defer:2, as:plugin
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/iwhois", from:oh-my-zsh
zplug "plugins/jsontools", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/nmap", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/redis-cli", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zpm-zsh/mysql-colorize"

zplug "trapd00r/LS_COLORS", use:'-'

zplug "Valodim/zsh-_url-httplink"
zplug "Valodim/zsh-curl-completion"

zplug "tcnksm/docker-alias", use:zshrc
zplug "djui/alias-tips"
zplug "mgryszko/jvm"
zplug "lesaint/lesaint-mvn"
zplug "hchbaw/opp.zsh"
zplug "b4b4r07/emoji-cli"
zplug "mafredri/zsh-async"
zplug "Valiev/almostontop"
zplug "kingsj/atom_plugin.zsh"
zplug "hchbaw/auto-fu.zsh"

# Completions
zplug "felixr/docker-zsh-completion"

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    at:0.11.0, \
    as:command, \
    use:"*darwin*amd64*", \
    rename-to:fzf
    
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_DIR=$ZSH_TMP_DIR/enhancd

# Theme
# zplug "themes/obraun", from:oh-my-zsh
zplug "carloscuesta/materialshell", use:"zsh/materialshell.zsh-theme"


if ! zplug check --verbose; then
	zplug install
fi

zplug load