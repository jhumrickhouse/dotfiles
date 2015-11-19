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

# Set Tomcat home
export TOMCAT_HOME=$HOME/opt/tomcat7

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Setup Java
JAVA6_HOME=`/usr/libexec/java_home -v 1.6`
JAVA7_HOME=`/usr/libexec/java_home -v 1.7`
JAVA8_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_HOME=$JAVA8_HOME

# Setup ANTLR
ANTLR_VERSION="4.4"
export CLASSPATH=".:/Users/joe/lib/java/antlr-$ANTLR_VERSION-complete.jar:$CLASSPATH"

# Setup RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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

# Create java scratch project
alias java-scratch="mvn archetype:generate -DgroupId=com.foo -DartifactId=scratch -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false"

# Aliases for working with ANTLR
alias antlr4="java -jar ~/lib/java/antlr-$ANTLR_VERSION-complete.jar"
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# Aliases for switching java
alias use-java6="export JAVA_HOME=$JAVA6_HOME"
alias use-java7="export JAVA_HOME=$JAVA7_HOME"
alias use-java8="export JAVA_HOME=$JAVA8_HOME"
