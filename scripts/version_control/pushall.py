#!/usr/bin/env python

from fabric.api import local, lcd, prompt, settings

DIRS=['/home/kchida/workspace/kchida_aws/kchida_aws',
      '/home/kchida/dot-files',
      '/home/kchida/ProgrammingStuff/my_notes']

message = prompt('Enter your commit message: ')
for directory in DIRS:
    with lcd(directory):
        with settings(warn_only=True):
            local('git add -A . && git commit -m "%s" && git push origin' % message)
            local('hg addremove && hg commit -m "%s" -u kchida && hg push' % message)
