__colors = dict(
    dark =    "#282A36", # Dracula background
    bright =  "#f1ffff",
    
    darkred = "#AD343E",
    red =     "#F76E5C",

    orange =  "#F39C12",
    yellow =  "#F7DC6F",

    purple =  "#8D62A9",
    blue =    "#6790EB",
)

__layout_theme = {
    "margin": 5,
    "border_width": 2,
    "border_focus": __colors["blue"],
    "border_normal": __colors["dark"],
}

__widget_defaults = dict(
    font="Hack Nerd Font Mono",
    fontsize=16,
    padding=3,
)
__extension_defaults = __widget_defaults.copy()

def get_colors():
    return __colors

def get_layout_theme():
    return __layout_theme

def get_widget_defaults():
    return __widget_defaults

def get_extension_defaults():
    return __extension_defaults
