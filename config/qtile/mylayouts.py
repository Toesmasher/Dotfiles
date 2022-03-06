from libqtile import layout
from libqtile.config import Match

import mylooks

__floating = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),    # gitk
        Match(wm_class="makebranch"),    # gitk
        Match(wm_class="maketag"),    # gitk
        Match(wm_class="ssh-askpass"),    # ssh-askpass
        Match(title="branchdialog"),    # gitk
        Match(title="pinentry"),    # GPG key password entry
    ]

)

__layouts = [
    layout.MonadTall(
        name = "MonadTall",
        **(mylooks.get_layout_theme())
    ),
    layout.VerticalTile(
        name = "VerticalTile",
        **(mylooks.get_layout_theme())
    ),
]

def get_layouts():
    return __layouts

def get_floating_layout():
    return __floating
