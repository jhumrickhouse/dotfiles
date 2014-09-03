###############################################################################
# 
# Shell setup
#
###############################################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Use my theme
ZSH_THEME="joe"

# Disable changing directories without cd command
unsetopt AUTO_CD

# Load plugins
plugins=(git brew npm mvn node pip python virtualenv rvm vagrant lein)

source $ZSH/oh-my-zsh.sh

###############################################################################
#
# Environment variables
#
###############################################################################

# Help solarized display colors correctly
export TERM=xterm-16color

# Prefer HOME and local bins over system ones
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH

# Include tex in path
export PATH=$PATH:/usr/local/texlive/2013basic/bin/x86_64-darwin

# Use Emacs
export EDITOR='emacs'
export ALTERNATE_EDITOR=""

# Setup Oracle
export ORACLE_HOME=/usr/local/lib/oracle/instantclient_11_2
export DYLD_LIBRARY_PATH=$ORACLE_HOME:$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH
export TNS_ADMIN=$ORACLE_HOME/network/admin

# Set Tomcat home
export TOMCAT_HOME=/usr/local/opt/tomcat7

# setup Felix home (convenience for run alias below)
export MY_FELIX_HOME=$HOME/opt/felix-framework-4.4.1

# setup Karaf home (use MY prefix since Karaf ignores preset KARAF_HOME)
export MY_KARAF2_HOME=$HOME/opt/apache-karaf-2.3.5
export MY_KARAF3_HOME=$HOME/opt/apache-karaf-3.0.1
export MY_KARAF_HOME=$MY_KARAF3_HOME

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# export LDFLAGS="-L/usr/X11/lib"
# export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2 -I/usr/X11/include/libpng12"

# Setup Go
export GOROOT=`go env GOROOT`
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Setup Java
JAVA6_HOME=`/usr/libexec/java_home -v 1.6`
JAVA7_HOME=`/usr/libexec/java_home -v 1.7`
JAVA8_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_HOME=$JAVA7_HOME

# Setup ANTLR
ANTLR_VERSION="4.4"
export CLASSPATH=".:/Users/joe/lib/java/antlr-$ANTLR_VERSION-complete.jar:$CLASSPATH"

# Setup RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Setup Virtualenvwrapper
export WORKON_HOME=~/lib/python-envs
source /usr/local/bin/virtualenvwrapper.sh

###############################################################################
#
# Aliases
#
###############################################################################

# alias e="emacsclient -t"
# alias kill-emacs="emacsclient -e \"(kill-emacs)\""
alias e="emacs -nw"

# Brew update and show outdated
alias bu="brew update && brew outdated"

# Pretty print json from pasteboard
alias jsonp="pbpaste | python -mjson.tool"

# Aliases for working with ANTLR
alias antlr4="java -jar ~/lib/java/antlr-$ANTLR_VERSION-complete.jar"
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# Aliases for lauching ipython notebook or Qt console
alias ipn="workon ipy && ipython notebook --pylab=inline"
alias ipq="workon ipy && ipython qtconsole --pylab=inline"

# Aliases for switching java
alias use-java6="export JAVA_HOME=$JAVA6_HOME"
alias use-java7="export JAVA_HOME=$JAVA7_HOME"
alias use-java8="export JAVA_HOME=$JAVA8_HOME"

# Alias for starting Felix
alias felix="pushd $MY_FELIX_HOME && java -jar $MY_FELIX_HOME/bin/felix.jar"

# Alias for starting Karaf
alias karaf2="pushd $MY_KARAF2_HOME && $MY_KARAF2_HOME/bin/karaf"
alias karaf3="pushd $MY_KARAF_HOME && $MY_KARAF_HOME/bin/karaf"
alias karaf="karaf3"
alias karaf2d="pushd $MY_KARAF2_HOME && $MY_KARAF2_HOME/bin/karaf debug"
alias karaf3d="pushd $MY_KARAF_HOME && $MY_KARAF_HOME/bin/karaf debug"
alias karafd="karaf3"
