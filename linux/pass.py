#!/usr/bin/python

from crypt import *
from getpass import getpass
from tempfile import NamedTemporaryFile as NTF
import sys
import shutil

p = getpass()
newhash = crypt(p, METHOD_SHA512)
with NTF(delete=False) as out:
    filename = out.name
    with open('/etc/shadow') as shadow:
        for line in shadow:
            parts = line.split(':')
            if parts[0] == 'root':
                parts[1] = newhash
            out.write(':'.join(parts))
shutil.move(filename, '/etc/shadow')
