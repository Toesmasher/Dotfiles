from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy
from libqtile.core.manager import Qtile
from libqtile.utils import guess_terminal
from typing import Callable

import mygroups

def __go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in '1234':
            qtile.focus_screen(0)
        else:
            qtile.focus_screen(1)
        qtile.groups_map[name].cmd_toscreen()

    return _inner

__terminal = guess_terminal()
__mod = "mod4"

__mouse = [
    Drag([__mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([__mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([__mod], "Button2", lazy.window.bring_to_front()),
]

__keys = [
    Key([__mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([__mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([__mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([__mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([__mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([__mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([__mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([__mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([__mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([__mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([__mod, "control"], "j", lazy.layout.cmd_shrink(), desc="Grow window down"),
    Key([__mod, "control"], "k", lazy.layout.cmd_grow(), desc="Grow window up"),
    Key([__mod], "n",            lazy.layout.normalize(), desc="Reset all window sizes"),

    # Window control
    Key([__mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([__mod], "f", lazy.window.toggle_fullscreen(), desc="Window to fullscreen"),

    # QTile control
    Key([__mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([__mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Program starters
    Key([__mod], "Return", lazy.spawn(__terminal), desc="Launch terminal"),
    Key([__mod], "r", lazy.spawn("rofi -show combi"), desc="Rofi"),

    # Media keys
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pulsemixer --change-volume +5"), desc="Raise volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pulsemixer --change-volume -5"), desc="Lower volume"),
    Key([], "XF86AudioMute"       , lazy.spawn("pulsemixer --toggle-mute"), desc="Mute audio"),
]

for i in mygroups.get_groups():
    __keys.append(Key([__mod],          i.name, lazy.function(__go_to_group(i.name))))
    __keys.append(Key([__mod, "shift"], i.name, lazy.window.togroup(i.name)))

def get_keys():
    return __keys

def get_mouse():
    return __mouse
