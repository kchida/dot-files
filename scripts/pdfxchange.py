#!/usr/bin/env python

import subprocess

cmd = 'schroot -p --chroot=precise_i386 /usr/bin/wine ~/.wine/drive_c/Program\
\ Files/Tracker\ Software/PDF\ Viewer/PDFXCview.exe'

subprocess.call(cmd, shell=True, stdout=subprocess.PIPE,
                stdin=subprocess.PIPE, stderr=subprocess.PIPE)

