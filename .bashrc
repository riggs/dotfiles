export TERM=xterm-color
export PATH=${PATH}:/usr/sbin/:~/bin/
export MANPATH=${MANPATH:-}:/usr/local/man
export CLICOLOR=1
export PYTHONSTARTUP=~/.pythonrc.py
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
#alias ls='ls --color=auto' # For linux, etc

# ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
#export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors, uses vars in .bashrc_non-interactive

pkill () { kill `ps -axo pid,command,args | grep -i $1 | awk '{ print $1 }' | tr '\n' ' '`; }
mvim () 
{ 
    opts=;
    files=;
    for arg in "$@";
    do
        case $arg in 
            -* | +*)
                opts="$opts $arg"
            ;;
            *)
                files="$files $arg"
            ;;
        esac;
    done;
    if [ "$files" ]; then
        files="--remote-tab-wait-silent $files";
    fi
    `which mvim` --servername VIM $opts $files &
}

alias ..='cd ..'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lah'
alias ssy='ssh -Y'
alias tar=/usr/bin/tar
alias top='top -o cpu'
PS1=$'\[\e]2;[bash]   \h::\]$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\][\u@\h \W]\$ '

export LESS="-R"
export EDITOR=vim
export HISTCONTROL=ignoredups

# Bash Directory Bookmarks
alias m1='alias g1="cd `pwd`"'
alias m2='alias g2="cd `pwd`"'
alias m3='alias g3="cd `pwd`"'
alias m4='alias g4="cd `pwd`"'
alias m5='alias g5="cd `pwd`"'
alias m6='alias g6="cd `pwd`"'
alias m7='alias g7="cd `pwd`"'
alias m8='alias g8="cd `pwd`"'
alias m9='alias g9="cd `pwd`"'
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'
alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias m"|sed "s/alias //"'
touch ~/.bookmarks
source ~/.bookmarks

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setup environment for virtualenv
# NOPE NOPE NOPE NOPE
# test -f ~/.virtualenvwrapperrc && source ~/.virtualenvwrapperrc

# Updated PATH environment variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH


# vim: set ts=8 sw=4 tw=0 et filetype=sh :
