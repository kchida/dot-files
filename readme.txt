- Dot files and directories in home folder are soft linked to the actual files in this
repository (i.e., ~/dot-files).

- Just 'cd' into this directory and push changes to bitbucket.

- The .hgrc file in this repo is the actual per-user config file that belongs in $HOME.
  It references a .hgignore file in this repository via an absolute path since .hgrc
  does not support relative paths; therefore, the path to .hgignore is hard coded to
  ~/dot-files/.hgignore.  This should not be problematic as long as the name of this
  repo (and directory) remains the same.

- Likewise, .gitconfig belongs in $HOME but it references the .gitignore_global file
  which is in ~/dot-files/.  Make sure to change .gitconfig if moving this file to
  another machine with different user name.

- xorg files should go into /usr/share/X11/xorg.conf.d/    Make sure the prefix
  numbers are valid with respect of existing .conf files.
