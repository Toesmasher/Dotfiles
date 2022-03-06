from libqtile import bar, widget

import mylooks

__colors = mylooks.get_colors()

def __widget_color(c: str):
    return  [ __colors[c], __colors[c] ]

def __arrowbox_left(fromcolor: str, tocolor: str):
    return widget.TextBox(
        padding = -2,
        fontsize = 28,
        text = "",
        foreground = __widget_color(tocolor),
        background = __widget_color(fromcolor)
    )

def __arrowbox_right(fromcolor: str, tocolor: str):
    return widget.TextBox(
        padding = -2,
        fontsize = 28,
        text = "",
        foreground = __widget_color(fromcolor),
        background = __widget_color(tocolor)
    )

__newbar = bar.Bar(
    [
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = __widget_color("dark"),
            background = __widget_color("bright"),
        ),
        widget.GroupBox(
            foreground = __widget_color("dark"),
            background = __widget_color("bright"),

            highlight_method = 'block',
            urgent_alert_method = 'block',
        ),
        __arrowbox_right('bright', 'dark'),
        widget.Sep(
            linewidth = 0,
            padding = 40,
            foreground = __widget_color("bright"),
            background = __widget_color("dark"),
        ),
        widget.WindowName(
            padding = 0,
            foreground = __widget_color("purple"),
            background = __widget_color("dark"),
        ),
        widget.Systray(
            padding = 0,
            background = __widget_color("dark"),
        ),
        __arrowbox_left("dark", "yellow"),
        widget.Memory(
            padding = 0,
            foreground = __widget_color("dark"),
            background = __widget_color("yellow"),
        ),
        __arrowbox_left("yellow", "orange"),
        widget.TextBox(
            padding = 0,
            fontsize = 35,
            text = '',
            foreground = __widget_color("dark"),
            background = __widget_color("orange"),
        ),
        widget.Volume(
            padding = 5,
            foreground = __widget_color("dark"),
            background = __widget_color("orange"),
        ),
        __arrowbox_left("orange", "red"),
        widget.Clock(
            padding = 6,
            format = "%Y-%m-%d %H:%M",
            foreground = __widget_color("dark"),
            background = __widget_color("red"),
        ),
    ],
    24
    # f85d f85e
)

__mainbar = bar.Bar(
    [
        widget.GroupBox(),
        widget.WindowName(),
        widget.Systray(),
        widget.Volume(),
        widget.Clock(format="%Y-%m-%d %H:%M"),
    ],
    24,
    # border_width=[2, 0, 2, 0],    # Draw top and bottom borders
    # border_color=["ff00ff", "000000", "ff00ff", "000000"]    # Borders are magenta
)

def get_main_bar():
    return __newbar
