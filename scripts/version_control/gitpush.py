#!/usr/bin/env python

from fabric.api import local, lcd, prompt

message = prompt('Enter your commit message: ')
local('git add -A . && git commit -m "%s" && git push origin' % message)
