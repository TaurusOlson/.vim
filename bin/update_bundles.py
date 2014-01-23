#!/usr/bin/env python


import os


def update(repository):
    output = os.system("cd bundle/%s && git pull origin master && cd .." % repository)
    return output


updated = map(update, os.listdir("bundle"))
