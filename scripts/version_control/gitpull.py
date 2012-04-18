#!/usr/bin/env python

from fabric.api import local, lcd, prompt

local('git fetch origin && git merge origin')
