# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

######## My Changes Start Here #################
# My Aliases
alias lkj="cd ~/ProgrammingStuff/my_notes/"
alias oiu="cd ~/workspace/kchida_aws/"

# Following line enables text color when text is piped to 'less'.
# Specify flags to be used with less. -i makes searches case-insensitive when search
# term is all lowercase; otherwise, if there are any cap chars, it will be case-sensitive.
# -R makes less honor raw control chars only for color metadata (i.e. ESC).
export LESS="-iR"

# Switch readline to vi mode instead of emacs
set -o vi

#Environment setup for Django settings
#export DJANGO_SETTINGS_MODULE="${HOME}/workspace/typing/settings.py"
#end Django

#Environment setup for AppEngine
export PATH="/usr/local/lib/google_appengine:$PATH"
#end AppEngine

#Environment setup for Ruby
export PATH="${HOME}/.gem/ruby/1.9.1/bin:$PATH"
#end Ruby

#Environment setup for CINT C REPL
CINTSYSDIR=/opt/cint
PATH=$PATH:$CINTSYSDIR
MANPATH=$MANPATH:$CINTSYSDIR/doc
#LD_LIBRARY_PATH=.:$CINTSYSDIR:$LD_LIBRARY_PATH
LD_LIBRARY_PATH=$CINTSYSDIR/lib:$LD_LIBRARY_PATH
export PATH CINTSYSDIR MANPATH LD_LIBRARY_PATH

#Environment setup for django-mediagenerator
#export PATH="${HOME}/workspace/freeourselves/mediagenerator:$PATH"
#export PATH="/usr/share/yui-compressor:$PATH"
#end django-mediagenerator

#Environment setup for Python
# PYTHONPATH gets appended to system defaults to form sys.path.  go into interactive python and try sys.path, sys.modules.
export PATH="${PATH}:/usr/local/lib:/usr/lib"
#export PYTHONPATH="/usr/local/lib/python2.7/dist-packages"
# /usr/local/lib/python2.7/dist-packages/virtualenvwrapper:/usr/lib/python2.7/dist-packages"
#end Python2.7

#Environment setup for django_debug_toolbar
#export PATH="${HOME}/eclipse/allbuttonspressed/debug_toolbar:$PATH"
#end django_debug_toolbar

#Environment setup for virtualenvwrapper
#/usr/local/bin/python is a symlink to python2.7; that's where the site-packages for virtualenv lives.  I might want to upgrade to 2.7 when i get a chance.
# source = run.  export = make variable available globally. ${VARIABLE_NAME} = value of VARIABLE_NAME and {} are used to separate it from adjacent characters.
#export WORKON_HOME=$HOME/.virtualenvs   # default  
#export PROJECT_HOME=$HOME/workspace
#export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME   # default
#export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME   # default
#override default python interpreter and specify my own
#export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python2.7"
#export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv"
# set virtualenv arg value to --no-site-packages to ensure that all new environments are isolated from the system site-packages directory.
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#source /usr/local/bin/virtualenvwrapper.sh
#end virtualenv
