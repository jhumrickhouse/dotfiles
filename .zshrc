autoload -Uz vcs_info
setopt prompt_subst
precmd () { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr "%{${fg[green]}%}${PRCH[circle]}"
zstyle ':vcs_info:*' unstagedstr "%{${fg[yellow]}%}${PRCH[circle]}"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '(%b%c%u) '

CLICOLOR=1
export LSCOLORS=ExGxFxDxCxegedabagacad

PROMPT='%#:${vcs_info_msg_0_}%1~/ '

JAVA_HOME=$(/usr/libexec/java_home -v 16)

export PATH=~/bin:/usr/local/smlnj/bin:/usr/local/sbin:"$PATH"

# Aliases
alias ls="ls -G"

# alias e="emacsclient -t"
# alias kill-emacs="emacsclient -e \"(kill-emacs)\""
alias e="emacs -nw"

# Brew update and show outdated
alias bu="brew update && brew outdated"

# Pretty print json from pasteboard
alias jsonp="pbpaste | python -mjson.tool"

# Serve directory
alias pserve="python -m SimpleHTTPServer"
