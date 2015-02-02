#! /usr/bin/env python

import sys

def check_python_version(): 
    """Abort if we are running on python < v2.0"""
    too_old_error = """This program requires python v2.0 or greater. 
Your version of python is: %s""" % sys.version
    try: 
        version = sys.version_info  # we might not even have this function! :)
        if (version[0] < 2):
            print too_old_error
            sys.exit(1)
    except AttributeError:
        print too_old_error
        sys.exit(1)

# define & run this early - 'distutils.core' requires Python >= 2.0
check_python_version()  
from distutils.core import setup

setup(name="archivemail",
      version="0.9.0",
      description="archive and compress old email",
      license="GNU GPL",
      url="http://archivemail.sourceforge.net/",
      author="Paul Rodger",
      author_email="paul@paulrodger.com",
      maintainer="Nikolaus Schulz, Peter Poeml",
      maintainer_email="nikosch@users.sourceforge.net, poeml@users.sourceforge.net",
      scripts=["archivemail"],
      data_files=[("share/man/man1", ["archivemail.1"])],
      )
