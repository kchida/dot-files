#!/usr/bin/env python

from fabric.api import local, lcd, prompt, settings

DIRS=['/home/kchida/workspace/kchida_aws/kchida_aws',
      '/home/kchida/dot-files',
      '/home/kchida/ProgrammingStuff/my_notes']

for directory in DIRS:
    with lcd(directory):
        with settings(warn_only=True):
            local('git fetch origin && git merge origin')
            local('hg pull && hg update')
