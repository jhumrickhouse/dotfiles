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
plugins=(git brew npm mvn node pip python virtualenv rvm)

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

# Setup Tomcat
export TOMCAT_HOME=/usr/local/opt/tomcat

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Setup Java
JAVA6_HOME=`/usr/libexec/java_home -v 1.6`
JAVA7_HOME=`/usr/libexec/java_home -v 1.7`
JAVA8_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_HOME=$JAVA7_HOME
export CLASSPATH=".:/Users/joe/lib/java/antlr-4.2.2-complete.jar:$CLASSPATH"

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

# Aliases for working with ANTLR
alias antlr4='java -jar ~/lib/java/antlr-4.2.2-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# Aliases for lauching ipython notebook or Qt console
alias ipn="workon ipy && ipython notebook --pylab=inline"
alias ipq="workon ipy && ipython qtconsole --pylab=inline"
