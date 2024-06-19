#!/usr/bin/env python

import json
import os
import os.path
import re

cwd = os.getcwd()

proj_dirs_regexps = [ "net\\.volvo\\.vms\\.libraries\\..*", "net\\.volvo\\.vms\\.services\\..*", "net\\.volvo\\.vms\\.canlets\\..*" ]
source_files_regexps = [ ".*\\.c", ".*\\.cpp", ".*\\.h", ".*\\.hpp" ]

def is_lib_dir(d: str):
    for r in lib_dirs_regexps:
        if re.search(r, d):
            return True

    return False

# Find all libraries and projects
projs = []
for f in os.listdir(cwd):
    full_path = os.path.join(cwd, f)
    if os.path.isdir(full_path):
        for r in proj_dirs_regexps:
            if re.search(r, f):
                projs.append(full_path)

# Build common args
cc_args = [ "/usr/bin/clang++" ]
for d in projs:
    cc_args.append("-I%s/include" % (d))

cc = []
for p in projs:
    proj_files = []
    final_args = cc_args.copy()
    for dir, _, files in os.walk(os.path.join(p, "src")):
        for r in source_files_regexps:
            for f in files:
                if re.search(r, f):
                    proj_files.append(os.path.join(dir, f))

    final_args.append("-I%s/build/generated-src" % p)

    for f in proj_files:
        cc.append({
            "directory": cwd,
            "file": f,
            "arguments": final_args
        })

print(json.dumps(cc, indent=4))
