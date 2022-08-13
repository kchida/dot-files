# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# pip bash completion start
#_pip_completion()
#{
#    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
#                   COMP_CWORD=$COMP_CWORD \
#                   PIP_AUTO_COMPLETE=1 $1 ) )
#}
#complete -o default -F _pip_completion pip
# pip bash completion end

#########################
# My Changes Start Here #
#########################
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

#function backup () { 
#    newname=$1.`date +%Y%m%d.%H%M.bak`; 
#    mv $1 $newname; 
#    echo "Backed up $1 to $newname."; 
#    cp -p $newname $1;
#}

#Nice to run selected lines through python in EX mode.
#alias py=/usr/bin/python
#export PATH=$PATH:/tmp/mock_etcd/etcd/bin
#export PATH=$PATH:/tmp/mock_etcd/etcdctl/bin
