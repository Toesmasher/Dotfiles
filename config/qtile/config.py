# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os.path
import subprocess

import mygroups
import myinput
import mylayouts
import mylooks
import myscreens

from libqtile import hook

# Input
keys = myinput.get_keys() 
mouse = myinput.get_mouse()

# Groups
groups = mygroups.get_groups()

# Layouts
layouts = mylayouts.get_layouts()
floating_layout = mylayouts.get_floating_layout()

# Screens
screens = myscreens.get_screens()

# Various looks
widget_defaults = mylooks.get_widget_defaults() 
extension_defaults = mylooks.get_extension_defaults()

# Dynamic groups
dgroups_key_binder = None
dgroups_app_rules = []

# Mouse behavior
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False


auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# Fake name for java stuff
wmname = "LG3D"

@hook.subscribe.startup_once
def startup():
    startfile = os.path.expanduser("~/.config/qtile/startup.sh")
    subprocess.run([startfile])