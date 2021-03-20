export TERM=xterm-color
export PATH=${PATH}:/usr/sbin/:~/bin/
export MANPATH=${MANPATH:-}:/usr/local/man
export HISTFILESIZE=100000
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
alias fix='echo -e "\033c" && reset'

# via http://ezprompt.net/
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo " [${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\u@\h:\W\`parse_git_branch\`\\$ "
#export PS1=$'\[\e]2;[bash]   \h::\]$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\][\u@\h \W]\$ '

export LESS="-R"
export EDITOR=vim
export HISTCONTROL=ignoredups

# Turn on advanced bash completion if the file exists
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

### Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# Newer sqlite
export PATH=/usr/local/opt/sqlite/bin:$PATH

# Setup environment for virtualenv
# NOPE NOPE NOPE NOPE
# test -f ~/.virtualenvwrapperrc && source ~/.virtualenvwrapperrc

# emscripten tools
# source ~/code/emsdk_portable/emsdk_env.sh &> /dev/null

# ARM embedded gcc toolchain location
#export ARMGCC_DIR=/opt/gcc-arm-none-eabi-6-2017-q2-update

# AVR compiler
#export PATH=$PATH:/usr/local/CrossPack-AVR/bin

# rust-lang pacckage manager
export PATH=~/.cargo/bin:$PATH

# Python bin path
export PATH=$PATH:~/Library/Python/3.8/bin
#export PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin

# Run stuff from NPM without installing it globally
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

# Used by zephyr, among others
#export GNUARMEMB_TOOLCHAIN_PATH=/usr/local/gcc-arm-none-eabi-8-2019-q3-update

export PATH=$PATH:/Users/riggs/.nexustools

# vim: set ts=8 sw=4 tw=0 et filetype=sh :
