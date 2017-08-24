# default path
export PATH=\
/usr/local/bin:\
/usr/local/sbin:\
/bin:\
/sbin:\
/usr/bin:\
/usr/sbin:$PATH

# ...
export MANPATH=/usr/local/man:/usr/share/man:$MANPATH

export EDITOR=vi
export GREP_OPTIONS='-I --exclude-dir=".git" --color=auto'

# zsh
export WORDCHARS='*?_.[]~&;!#$%^(){}<>'
export LISTMAX=500
export LISTROWSFIRST=1
export KEYBOARD_HACK=' '
export KEYTIMEOUT=100
export CLICOLOR=1
export REPORTTIME=1
export TIMEFMT=$'%E real | %U user | %S system | %P [%J]'

if is_osx; then
	
	# coreutils
	export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
	export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

	# llvm
	export PATH=/usr/local/opt/llvm/bin:$PATH
	export PATH=/usr/local/opt/llvm/share/llvm:$PATH
	
	# go
	export GOPATH="$HOME/.go/"
	export GOROOT=/usr/local/opt/go/libexec
	export PATH=$PATH:$GOPATH/bin
	export PATH=$PATH:$GOROOT/bin
	
	# java
	jdks=(/Library/Java/JavaVirtualMachines/**/Contents/Home)
	export JAVA_HOME=$jdks[-1]
	export IDEA_JDK=$JAVA_HOME
	export GRADLE_HOME=/usr/local/opt/gradle/libexec
	export CATALINA_HOME=/usr/local/opt/tomcat/libexec
	export GROOVY_HOME=/usr/local/opt/groovy/libexec
fi