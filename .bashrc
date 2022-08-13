# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:erasedups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=100000

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF --group-directories-first --color=always' #KLC: added 'dirs first'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

######################### 
# My Changes Start Here #
######################### 

# Unmap Ctrl-s for vim-ipython plugin; see the docs for more info.
stty stop undef

# My Aliases
alias lkj="cd ~/repos/git"

# Opens multiple files in tabs
alias vim="vim -p"
#Moving around made easy
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Following line enables text color when text is piped to 'less'.
# Specify flags to be used with less. -i makes searches case-insensitive when search
# term is all lowercase; otherwise, if there are any cap chars, it will be case-sensitive.
# -R makes less honor raw control chars only for color metadata (i.e. ESC).
export LESS="-iR"

# Color for manpages in less:
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Switch readline to vi mode instead of emacs
set -o vi

#Environment setup for AppEngine
export PATH="/usr/local/lib/google_appengine:$PATH"

#Environment setup for Ruby
export PATH="${HOME}/.gem/ruby/1.9.1/bin:$PATH"

#Environment setup for Ruby
export PATH="${HOME}/bin:$PATH"

#Environment setup for Python
#export PATH="${PATH}:/usr/local/lib:/usr/lib"

#Enable tab completion of hostnames (useful for ssh)
export HOSTFILE="${HOME}/.hosts"

#Vim is default editor
export EDITOR="vim"
export VISUAL="vim"

# Personal Golang stuff
if [ ! -f /usr/lib/google-golang/bin/go ]; then
    export GOPATH="${HOME}/gohome"
    export PATH="${PATH}:${GOPATH}/bin"
fi

#Allow golang vim plugin discovery
if [ -f /usr/lib/google-golang/bin/go ]; then
    export GOROOT4VIM="$(/usr/lib/google-golang/bin/go env GOROOT)"
elif [ -f /opt/local/bin/go ]; then
    export GOROOT4VIM="$(/opt/local/bin/go env GOROOT)"
elif [ -f /usr/local/go/bin/go ]; then
    export GOROOT4VIM="$(/usr/local/go/bin/go env GOROOT)"
else
    export GOROOT4VIM="$(/usr/local/bin/go env GOROOT)"
fi

#Show git branch
source "${HOME}/.git-completion.bash"
PS1=$PS1'$(__git_ps1)\$ '

# Append work-specific things here
source ${HOME}/.bashrc_google

### Functions ###
function set_union () {
    if [[ ! -f "$1" ]] || [[ ! -f "$2" ]]; then
        echo "ERROR: files do not exist" && return 1
    fi
    echo $(cat "$1" "$2" |sort |uniq)
}
function set_intersect () {
    if [[ ! -f "$1" ]] || [[ ! -f "$2" ]]; then
        echo "ERROR: files do not exist" && return 1
    fi
    echo $(cat "$1" "$2" |sort |uniq -d)
}
function set_diff () {
    if [[ ! -f "$1" ]] || [[ ! -f "$2" ]]; then
        echo "ERROR: files do not exist" && return 1
    fi
    echo $(cat "$1" "$2" |sort |uniq -u)
}
#End sentinel

