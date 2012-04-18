#!/usr/bin/env python

from os.path import abspath, dirname, exists, expanduser, join, relpath
from fabric.api import (abort, cd, env, execute, fastprint, get, hide, hosts, lcd,
                        local, open_shell, output, parallel, path, prefix, prompt,
                        put, puts, reboot, require, roles, run, runs_once, serial,
                        settings, show, sudo, task, warn, with_settings)

local('ln -sf ~/dot-files/.bashrc ~/.bashrc')
local('ln -sf ~/dot-files/.profile ~/.profile')
local('ln -sf ~/dot-files/.inputrc ~/.inputrc')
local('ln -sf ~/dot-files/.hgrc ~/.hgrc')
local('ln -sf ~/dot-files/.gitconfig ~/.gitconfig')
local('ln -sf ~/dot-files/.vimrc ~/.vimrc')
if exists(expanduser('~/.vim')):
    local('rm -rf ~/.vim')
local('ln -sf ~/dot-files/.vim ~/.vim')

local('ln -sf ~/dot-files/scripts/version_control/gitpull.py ~/bin/gitpull')
local('ln -sf ~/dot-files/scripts/version_control/gitpush.py ~/bin/gitpush')
local('ln -sf ~/dot-files/scripts/version_control/hgpull.py ~/bin/hgpull')
local('ln -sf ~/dot-files/scripts/version_control/hgpush.py ~/bin/hgpush')
local('ln -sf ~/dot-files/scripts/version_control/pullall.py ~/bin/pullall')
local('ln -sf ~/dot-files/scripts/version_control/pushall.py ~/bin/pushall')
