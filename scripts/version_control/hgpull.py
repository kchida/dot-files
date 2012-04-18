#!/usr/bin/env python

from fabric.api import local, lcd, prompt

local('hg pull && hg update')
