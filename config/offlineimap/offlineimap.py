#!/usr/bin/env python
import subprocess

def get_pass(account):
    return subprocess.check_output("pass " + account, shell=True).splitlines()[0]
