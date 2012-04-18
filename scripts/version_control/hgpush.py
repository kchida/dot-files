#!/usr/bin/env python

from fabric.api import local, lcd, prompt

message = prompt('Enter your commit message: ')
local('hg addremove && hg commit -m "%s" -u kchida && hg push' % message)
