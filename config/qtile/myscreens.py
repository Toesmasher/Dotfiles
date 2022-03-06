import os.path

from libqtile.config import Screen

import mybars

__wallpaper = os.path.expanduser("~/pictures/wallpapers/Mountain.png")

__screens = [
    Screen(
        top = mybars.get_main_bar(),
        wallpaper = __wallpaper,
        wallpaper_mode = "fill",
    ),
    Screen(
        wallpaper = __wallpaper,
        wallpaper_mode = "fill",
    )
]

def get_screens():
    return __screens
