c = get_config()
app = c.InteractiveShellApp

# This can be used at any point in a config file to load a sub config
# and merge it into the current one.
#load_subconfig('ipython_config.py', profile='default')

c.PromptManager.in_template = r'{color.LightGreen}\u@\h{color.LightBlue}[{color.LightCyan}\Y1{color.LightBlue}]{color.Green}|\#> '
c.PromptManager.in2_template = r'{color.Green}|{color.LightGreen}\D{color.Green}> '
c.PromptManager.out_template = r'<\#> '

c.PromptManager.justify = True

c.InteractiveShell.color_info=True
c.InteractiveShell.deep_reload=True
c.InteractiveShell.separate_in = ''
c.InteractiveShell.separate_out = ''
c.InteractiveShell.separate_out2 = ''
c.InteractiveShell.use_readline=True

c.PrefilterManager.multi_line_specials = True

lines = """
%rehashx
import getpass
import hashlib
import json
import logging
import os
import random
import re
import sys
import urllib
import urllib2

from collections import OrderedDict, deque
from copy import deepcopy
from datetime import datetime as _datetime
from os import chdir, chmod, curdir, getcwdu, listdir, makedirs, mkdir, rename, remove, symlink
from os.path import abspath, basename, dirname, isdir, isfile, join
from shutil import copy, copy2, copyfile, copytree, rmtree
from subprocess import call, check_call, check_output, CalledProcessError, Popen, PIPE

import requests
from requests.auth import HTTPBasicAuth
"""

# You have to make sure that attributes that are containers already
# exist before using them.  Simple assigning a new list will override
# all previous values.
if hasattr(app, 'exec_lines'):
    app.exec_lines.append(lines)
else:
    app.exec_lines = [lines]
