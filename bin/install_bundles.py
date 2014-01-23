#!/usr/bin/env python

import sys
import os


def usage():
    print "Usage: %s <file>\n" % (sys.argv[0])
    quit()


if len(sys.argv) == 1:
    usage()


def hub_clone(repository, target="bundle"):
    directory = os.path.basename(repository)
    print "* hub clone %s %s/%s" % (repository, target, directory)
    output = os.system("hub clone %s %s/%s" % (repository, target, directory))
    if output != 0:
        print "Couldn't clone %s" % repository


def read_config(config):
    with open(config, 'r') as f:
        cloned = [hub_clone(line.strip()) for line in f.readlines() if not line.startswith("#")]
    

read_config(sys.argv[1])
