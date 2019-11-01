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
plugins=(bower brew git go golang gpg lein mvn node npm pip python rvm vagrant virtualenv)

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

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Setup Java
JAVA8_HOME=`/usr/libexec/java_home -v 1.8`
JAVA13_HOME=`/usr/libexec/java_home -v 13`
export JAVA_HOME=$JAVA13_HOME

#Setup Tomcat
export TOMCAT_HOME=$HOME/opt/tomcat9

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

# Aliases for switching java
alias use-java8="export JAVA_HOME=$JAVA8_HOME"
alias use-java13="export JAVA_HOME=$JAVA13_HOME"
