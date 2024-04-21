#!/usr/bin/env python
import subprocess

def get_pass(account):
    return subprocess.check_output("pass " + account, shell=True).splitlines()[0]

def get_token(account):
    return subprocess.check_output("pass " + account, shell=True).decode().splitlines()[0]
